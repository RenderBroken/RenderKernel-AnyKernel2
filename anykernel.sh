# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=Render Kernel by RenderBroken!
do.devicecheck=0
do.initd=0
do.modules=0
do.system_blobs=0
do.cleanup=1
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=

# shell variables
block=/dev/block/bootdevice/by-name/boot;
add_seandroidenforce=0
is_slot_device=0;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk

## AnyKernel install
dump_boot;

# begin ramdisk changes

### DEBUGGING ONLY!!!! ###
# backup_file default.prop
# replace_line default.prop "ro.debuggable=0" "ro.debuggable=1";
# replace_line default.prop "ro.adb.secure=1" "ro.adb.secure=0";
# replace_line default.prop "ro.secure=1" "ro.secure=0";
### DEBUGGING ONLY!!!! ###

# init.rc
backup_file init.rc
remove_line init.rc "    mkdir /dev/stune/system-background"
remove_line init.rc "    chown system system /dev/stune/system-background"
remove_line init.rc "    chown system system /dev/stune/system-background/tasks"
remove_line init.rc "    chmod 0664 /dev/stune/system-background/tasks"
remove_line init.rc "    mkdir /dev/cpuset/system-background"
remove_line init.rc "    write /dev/cpuset/system-background/cpus 0"
remove_line init.rc "    write /dev/cpuset/system-background/mems 0"
remove_line init.rc "    chown system system /dev/cpuset/system-background"
remove_line init.rc "    chown system system /dev/cpuset/system-background/tasks"
remove_line init.rc "    chmod 0775 /dev/cpuset/system-background"
remove_line init.rc "    chmod 0664 /dev/cpuset/system-background/tasks"

# init.qcom.rc
backup_file init.qcom.rc
remove_line init.qcom.rc "    start perfd"

# init.qcom.power.rc
backup_file init.qcom.power.rc;
replace_file init.qcom.power.rc 0755 init.qcom.power.rc;

# end ramdisk changes

write_boot;

## end install

