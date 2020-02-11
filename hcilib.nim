##
##
##   BlueZ - Bluetooth protocol stack for Linux
##
##   Copyright (C) 2000-2001  Qualcomm Incorporated
##   Copyright (C) 2002-2003  Maxim Krasnyansky <maxk@qualcomm.com>
##   Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
##
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
##
##


type
  uint8_t = uint8
  uint16_t = uint16
  uint32_t {.header:"bluetooth.h".} = uint32

  hci_request* {.importc: "hci_request", header: "hci_lib.h", bycopy.} = object
    ogf* {.importc: "ogf".}: uint16_t
    ocf* {.importc: "ocf".}: uint16_t
    event* {.importc: "event".}: cint
    cparam* {.importc: "cparam".}: pointer
    clen* {.importc: "clen".}: cint
    rparam* {.importc: "rparam".}: pointer
    rlen* {.importc: "rlen".}: cint

  hci_version* {.importc: "hci_version", header: "hci_lib.h", bycopy.} = object
    manufacturer* {.importc: "manufacturer".}: uint16_t
    hci_ver* {.importc: "hci_ver".}: uint8_t
    hci_rev* {.importc: "hci_rev".}: uint16_t
    lmp_ver* {.importc: "lmp_ver".}: uint8_t
    lmp_subver* {.importc: "lmp_subver".}: uint16_t


proc hci_open_dev*(dev_id: cint): cint {.importc: "hci_open_dev", header: "hci_lib.h".}
#proc hci_close_dev*(dd: cint): cint {.importc: "hci_close_dev", header: "hci_lib.h".}
#proc hci_send_cmd*(dd: cint; ogf: uint16_t; ocf: uint16_t; plen: uint8_t; param: pointer): cint {.
#    importc: "hci_send_cmd", header: "hci_lib.h".}
#proc hci_send_req*(dd: cint; req: ptr hci_request; timeout: cint): cint {.
#    importc: "hci_send_req", header: "hci_lib.h".}
#proc hci_create_connection*(dd: cint; bdaddr: ptr bdaddr_t; ptype: uint16_t;
#                           clkoffset: uint16_t; rswitch: uint8_t;
#                           handle: ptr uint16_t; to: cint): cint {.
#    importc: "hci_create_connection", header: "hci_lib.h".}
#proc hci_disconnect*(dd: cint; handle: uint16_t; reason: uint8_t; to: cint): cint {.
#    importc: "hci_disconnect", header: "hci_lib.h".}
#proc hci_inquiry*(dev_id: cint; len: cint; num_rsp: cint; lap: ptr uint8_t;
#                 ii: ptr ptr inquiry_info; flags: clong): cint {.
#    importc: "hci_inquiry", header: "hci_lib.h".}
#proc hci_devinfo*(dev_id: cint; di: ptr hci_dev_info): cint {.importc: "hci_devinfo",
#    header: "hci_lib.h".}
#proc hci_devba*(dev_id: cint; bdaddr: ptr bdaddr_t): cint {.importc: "hci_devba",
#    header: "hci_lib.h".}
#proc hci_devid*(str: cstring): cint {.importc: "hci_devid", header: "hci_lib.h".}
#proc hci_read_local_name*(dd: cint; len: cint; name: cstring; to: cint): cint {.
#    importc: "hci_read_local_name", header: "hci_lib.h".}
#proc hci_write_local_name*(dd: cint; name: cstring; to: cint): cint {.
#    importc: "hci_write_local_name", header: "hci_lib.h".}
#proc hci_read_remote_name*(dd: cint; bdaddr: ptr bdaddr_t; len: cint; name: cstring;
#                          to: cint): cint {.importc: "hci_read_remote_name",
#    header: "hci_lib.h".}
#proc hci_read_remote_name_with_clock_offset*(dd: cint; bdaddr: ptr bdaddr_t;
#    pscan_rep_mode: uint8_t; clkoffset: uint16_t; len: cint; name: cstring; to: cint): cint {.
#    importc: "hci_read_remote_name_with_clock_offset", header: "hci_lib.h".}
#proc hci_read_remote_name_cancel*(dd: cint; bdaddr: ptr bdaddr_t; to: cint): cint {.
#    importc: "hci_read_remote_name_cancel", header: "hci_lib.h".}
#proc hci_read_remote_version*(dd: cint; handle: uint16_t; ver: ptr hci_version; to: cint): cint {.
#    importc: "hci_read_remote_version", header: "hci_lib.h".}
#proc hci_read_remote_features*(dd: cint; handle: uint16_t; features: ptr uint8_t;
#                              to: cint): cint {.
#    importc: "hci_read_remote_features", header: "hci_lib.h".}
#proc hci_read_remote_ext_features*(dd: cint; handle: uint16_t; page: uint8_t;
#                                  max_page: ptr uint8_t; features: ptr uint8_t;
#                                  to: cint): cint {.
#    importc: "hci_read_remote_ext_features", header: "hci_lib.h".}
#proc hci_read_clock_offset*(dd: cint; handle: uint16_t; clkoffset: ptr uint16_t;
#                           to: cint): cint {.importc: "hci_read_clock_offset",
#    header: "hci_lib.h".}
#proc hci_read_local_version*(dd: cint; ver: ptr hci_version; to: cint): cint {.
#    importc: "hci_read_local_version", header: "hci_lib.h".}
#proc hci_read_local_commands*(dd: cint; commands: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_local_commands", header: "hci_lib.h".}
#proc hci_read_local_features*(dd: cint; features: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_local_features", header: "hci_lib.h".}
#proc hci_read_local_ext_features*(dd: cint; page: uint8_t; max_page: ptr uint8_t;
#                                 features: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_local_ext_features", header: "hci_lib.h".}
#proc hci_read_bd_addr*(dd: cint; bdaddr: ptr bdaddr_t; to: cint): cint {.
#    importc: "hci_read_bd_addr", header: "hci_lib.h".}
#proc hci_read_class_of_dev*(dd: cint; cls: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_class_of_dev", header: "hci_lib.h".}
#proc hci_write_class_of_dev*(dd: cint; cls: uint32_t; to: cint): cint {.
#    importc: "hci_write_class_of_dev", header: "hci_lib.h".}
#proc hci_read_voice_setting*(dd: cint; vs: ptr uint16_t; to: cint): cint {.
#    importc: "hci_read_voice_setting", header: "hci_lib.h".}
#proc hci_write_voice_setting*(dd: cint; vs: uint16_t; to: cint): cint {.
#    importc: "hci_write_voice_setting", header: "hci_lib.h".}
#proc hci_read_current_iac_lap*(dd: cint; num_iac: ptr uint8_t; lap: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_current_iac_lap", header: "hci_lib.h".}
#proc hci_write_current_iac_lap*(dd: cint; num_iac: uint8_t; lap: ptr uint8_t; to: cint): cint {.
#    importc: "hci_write_current_iac_lap", header: "hci_lib.h".}
#proc hci_read_stored_link_key*(dd: cint; bdaddr: ptr bdaddr_t; all: uint8_t; to: cint): cint {.
#    importc: "hci_read_stored_link_key", header: "hci_lib.h".}
#proc hci_write_stored_link_key*(dd: cint; bdaddr: ptr bdaddr_t; key: ptr uint8_t;
#                               to: cint): cint {.
#    importc: "hci_write_stored_link_key", header: "hci_lib.h".}
#proc hci_delete_stored_link_key*(dd: cint; bdaddr: ptr bdaddr_t; all: uint8_t; to: cint): cint {.
#    importc: "hci_delete_stored_link_key", header: "hci_lib.h".}
#proc hci_authenticate_link*(dd: cint; handle: uint16_t; to: cint): cint {.
#    importc: "hci_authenticate_link", header: "hci_lib.h".}
#proc hci_encrypt_link*(dd: cint; handle: uint16_t; encrypt: uint8_t; to: cint): cint {.
#    importc: "hci_encrypt_link", header: "hci_lib.h".}
#proc hci_change_link_key*(dd: cint; handle: uint16_t; to: cint): cint {.
#    importc: "hci_change_link_key", header: "hci_lib.h".}
#proc hci_switch_role*(dd: cint; bdaddr: ptr bdaddr_t; role: uint8_t; to: cint): cint {.
#    importc: "hci_switch_role", header: "hci_lib.h".}
#proc hci_park_mode*(dd: cint; handle: uint16_t; max_interval: uint16_t;
#                   min_interval: uint16_t; to: cint): cint {.
#    importc: "hci_park_mode", header: "hci_lib.h".}
#proc hci_exit_park_mode*(dd: cint; handle: uint16_t; to: cint): cint {.
#    importc: "hci_exit_park_mode", header: "hci_lib.h".}
#proc hci_read_inquiry_scan_type*(dd: cint; `type`: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_inquiry_scan_type", header: "hci_lib.h".}
#proc hci_write_inquiry_scan_type*(dd: cint; `type`: uint8_t; to: cint): cint {.
#    importc: "hci_write_inquiry_scan_type", header: "hci_lib.h".}
#proc hci_read_inquiry_mode*(dd: cint; mode: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_inquiry_mode", header: "hci_lib.h".}
#proc hci_write_inquiry_mode*(dd: cint; mode: uint8_t; to: cint): cint {.
#    importc: "hci_write_inquiry_mode", header: "hci_lib.h".}
#proc hci_read_afh_mode*(dd: cint; mode: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_afh_mode", header: "hci_lib.h".}
#proc hci_write_afh_mode*(dd: cint; mode: uint8_t; to: cint): cint {.
#    importc: "hci_write_afh_mode", header: "hci_lib.h".}
#proc hci_read_ext_inquiry_response*(dd: cint; fec: ptr uint8_t; data: ptr uint8_t;
#                                   to: cint): cint {.
#    importc: "hci_read_ext_inquiry_response", header: "hci_lib.h".}
#proc hci_write_ext_inquiry_response*(dd: cint; fec: uint8_t; data: ptr uint8_t; to: cint): cint {.
#    importc: "hci_write_ext_inquiry_response", header: "hci_lib.h".}
#proc hci_read_simple_pairing_mode*(dd: cint; mode: ptr uint8_t; to: cint): cint {.
#    importc: "hci_read_simple_pairing_mode", header: "hci_lib.h".}
#proc hci_write_simple_pairing_mode*(dd: cint; mode: uint8_t; to: cint): cint {.
#    importc: "hci_write_simple_pairing_mode", header: "hci_lib.h".}
#proc hci_read_local_oob_data*(dd: cint; hash: ptr uint8_t; randomizer: ptr uint8_t;
#                             to: cint): cint {.importc: "hci_read_local_oob_data",
#    header: "hci_lib.h".}
#proc hci_read_inq_response_tx_power_level*(dd: cint; level: ptr int8_t; to: cint): cint {.
#    importc: "hci_read_inq_response_tx_power_level", header: "hci_lib.h".}
#proc hci_read_inquiry_transmit_power_level*(dd: cint; level: ptr int8_t; to: cint): cint {.
#    importc: "hci_read_inquiry_transmit_power_level", header: "hci_lib.h".}
#proc hci_write_inquiry_transmit_power_level*(dd: cint; level: int8_t; to: cint): cint {.
#    importc: "hci_write_inquiry_transmit_power_level", header: "hci_lib.h".}
#proc hci_read_transmit_power_level*(dd: cint; handle: uint16_t; `type`: uint8_t;
#                                   level: ptr int8_t; to: cint): cint {.
#    importc: "hci_read_transmit_power_level", header: "hci_lib.h".}
#proc hci_read_link_policy*(dd: cint; handle: uint16_t; policy: ptr uint16_t; to: cint): cint {.
#    importc: "hci_read_link_policy", header: "hci_lib.h".}
#proc hci_write_link_policy*(dd: cint; handle: uint16_t; policy: uint16_t; to: cint): cint {.
#    importc: "hci_write_link_policy", header: "hci_lib.h".}
#proc hci_read_link_supervision_timeout*(dd: cint; handle: uint16_t;
#                                       timeout: ptr uint16_t; to: cint): cint {.
#    importc: "hci_read_link_supervision_timeout", header: "hci_lib.h".}
#proc hci_write_link_supervision_timeout*(dd: cint; handle: uint16_t;
#                                        timeout: uint16_t; to: cint): cint {.
#    importc: "hci_write_link_supervision_timeout", header: "hci_lib.h".}
#proc hci_set_afh_classification*(dd: cint; map: ptr uint8_t; to: cint): cint {.
#    importc: "hci_set_afh_classification", header: "hci_lib.h".}
#proc hci_read_link_quality*(dd: cint; handle: uint16_t; link_quality: ptr uint8_t;
#                           to: cint): cint {.importc: "hci_read_link_quality",
#    header: "hci_lib.h".}
#proc hci_read_rssi*(dd: cint; handle: uint16_t; rssi: ptr int8_t; to: cint): cint {.
#    importc: "hci_read_rssi", header: "hci_lib.h".}
#proc hci_read_afh_map*(dd: cint; handle: uint16_t; mode: ptr uint8_t; map: ptr uint8_t;
#                      to: cint): cint {.importc: "hci_read_afh_map",
#                                     header: "hci_lib.h".}
#proc hci_read_clock*(dd: cint; handle: uint16_t; which: uint8_t; clock: ptr uint32_t;
#                    accuracy: ptr uint16_t; to: cint): cint {.
#    importc: "hci_read_clock", header: "hci_lib.h".}
#proc hci_le_set_scan_enable*(dev_id: cint; enable: uint8_t; filter_dup: uint8_t;
#                            to: cint): cint {.importc: "hci_le_set_scan_enable",
#    header: "hci_lib.h".}
proc hci_le_set_scan_parameters*(dev_id: cint; `type`: uint8_t; interval: uint16_t;
                                window: uint16_t; own_type: uint8_t;
                                filter: uint8_t; to: cint): cint {.
    importc: "hci_le_set_scan_parameters", header: "hci_lib.h".}
#proc hci_le_set_advertise_enable*(dev_id: cint; enable: uint8_t; to: cint): cint {.
#    importc: "hci_le_set_advertise_enable", header: "hci_lib.h".}
#proc hci_le_create_conn*(dd: cint; interval: uint16_t; window: uint16_t;
#                        initiator_filter: uint8_t; peer_bdaddr_type: uint8_t;
#                        peer_bdaddr: bdaddr_t; own_bdaddr_type: uint8_t;
#                        min_interval: uint16_t; max_interval: uint16_t;
#                        latency: uint16_t; supervision_timeout: uint16_t;
#                        min_ce_length: uint16_t; max_ce_length: uint16_t;
#                        handle: ptr uint16_t; to: cint): cint {.
#    importc: "hci_le_create_conn", header: "hci_lib.h".}
#proc hci_le_conn_update*(dd: cint; handle: uint16_t; min_interval: uint16_t;
#                        max_interval: uint16_t; latency: uint16_t;
#                        supervision_timeout: uint16_t; to: cint): cint {.
#    importc: "hci_le_conn_update", header: "hci_lib.h".}
#proc hci_le_add_white_list*(dd: cint; bdaddr: ptr bdaddr_t; `type`: uint8_t; to: cint): cint {.
#    importc: "hci_le_add_white_list", header: "hci_lib.h".}
#proc hci_le_rm_white_list*(dd: cint; bdaddr: ptr bdaddr_t; `type`: uint8_t; to: cint): cint {.
#    importc: "hci_le_rm_white_list", header: "hci_lib.h".}
#proc hci_le_read_white_list_size*(dd: cint; size: ptr uint8_t; to: cint): cint {.
#    importc: "hci_le_read_white_list_size", header: "hci_lib.h".}
#proc hci_le_clear_white_list*(dd: cint; to: cint): cint {.
#    importc: "hci_le_clear_white_list", header: "hci_lib.h".}
#proc hci_le_add_resolving_list*(dd: cint; bdaddr: ptr bdaddr_t; `type`: uint8_t;
#                               peer_irk: ptr uint8_t; local_irk: ptr uint8_t; to: cint): cint {.
#    importc: "hci_le_add_resolving_list", header: "hci_lib.h".}
#proc hci_le_rm_resolving_list*(dd: cint; bdaddr: ptr bdaddr_t; `type`: uint8_t; to: cint): cint {.
#    importc: "hci_le_rm_resolving_list", header: "hci_lib.h".}
#proc hci_le_clear_resolving_list*(dd: cint; to: cint): cint {.
#    importc: "hci_le_clear_resolving_list", header: "hci_lib.h".}
#proc hci_le_read_resolving_list_size*(dd: cint; size: ptr uint8_t; to: cint): cint {.
#    importc: "hci_le_read_resolving_list_size", header: "hci_lib.h".}
#proc hci_le_set_address_resolution_enable*(dev_id: cint; enable: uint8_t; to: cint): cint {.
#    importc: "hci_le_set_address_resolution_enable", header: "hci_lib.h".}
#proc hci_le_read_remote_features*(dd: cint; handle: uint16_t; features: ptr uint8_t;
#                                 to: cint): cint {.
#    importc: "hci_le_read_remote_features", header: "hci_lib.h".}
#proc hci_for_each_dev*(flag: cint;
#                      `func`: proc (dd: cint; dev_id: cint; arg: clong): cint; arg: clong): cint {.
#    importc: "hci_for_each_dev", header: "hci_lib.h".}
#proc hci_get_route*(bdaddr: ptr bdaddr_t): cint {.importc: "hci_get_route",
#    header: "hci_lib.h".}
#proc hci_bustostr*(bus: cint): cstring {.importc: "hci_bustostr", header: "hci_lib.h".}
#proc hci_typetostr*(`type`: cint): cstring {.importc: "hci_typetostr",
#    header: "hci_lib.h".}
#proc hci_dtypetostr*(`type`: cint): cstring {.importc: "hci_dtypetostr",
#    header: "hci_lib.h".}
#proc hci_dflagstostr*(flags: uint32_t): cstring {.importc: "hci_dflagstostr",
#    header: "hci_lib.h".}
#proc hci_ptypetostr*(ptype: cuint): cstring {.importc: "hci_ptypetostr",
#    header: "hci_lib.h".}
#proc hci_strtoptype*(str: cstring; val: ptr cuint): cint {.importc: "hci_strtoptype",
#    header: "hci_lib.h".}
#proc hci_scoptypetostr*(ptype: cuint): cstring {.importc: "hci_scoptypetostr",
#    header: "hci_lib.h".}
#proc hci_strtoscoptype*(str: cstring; val: ptr cuint): cint {.
#    importc: "hci_strtoscoptype", header: "hci_lib.h".}
#proc hci_lptostr*(ptype: cuint): cstring {.importc: "hci_lptostr", header: "hci_lib.h".}
#proc hci_strtolp*(str: cstring; val: ptr cuint): cint {.importc: "hci_strtolp",
#    header: "hci_lib.h".}
#proc hci_lmtostr*(ptype: cuint): cstring {.importc: "hci_lmtostr", header: "hci_lib.h".}
#proc hci_strtolm*(str: cstring; val: ptr cuint): cint {.importc: "hci_strtolm",
#    header: "hci_lib.h".}
#proc hci_cmdtostr*(cmd: cuint): cstring {.importc: "hci_cmdtostr", header: "hci_lib.h".}
#proc hci_commandstostr*(commands: ptr uint8_t; pref: cstring; width: cint): cstring {.
#    importc: "hci_commandstostr", header: "hci_lib.h".}
#proc hci_vertostr*(ver: cuint): cstring {.importc: "hci_vertostr", header: "hci_lib.h".}
#proc hci_strtover*(str: cstring; ver: ptr cuint): cint {.importc: "hci_strtover",
#    header: "hci_lib.h".}
#proc lmp_vertostr*(ver: cuint): cstring {.importc: "lmp_vertostr", header: "hci_lib.h".}
#proc lmp_strtover*(str: cstring; ver: ptr cuint): cint {.importc: "lmp_strtover",
#    header: "hci_lib.h".}
#proc pal_vertostr*(ver: cuint): cstring {.importc: "pal_vertostr", header: "hci_lib.h".}
#proc pal_strtover*(str: cstring; ver: ptr cuint): cint {.importc: "pal_strtover",
#    header: "hci_lib.h".}
#proc lmp_featurestostr*(features: ptr uint8_t; pref: cstring; width: cint): cstring {.
#    importc: "lmp_featurestostr", header: "hci_lib.h".}
#proc hci_set_bit*(nr: cint; `addr`: pointer) {.inline.} =
#  (cast[ptr uint32_t](`addr`) + (nr shr 5))[] = (
#      cast[ptr uint32_t](`addr`) + (nr shr 5))[] or (1 shl (nr and 31))
#
#proc hci_clear_bit*(nr: cint; `addr`: pointer) {.inline.} =
#  (cast[ptr uint32_t](`addr`) + (nr shr 5))[] = (
#      cast[ptr uint32_t](`addr`) + (nr shr 5))[] and not (1 shl (nr and 31))
#
#proc hci_test_bit*(nr: cint; `addr`: pointer): cint {.inline.} =
#  return (cast[ptr uint32_t](`addr`) + (nr shr 5))[] and (1 shl (nr and 31))
#
###  HCI filter tools
#
#proc hci_filter_clear*(f: ptr hci_filter) {.inline.} =
#  memset(f, 0, sizeof((f[])))
#
#proc hci_filter_set_ptype*(t: cint; f: ptr hci_filter) {.inline.} =
#  hci_set_bit(if (t == HCI_VENDOR_PKT): 0 else: (t and HCI_FLT_TYPE_BITS),
#              addr(f.type_mask))
#
#proc hci_filter_clear_ptype*(t: cint; f: ptr hci_filter) {.inline.} =
#  hci_clear_bit(if (t == HCI_VENDOR_PKT): 0 else: (t and HCI_FLT_TYPE_BITS),
#                addr(f.type_mask))
#
#proc hci_filter_test_ptype*(t: cint; f: ptr hci_filter): cint {.inline.} =
#  return hci_test_bit(if (t == HCI_VENDOR_PKT): 0 else: (t and HCI_FLT_TYPE_BITS),
#                     addr(f.type_mask))
#
#proc hci_filter_all_ptypes*(f: ptr hci_filter) {.inline.} =
#  memset(cast[pointer](addr(f.type_mask)), 0x000000FF, sizeof((f.type_mask)))
#
#proc hci_filter_set_event*(e: cint; f: ptr hci_filter) {.inline.} =
#  hci_set_bit((e and HCI_FLT_EVENT_BITS), addr(f.event_mask))
#
#proc hci_filter_clear_event*(e: cint; f: ptr hci_filter) {.inline.} =
#  hci_clear_bit((e and HCI_FLT_EVENT_BITS), addr(f.event_mask))
#
#proc hci_filter_test_event*(e: cint; f: ptr hci_filter): cint {.inline.} =
#  return hci_test_bit((e and HCI_FLT_EVENT_BITS), addr(f.event_mask))
#
#proc hci_filter_all_events*(f: ptr hci_filter) {.inline.} =
#  memset(cast[pointer](f.event_mask), 0x000000FF, sizeof((f.event_mask)))
#
#proc hci_filter_set_opcode*(opcode: cint; f: ptr hci_filter) {.inline.} =
#  f.opcode = opcode
#
#proc hci_filter_clear_opcode*(f: ptr hci_filter) {.inline.} =
#  f.opcode = 0
#
#proc hci_filter_test_opcode*(opcode: cint; f: ptr hci_filter): cint {.inline.} =
#  return f.opcode == opcode
