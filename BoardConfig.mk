#
# Copyright (C) 2017 The LineageOS Project
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

TARGET_OTA_ASSERT_DEVICE := a3y17lte,a3y17ltexc,a3y17ltexx,a3y17ltelk

TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)/releasetools

# Inherit from Exynos7870-common
include device/samsung/exynos7870-common/BoardConfigCommon.mk

# Init
TARGET_INIT_VENDOR_LIB := libinit_a3y17lte

# Path
LOCAL_PATH := device/samsung/a3y17lte
TARGET_COPY_OUT_VENDOR := system/vendor

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/a3y17lte/sepolicy

# Hidl
#DEVICE_MANIFEST_FILE := device/samsung/a3y17lte/configs/manifest/manifest.xml

# Properties
TARGET_SYSTEM_PROP += $(LOCAL_PATH)/system.prop

# Inherit from the proprietary version
-include vendor/samsung/a3y17lte/BoardConfigVendor.mk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAS_QCA_BT_ROME := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
QCOM_BT_USE_BTNV := true
QCOM_BT_USE_SMD_TTY := true

# Fingerprint
TARGET_SEC_FP_HAL_VARIANT := bauth

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/exynos7870
TARGET_KERNEL_CONFIG := lineage-a3y17lte_defconfig

# Partition Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3072000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE := 4096

# Use dedicated /cache partition instead of /data/cache
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4

# Release tools extention
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)/releasetools

# Shim
TARGET_LD_SHIM_LIBS += \
    /system/lib/libbauthserver.so|/system/vendor/lib/libbauthtzcommon_shim.so
# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
WIFI_DRIVER_MODULE_NAME          := wlan
WIFI_DRIVER_MODULE_PATH          := /modules/qca_cld/qca_cld_wlan.ko
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WPA_SUPPLICANT_USE_HIDL          := true

# Wifi loader
BOARD_HAVE_SAMSUNG_WIFI := true
