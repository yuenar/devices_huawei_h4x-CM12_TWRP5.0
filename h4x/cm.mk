# bootanimation target
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Release name
PRODUCT_RELEASE_NAME := Che2-UL00
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/h4x/device_h4x.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := h4x
PRODUCT_NAME := cm_h4x
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := Che2-UL00
PRODUCT_MANUFACTURER := HUAWEI
