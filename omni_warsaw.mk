#
# Copyright 2020 The Android Open Source Project
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
#

# Local path
DEVICE_PATH := device/huawei/warsaw

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Copy the Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/rootdir,root)

# Copy the Kernel
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/dummykernel:kernel

# Override Default Properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.sys.usb.config=mtp,adb \
    ro.allow.mock.location=0 \
    ro.debuggable=1

# Display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Device
PRODUCT_NAME := omni_warsaw
PRODUCT_DEVICE := warsaw
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := P10 Lite
PRODUCT_MANUFACTURER := Huawei
