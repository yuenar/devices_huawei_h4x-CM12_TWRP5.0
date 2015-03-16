# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/huawei/h4x

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
    
# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := Che2

# Ramdisk
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/ramdisk/fstab.hi6210sft:root/fstab.hi6210sft \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc


# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/e2fsck_s:recovery/root/sbin/e2fsck_s \
    $(LOCAL_PATH)/recovery/sbin/oeminfo_nvm_server:recovery/root/sbin/oeminfo_nvm_server \
    $(LOCAL_PATH)/recovery/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc \
    $(LOCAL_PATH)/recovery/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/recovery/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:root/sbin/postrecoveryboot.sh \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab
	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/system/bin/linker:recovery/root/system/bin/linker \
    $(LOCAL_PATH)/recovery/system/lib/libc.so:recovery/root/system/lib/libc.so \
    $(LOCAL_PATH)/recovery/system/lib/libdl.so:recovery/root/system/lib/libdl.so \
    $(LOCAL_PATH)/recovery/system/lib/liblog.so:recovery/root/system/lib/liblog.so \
    $(LOCAL_PATH)/recovery/system/lib/libm.so:recovery/root/system/lib/libm.so \
    $(LOCAL_PATH)/recovery/system/lib/libstdc++.so:recovery/root/system/lib/libstdc++.so \
    $(LOCAL_PATH)/recovery/system/lib/libz.so:recovery/root/system/lib/libz.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/res/images/720x1280/batt_level_scale.png:root/res/images/720x1280/batt_level_scale.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/batt_level_top.png:root/res/images/720x1280/batt_level_top.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/bg.png:root/res/images/720x1280/bg.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/empty_charge.png:root/res/images/720x1280/empty_charge.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/err_charge.png:root/res/images/720x1280/err_charge.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/full_charge.png:root/res/images/720x1280/full_charge.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_0.png:root/res/images/720x1280/number_0.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_1.png:root/res/images/720x1280/number_1.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_2.png:root/res/images/720x1280/number_2.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_3.png:root/res/images/720x1280/number_3.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_4.png:root/res/images/720x1280/number_4.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_5.png:root/res/images/720x1280/number_5.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_6.png:root/res/images/720x1280/number_6.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_7.png:root/res/images/720x1280/number_7.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_8.png:root/res/images/720x1280/number_8.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/number_9.png:root/res/images/720x1280/number_9.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/percent_10.png:root/res/images/720x1280/percent_10.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/percent_5.png:root/res/images/720x1280/percent_5.png \
    $(LOCAL_PATH)/recovery/res/images/720x1280/percent_sign.png:root/res/images/720x1280/percent_sign.png 
# Screen density
# This device have enough room for precise davick
PRODUCT_TAGS += dalvik.gc.type-precise

# Device uses ultra-high-density artwork where available
PRODUCT_AAPT_CONFIG := hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.manufacturer=HUAWEI \
    ro.product.model=Che2-UL00
    
#fstab.hi6210sft
PRODUCT_PACKAGES += \
    fstab.hi6210sft

PRODUCT_PACKAGES += \
    setup_fs \
    librs_jni \
    libsrec_jni \
    com.android.future.usb.accessory \
    make_ext4fs 

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdashplayer

# Power HAL
PRODUCT_PACKAGES += \
    power.hi6210sft

# Recovery
PRODUCT_PACKAGES += \
    minivold

# Vold
PRODUCT_PACKAGES += \
    uim-sysfs \
    libbt-vendor

# General
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=0

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-rtsp=true \
    media.stagefright.enable-record=true \
    net.rmnet0.dns1=8.8.8.8 \
    net.rmnet0.dns2=8.8.4.4 \
    net.dns1=8.8.8.8 \
    net.dns2=8.8.4.4

# OpenGL ES
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ap.interface=wlan1 \
    persist.sys.usb.config=mtp,adb

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=1 \
    ro.opengles.version=131072 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.hwui.render_dirty_regions=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.config.hw_flashless=true \
    ro.config.modem_hsic=true \
    ro.config.hisi_soc_type=true \
    ro.config.hisi_rpt_mode=0 \
    balong.debug.on=true \
    ro.config.fm_type=libbcmfm_if \
    ro.bt.bdaddr_path=/data/misc/bluedroid/macbt \
    ro.thmodem.type=sprd \
    ro.modem.type=6260 \
    ril.gsm.deviceid=-1 \
    ril.cdma.deviceid=-1 \
    ril.gsm.rssi=-1 \
    ril.cdma.rssi=-1 \
    persist.sys.logsystem.neversend=0 \
    modify_ram_show=true \
    persist.sys.phb.enable=1 \
    persist.sys.phb.debug.enable=1 \
    persist.sys.actualpoweron=true \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.config.incall_notify_mms=true \
    ro.config.hw_allow_ums_and_mtp=true \
    ro.camera.sound.forced=1 \
    keyguard.no_require_sim=true \
    ro.config.hw_dolby=true \
    ro.dolbywithheadset.enable=1 \
    ro.streaming.video.drs=true \
    media.aac_51_output_enabled=true \
    ro.config.vdf_apn_switch=true \
    ro.config.hw_show_network_icon=true \
    persist.telephony.mpdn=false \
    ro.cellbroadcast.emergencyids=919,4371 \
    ro.config.vm_prioritymode=2 \
    ro.product.aac.softaac2ffmpeg=true \
    ro.config.helix_enable=true \
    af.resampler.quality=4 \
    ro.config.widevine_level3=true \
    drm.service.enabled=true

$(call inherit-product, build/target/product/full.mk)

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
