

import osproc, strutils, asyncdispatch, streams, npeg, tables, times, algorithm, deques, strformat


{.experimental: "codeReordering".}


type
  
  uint8_t = uint8
  uint16_t = uint16
  uint32_t = uint32

  Lowpass[T] = object
    len: int
    hist: Deque[T]
    val: T

  Scandata = object
    address: string
    company: string
    rssi: int
    name: string
    complete: bool

  Device = ref object
    #sd: Scandata
    address: string
    name: string
    company: string
    rssiRaw: int
    rssi: array[2, Lowpass[float]]
    age: int
    time: DateTime

  Devices = OrderedTable[string, Device]



proc loadOuis(): Table[string, string] =
  var ouis: Table[string, string]
  let p = peg line:
    line <- >mac * +Space * >+Graph * +Space * >name:
      ouis[$1] = $2
    mac <- +(Xdigit | ":")
    name <- +1
  for l in lines("oui.txt"):
    discard p.match(l)
  result = ouis


proc loadNames(): Table[string, string] =
  var names: Table[string, string]
  let p = peg line:
    line <- >mac * " " * >name:
      names[$1] = $2
    mac <- +(Xdigit | ':')
    name <- +1
  for l in lines("names"):
    discard p.match(l)
  result = names


var
  ouis = loadOuis()
  names = loadNames()


proc initLowpass[T](len: int): Lowpass[T] =
  result.len = len


proc put[T](a: var Lowpass[T], val: T) =
  while a.hist.len >= a.len:
    discard a.hist.popFirst
  while a.hist.len < a.len:
    a.hist.addLast val
  a.val = 0
  for v in a.hist:
    a.val += v
  a.val /= a.len.T


proc get[T](a: Lowpass[T]): T = a.val


proc dumpAddress(d: Device): string =
  result = "[\e[37m" & d.address & "\e[0m]"


proc dumpRSSI(d: Device): string =
  const w = 10
  const rssiMin = -100
  const rssiMax =  -40
  let r = d.rssi[0].get
  let x = (w.float * (rssiMin - r) / (rssiMin - rssiMax)).int
  var color: string
  if x > 5: color = "\e[32m"
  elif x > 2: color = "\e[33m"
  else: color = "\e[31m"
  result = color & &"{d.rssi[0].get:3.1f} " & repeat("■", x) & repeat("□", w-x) & "\e[0m"


proc dumpRelRSSI(d: Device): string =
  const w = 10
  var r = (d.rssi[0].get - d.rssi[1].get).int
  if r < -w: r = -w
  if r >  w: r =  w
  var color = "\e[34m"
  if r <= -5 or r >= 5: color = "\e[1m"
  
  var c = "■"
  if r < 0: c = "◀︎"
  if r > 0: c = "▶︎"
  result = color & "┠" & repeat("┄", w+r) & c & repeat("┄", w-r) & "┤" & "\e[0m"


proc dumpAge(d: Device): string =
  let m = d.age div 60
  let s = d.age mod 60
  var color: string
  if d.age < 10: color = "\e[1;32m"
  elif d.age < 30: color= "\e[1;33m"
  else: color = "\e[1;31m"
  result = color & &"{m:2d}:{s:02d}" & "\e[0m"


proc dumpName(d: Device): string =
  let a = d.address

  if a in names:
    return "\e[37;1m" & names[a] & "\e[0m"
  
  if d.name.len > 0:
    return "\e[1;30m" & d.name & "\e[0m"
  
  if d.company.len > 0:
    return "\e[1;30m" & d.company & "\e[0m"

  let oui = a[0..7]
  if oui in ouis:
    return "\e[1;30m" & ouis[oui] & "\e[0m"
 
  return "\e[1;30m-\e[0m"
  


proc dump(d: Device, names: Table[string, string]): string =


  var fields: seq[string]

  fields.add d.dumpAddress
  fields.add d.dumpAge
  fields.add d.dumpRelRSSI
  fields.add d.dumpRSSI
  fields.add d.dumpName

  fields.join(" ")


proc dump(devices: var Devices) =

  names = loadNames()
  var drops: seq[string]

  echo "\e[H"

  for a, d in devices:

    d.rssi[0].put d.rssiRaw.float
    d.rssi[1].put d.rssiRaw.float
    d.age = (now() - d.time).inSeconds.int

    if d.age < 5 * 60:
      echo d.dump(names) & "\e[K"
    else:
      drops.add a

  echo "\e[0J"

  for a in drops:
    devices.del a


proc scan() =

  let p = peg("btmon", sd: Scandata):
    btmon <- next | @(address | rssi | name | company)
    next <- ">":
      sd.name = ""
    address <- "Address: " * >17:
      sd.address = $1
    name <- "Name (complete): " * >+1:
      sd.name = $1
    company <- "Company: " * >+(1-" ("):
      if $1 != "not assigned":
        sd.company = $1
    rssi <- "RSSI: " * >("-" * +Digit):
      sd.rssi = parseInt($1)
      sd.complete = true

  let lescan = startProcess(
      command = "sudo", 
      args = [ "btmon" ],
      options = { poUsePath, poStdErrToStdOut }
    )

  let s = lescan.outputStream
    
  var sd: ScanData
  var devices: Devices
  var tdump = now()

  while true:
    let l = s.readLine()
    discard p.match(l, sd)
    if sd.complete:
      let a = sd.address
      if a notin devices:
        devices[a] = Device(address: a, time: now(), rssi: [
          initLowpass[float](20),
          initLowpass[float](100),
        ])
      let dev = devices[a]
      dev.rssiRaw = sd.rssi
      dev.time = now()
      if sd.name.len > 0 and dev.name.len == 0:
        dev.name = sd.name
      if sd.company.len > 0 and dev.company.len == 0:
        dev.company = sd.company
      sd.complete = false

    if now() > tdump:
      dump(devices)
      tdump = now() + 250.milliSeconds

echo "\e[2J"
scan()
