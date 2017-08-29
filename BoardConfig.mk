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

# inherit from the proprietary version
-include vendor/micromax/a106/BoardConfigVendor.mk

LOCAL_PATH := device/micromax/a106

# Board
TARGET_BOARD_PLATFORM := mt6582
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_SMP := true
TARGET_ARCH := arm
ARCH_ARM_HAVE_NEON := true
TARGET_NO_BOOTLOADER := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Enable dex-preoptimization
WITH_DEXPREOPT := false
DONT_DEXPREOPT_PREBUILTS := true

# Link against libxlog
TARGET_LDPRELOAD := libxlog.so

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6582

TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Assert
TARGET_OTA_ASSERT_DEVICE := micromax_unite2,a106

# MTK HARDWARE
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE
BLOCK_BASED_OTA := false

DEVICE_RESOLUTION := 480x800

# RIL
BOARD_RIL_CLASS := ../../../device/micromax/a106/ril/

BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

# Partitions & Image
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 943718400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 968884224
BOARD_CACHEIMAGE_PARTITION_SIZE := 132120576
BOARD_CACHEIMAGE_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_KMODULES := true

COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Kernel 
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_CUSTOM_BOOTIMG := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab

#TWRP
TW_SDEXT_NO_EXT4 := true
TW_EXCLUDE_MTP := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/power_supply/battery/batt_temp"
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_LARGE_FILESYSTEM := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/emmc"
TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
SP1_NAME := "uboot"
SP1_BACKUP_METHOD := image
SP1_MOUNTABLE := 0
SP2_NAME := "nvram"
SP2_DISPLAY_NAME := "nvram"
SP2_BACKUP_METHOD := image
SP2_MOUNTABLE := 0
TW_INCLUDE_FB2PNG := true
USE_CWM_GRAPHICS := true

#flipped screen

#BOARD_HAS_FLIPPED_SCREEN := true
#RECOVERY_TOUCHSCREEN_SWAP_XY := true

#RECOVERY_TOUCHSCREEN_SWAP_XY := true
RECOVERY_TOUCHSCREEN_FLIP_Y := true
RECOVERY_TOUCHSCREEN_FLIP_X := true
#BOARD_HAS_FLIPPED_SCREEN := true

# Set insecure for root access and device specifics
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
persist.service.acm.enable=1 \
persist.sys.usb.config=mass_storage,adb \
ro.mount.fs=EXT4

#PhilZ Touch build flags for MTK
TARGET_COMMON_NAME := a106
BOARD_USE_MTK_LAYOUT := true
BOARD_USE_NTFS_3G := false
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TARGET_DEVICE := a106
BRIGHTNESS_SYS_FILE := /sys/class/leds/lcd-backlight/brightness
BOARD_CUSTOM_BOOTIMG_MK := device/micromax/a106/bootimg.mk

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Offline charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.mtk

# EGL settings
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true
BOARD_EGL_NEEDS_FNW := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# WIFI
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# GPS
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Selinux
BOARD_SEPOLICY_DIRS += device/micromax/a106/sepolicy

# Sepolicy hack for old kernel, mt6582 version is 26.
POLICYVERS := 26

# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# FMRadio
MTK_FM_SUPPORT := yes
MTK_FM_RX_SUPPORT := yes
MTK_FM_CHIP := MT6627_FM
FM_LIB_BUILD_MT6620 := yes
FM_LIB_BUILD_MT6627 := yes
FM_LIB_BUILD_MT6628 := yes
FM_LIB_BUILD_MT6630 := yes
