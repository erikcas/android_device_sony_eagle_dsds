# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm

# Assert
TARGET_OTA_ASSERT_DEVICE := D2302,eagle,eagle_dsds

# DSDS specific properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds \
    persist.multisim.config=dsds \
    telephony.lteOnCdmaDevice=0 \
    ro.telephony.default_network=0,1

# DSDS second ril start script
PRODUCT_COPY_FILES += \
    device/sony/eagle_dsds/rootdir/init.class_main.sh:root/init.class_main.sh

# TWRP Recovery
DEVICE_RESOLUTION := 540x960
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"

# Inherit AOSP Yukon common device parts
$(call inherit-product, device/sony/eagle_dsds/aosp_d2303.mk)

# Inherit Omni Yukon common device parts
$(call inherit-product, device/sony/yukon-common/device_omni.mk)

# Inherit Omni GSM telephony parts
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit Omni product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit gapps
$(call inherit-product, vendor/apps/vendor-google.mk)

# Recovery
PRODUCT_COPY_FILES += \
    device/sony/eagle_dsds/recovery/root/etc/bootrec-device:recovery/root/etc/bootrec-device \
    device/sony/eagle_dsds/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# Override Product Name for OmniROM
PRODUCT_NAME := omni_eagle_dsds
PRODUCT_MODEL := Xperia M2
