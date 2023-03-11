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

LOCAL_PATH := device/samsung/a3y17lte

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
#TARGET_COPY_OUT += /system/vendor

# Manifest
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/manifest/manifest.xml:system/vendor/manifest.xml

# qca_cld_wlan
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/configs/wifi/android.hardware.wifi@1.0-service.rc:system/vendor/etc/init/android.hardware.wifi@1.0-service.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/grippower.info:system/vendor/etc/wlan/grippower.info \
    $(LOCAL_PATH)/configs/wifi/qcom_cfg.ini:system/vendor/etc/wlan/qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/vendor/etc/wlan/WCNSS_cfg.dat

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/grippower.info:system/vendor/firmware/wlan/grippower.info \
    $(LOCAL_PATH)/configs/wifi/qcom_cfg.ini:system/vendor/firmware/wlan/qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/WCNSS_cfg.dat

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/qca_cld_wlan.ko:root/modules/qca_cld/qca_cld_wlan.ko

BUILD_FINGERPRINT := samsung/a3y17ltexx/a3y17lte:8.0.0/R16NW/A320FXXU4CRL1:user/release-keys

# Inherit from Exynos7870-common
$(call inherit-product, device/samsung/exynos7870-common/device-common.mk)

# call the proprietary setup
$(call inherit-product, vendor/samsung/a3y17lte/a3y17lte-vendor.mk)

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call the common proprietary setup
$(call inherit-product, vendor/samsung/exynos7870-common/exynos7870-common-vendor.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_gains.xml:system/vendor/etc/mixer_gains.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/vendor/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:system/vendor/etc/mixer_paths_0.xml

PRODUCT_PACKAGES += \
   libtfa98xx \
   audio_amplifier.universal7870 \
   libtinycompress

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprint.exynos5 \
    libbauthtzcommon_shim \
    android.hardware.biometrics.fingerprint@2.1-impl \
    android.hardware.biometrics.fingerprint@2.1-service

# Device uses high-density artwork where available
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1080

# Lights
PRODUCT_PACKAGES += \
    lights.universal7870 \
    android.hardware.light@2.0-impl
 
# NFC Packages
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0-impl \
    libnfc-nci \
    libnfc_nci_jni \
    com.android.nfc_extras \
    NfcNci \
    Tag
 
# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec.conf:system/etc/libnfc-sec.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf:system/etc/libnfc-sec-hal.conf \
    $(LOCAL_PATH)/configs/nfc/nfc_key:system/etc/nfc_key \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/vendor/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/releasetools/nfc_scripts.sh:install/bin/nfc_scripts.sh \
    $(LOCAL_PATH)/configs/nfc/libnfc-sec-hal.conf.s3nrn81:system/etc/libnfc-sec-hal.conf.s3nrn81

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.permission.HRM_EXT.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.HRM_EXT.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.permission.SSENSOR.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.samsung.permission.SSENSOR.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    $(LOCAL_PATH)/configs/permissions/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    $(LOCAL_PATH)/configs/permissions/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    $(LOCAL_PATH)/configs/permissions/com.gsma.services.nfc.xml:$system/etc/permissions/com.gsma.services.nfc.xml \
    $(LOCAL_PATH)/configs/permissions/com.samsung.android.nfc.mpos.xml:$system/etc/permissions/com.samsung.android.nfc.mpos.xml \
    $(LOCAL_PATH)/configs/permissions/com.sec.feature.cover.nfc_authentication.xml:$system/etc/permissions/com.sec.feature.cover.nfc_authentication.xml \
    $(LOCAL_PATH)/configs/permissions/com.sec.feature.nfc_authentication.xml:$system/etc/permissions/com.sec.feature.nfc_authentication.xml \

PRODUCT_PACKAGES := \
	Snap

# Specific Ramdisk Package
  PRODUCT_PACKAGES += \
      init.target.rc

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/nfc_scripts.sh:install/bin/nfc_scripts.sh

# Wi-Fi Ramdisk Package
  PRODUCT_PACKAGES += \
      init.wifi.rc
