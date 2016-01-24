#!/system/bin/sh

sleep 2

insmod /data/temp/mxt.ko

cd /sys/bus/i2c/devices/5-004a

chown root root *
chmod 666 update_cfg
#chmod 666 update_fw

#format: [family id]_[variant id]_[version]_[build].fw
#format: [family id]_[variant id]_[version]_[build].raw

#UID for config match
#format: [family id]_[variant id]_[version]_[build].raw.[UID TAG]
echo "2" > t19

#enable f/w upgrade
#echo "A4_15_2.2_AA.fw" > update_fw

#update new config
echo "A4_15_2.2_AA.raw" > update_cfg

#for pid (pid name = 01)
#    switch to "A4_15_2.1_AA.raw.01"

sleep 1

#enable plugin
#
#format: pl enable [hex]
#[0] : CAL
#[1] : MSC
#[2] : PI
#[3] : CLIP
#[4] : PLUG PAUSE
echo "pl enable 6" > plugin

#PTC auto tune (should enable MSC above,sleep 5s for tune complete)
#[0] : tune not store
#[1] : tune and store
#[2] : re-tune and not store
#[3] : re-tune and store
#[other value] : report tune status 
#echo "msc ptc tune 1" > plugin
#sleep 7

#set gesture list
#format: <name> <val>;<name> <val>;...
#you could run command "cat gesture_list" for current config list
#<val>: bit[0]: enable
#	bit[1]: disable, 
#	bit[3]  status (1: excuted)
#echo "LEFT 1;UNLOCK0 1;e 1;" > gesture_list
echo "TAP 1;" > gesture_list

#enable gesture feature
#echo 1 > en_gesture

#echo "pl enable 7" > plugin
chmod 440 update_cfg
#chmod 440 update_fw

