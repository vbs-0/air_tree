#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from generic device
$(call inherit-product, device/xiaomi/air/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := air
PRODUCT_NAME := lineage_air-bp4a
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 13C 5G
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="air-user 14 UP1A.231005.007 V816.0.5.0.UGQINXM release-keys" \
    BuildFingerprint=Redmi/air/air:14/UP1A.231005.007/V816.0.5.0.UGQINXM:user/release-keys
