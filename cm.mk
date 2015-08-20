# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/bq/piccolo/full_piccolo.mk)

PRODUCT_RELEASE_NAME := Aquaris M5
PRODUCT_NAME := cm_piccolo

# Set product name
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=Aquaris_M5

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=bq/Aquaris_M5/Aquaris_M5:5.0.2/LRX22G/1440027117:user/release-keys \
    PRIVATE_BUILD_DESC="msm8916_32-user 5.0.2 LRX22G 323 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-bq
