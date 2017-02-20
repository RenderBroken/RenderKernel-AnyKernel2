# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=Render Kernel by RenderBroken!
do.devicecheck=0
do.initd=0
do.modules=0
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

# init.rc
backup_file init.qcom.power.rc;
replace_file init.qcom.power.rc 0755 init.qcom.power.rc;

# end ramdisk changes

write_boot;

## end install

