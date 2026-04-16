#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enforce generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 33

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery

# Kernel
PRODUCT_ENABLE_UFFD_GC := true

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Sku
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sku/build_c3vcn.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vcn.prop \
    $(LOCAL_PATH)/sku/build_c3vcnl.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vcnl.prop \
    $(LOCAL_PATH)/sku/build_c3vg.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vg.prop \
    $(LOCAL_PATH)/sku/build_c3vin.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vin.prop \
    $(LOCAL_PATH)/sku/build_c3vinl.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vinl.prop \
    $(LOCAL_PATH)/sku/build_c3vcn_ss.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vcn_ss.prop \
    $(LOCAL_PATH)/sku/build_c3vcnl_ss.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vcnl_ss.prop \
    $(LOCAL_PATH)/sku/build_c3vg_ss.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vg_ss.prop \
    $(LOCAL_PATH)/sku/build_c3vin_ss.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vin_ss.prop \
    $(LOCAL_PATH)/sku/build_c3vinl_ss.prop:$(TARGET_COPY_OUT_ODM)/etc/build_c3vinl_ss.prop

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.sh \

PRODUCT_PACKAGES += \
    fstab.mt6835 \
    fstab.mt6835.vendor_ramdisk \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6835.rc \
    init.mt6835.usb.rc \
    init.mtkgki.rc \
    init.project.rc \
    init.sensor_2_0.rc \
    init_connectivity.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.recovery.mt6835.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6835.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6835:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.mt6835
# ADB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.debuggable=1

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/air/air-vendor.mk)

# Proprietary Prebuilts (Migrated)
PRODUCT_PACKAGES += \
