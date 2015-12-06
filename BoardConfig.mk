# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/huawei/G610

# inherit from the proprietary version
-include vendor/huawei/G610/BoardConfigVendor.mk

# Board config
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := MT6589
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

# Blob hacks
COMMON_GLOBAL_CFLAGS += -DMR1_AUDIO_BLOB -DDISABLE_HW_ID_MATCH_CHECK -DNEEDS_VECTORIMPL_SYMBOLS -DMTK_SERIALNO_FIX
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# HW Composer
BOARD_NEEDS_OLD_HWC_API := true
COMMON_GLOBAL_CFLAGS += -DMTK_G_MT6589
COMMON_GLOBAL_CPPFLAGS += -DMTK_G_MT6589

# Power
TARGET_POWERHAL_VARIANT := cm

# Boot
TARGET_NO_BOOTLOADER := true

# EGL settings
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Partion Size's
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x40000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x600000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x92B80000
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_RECOVERY_PIXEL_FORMAT := BGR_565
DEVICE_RESOLUTION := 540x960
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# mkimage to append headers
TARGET_MKIMAGE := $(DEVICE_FOLDER)/mkimage
TARGET_USE_BUILT_BOOTIMAGE := true

TW_INTERNAL_STORAGE_PATH := "/data"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"

TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true
TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_L_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p8"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered"
#TW_INCLUDE_FB2PNG := false
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true

#TW_FORCE_CPUINFO_FOR_DEVICE_ID := true
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_USE_BRAND_DEVICE_HARDWARE_ID_FOR_DEVICE_ID := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/battery/power_supply/battery
TW_BACKUPS_FOLDER := /sdcard/TWRP/BACKUPS/Huawei/G610

# Mansi hacks for Small size
# MTP system
TW_EXCLUDE_MTP := false
# Include SuperSU
TW_EXCLUDE_SUPERSU := true
# Build libcrypt
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
# Exfat support
TW_NO_EXFAT := true
TW_NO_EXFAT_FUSE := true
# Build libft2
TW_DISABLE_TTF := true
# USB Storage... OTG?!
TW_NO_USB_STORAGE := false
# BusyBox symlink
TW_USE_TOOLBOX := false
# SeLinux from KitKat kernel
HAVE_SELINUX := true
# This excludes parted from the build... parted is prebuilt and for arm CPU only
BOARD_HAS_NO_REAL_SDCARD := false

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_FOLDER)/boot.mk

TW_THEME := portrait_hdpi
