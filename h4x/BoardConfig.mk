#
# Copyright (C) 2014 The CyanogenMod Project
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
#
# config.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH := device/huawei/h4x
USE_CAMERA_STUB := false


TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

# Assert
TARGET_OTA_ASSERT_DEVICE := h4x,honor4x,CHE2-UL00

# Platform
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_ABI_LIST := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a53
TARGET_CPU_VARIANT:= cortex-a53
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

TARGET_BOARD_PLATFORM := hi6210sft
TARGET_BOARD_PLATFORM_GPU := mali-450mp
TARGET_BOOTLOADER_BOARD_NAME := hi6210sft
TARGET_BOARD_PLATFORM := hi6210sft
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ARCH_VARIANT_CPU := cortex-a53
TARGET_CPU_VARIANT := cortex-a53
TARGET_ARCH_VARIANT_FPU := neon
#add suffix variable to uniquely identify the board
HISI_TARGET_PRODUCT := hi6210sft
TARGET_BOARD_SUFFIX := _32


# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true



# Hardware

BOARD_HAL_STATIC_LIBRARIES += libhealthd.hi6210sft

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
USE_OPENGL_RENDERER := true

# Init
TARGET_UNIFIED_DEVICE := true
# Liblight
TARGET_PROVIDES_LIBLIGHT := true


# Kernel
BOARD_KERNEL_CMDLINE := hisi_dma_print=0 vmalloc=384M maxcpus=8 no_irq_affinity
BOARD_KERNEL_BASE     := 0x07400000
BOARD_KERNEL_OFFSET     := 0x00008000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_TAGS_OFFSET     := 0x02a00000

BOARD_MKBOOTIMG_ARGS += --kernel_offset "$(BOARD_KERNEL_OFFSET)"
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x07c00000
BOARD_MKBOOTIMG_ARGS += --tags_offset "$(BOARD_TAGS_OFFSET)"

# Partitions

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5255462912
BOARD_FLASH_BLOCK_SIZE := 131072
# USB mass storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
BOARD_VOLD_MAX_PARTITIONS := 19

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/twrp.fstab
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery/init.rc
BOARD_HAS_NO_SELECT_BUTTON 	:= true
BOARD_TOUCH_RECOVERY := 
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_LOCKED_BOOTLOADER := true
RECOVERY_FSTAB_VERSION := 2
BOARD_HAS_LARGE_FILESYSTEM 	:= true
BOARD_USE_CUSTOM_RECOVERY_FONT 	:= \"roboto_15x24.h\"

BOARD_RECOVERY_SWIPE := true

TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/recovery-kernel
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/recovery/init.rc

#TWRP
HAVE_SELINUX := true
TW_MAX_BRIGHTNESS := 255
DEVICE_RESOLUTION := 720x1280
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_USE_TOOLBOX := true
TWHAVE_SELINUX := true
TW_CUSTOM_BATTERY_PATH := "/sys/devices/battery.45/power_supply/Battery"

RECOVERY_SDCARD_ON_DATA := true 
TW_FLASH_FROM_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/hi_mci.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
BRIGHTNESS_SYS_FILE := "/sys/devices/platform/balong_fb.1/leds/lcd_backlight0/brightness"
TW_BRIGHTNESS_PATH := "/sys/devices/platform/balong_fb.1/leds/lcd_backlight0/brightness"
