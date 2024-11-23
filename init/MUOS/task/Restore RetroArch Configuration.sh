#!/bin/sh
# HELP: Restore the default RetroArch global settings and hotkeys (retroarch.cfg). Per-system core overrides will not be modified.
# ICON: retroarch

. /opt/muos/script/var/func.sh

pkill -STOP muxtask

echo "Restoring RetroArch Configuration"
rm -f /run/muos/storage/info/config/retroarch.cfg

# control.sh recreates retroarch.cfg from retroarch.default.cfg.
/opt/muos/device/current/script/control.sh

# Modify the default RetroArch configuration
RA_CONV=/opt/muos/device/current/script/ra_convert.sh
[ -f "$RA_CONV" ] && "$RA_CONV"

echo "Sync Filesystem"
sync

echo "All Done!"
sleep 2

pkill -CONT muxtask
exit 0
