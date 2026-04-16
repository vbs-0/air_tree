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
    air_vendor_GoogleNetworkStackResOverlay.apk \
    air_vendor_GoogleTetheringResOverlay.apk \
    air_vendor_InProcessTetheringResOverlay.apk \
    air_vendor_NetworkStackInProcessResOverlay.apk \
    air_vendor_NetworkStackResOverlay.apk \
    air_vendor_TetheringResOverlay.apk \
    air_vendor_compatibility_matrix.xml \
    air_vendor_android.hardware.biometrics.fingerprint@2.1-service.xml \
    air_vendor_android.hardware.boot@1.2.xml \
    air_vendor_android.hardware.cas@1.2-service-lazy.xml \
    air_vendor_android.hardware.drm-service.clearkey.xml \
    air_vendor_android.hardware.health-service.example.xml \
    air_vendor_android.hardware.identity@4.0-service.mitee.xml \
    air_vendor_android.hardware.neuralnetworks-shim-service-mtk.xml \
    air_vendor_android.hardware.security.keymint-service.mitee.xml \
    air_vendor_android.hardware.security.secureclock-service.mitee.xml \
    air_vendor_android.hardware.security.sharedsecret-service.mitee.xml \
    air_vendor_android.hardware.sensors-multihal.xml \
    air_vendor_android.hardware.usb-aidl-service.mediatek.xml \
    air_vendor_android.hardware.usb.gadget-service.mediatek.xml \
    air_vendor_android.hardware.wifi.hostapd.xml \
    air_vendor_android.hardware.wifi.supplicant.xml \
    air_vendor_android.hardware.wifi@1.0-service.xml \
    air_vendor_bluetooth_audio.xml \
    air_vendor_dumpstate-xiaomi.xml \
    air_vendor_em_hal_service.xml \
    air_vendor_gnss-default.xml \
    air_vendor_gnss@2.1-service-mediatek.xml \
    air_vendor_lbs_hidl_service@1.0.xml \
    air_vendor_lights-mtk-default.xml \
    air_vendor_manifest_android.hardware.drm-service.widevine.xml \
    air_vendor_manifest_cameraproviderhidl.xml \
    air_vendor_manifest_hwcomposer.xml \
    air_vendor_manifest_media_c2_V1_1_default.xml \
    air_vendor_manifest_vendor.xiaomi.hardware.otrpagent@2.0.xml \
    air_vendor_memtrack-mediatek.xml \
    air_vendor_mrm.xml \
    air_vendor_mtkgnss-batching.xml \
    air_vendor_mtkpower_applist-mtk-default.xml \
    air_vendor_power-mediatek.xml \
    air_vendor_vendor.xiaomi.hardware.micharge@1.0.xml \
    air_vendor_vendor.xiaomi.hardware.mimd@1.0-service.xml \
    air_vendor_vendor.xiaomi.hardware.misys@1.0.xml \
    air_vendor_vendor.xiaomi.hardware.misys@2.0.xml \
    air_vendor_vendor.xiaomi.hardware.misys@3.0.xml \
    air_vendor_vendor.xiaomi.hardware.misys@4.0.xml \
    air_vendor_vibrator-mtk-default.xml \
    air_vendor_manifest.xml \
    air_vendor_CellbroadcastUIResOverlay.apk \
    air_vendor_FrameworkResOverlay.apk \
    air_vendor_FrameworkResOverlayExt.apk \
    air_vendor_MtkSettingsResOverlay.apk \
    air_vendor_SettingsProviderResOverlay.apk \
    air_vendor_WifiResMainlineOverlay.apk \
    air_vendor_WifiResOverlay.apk \
    air_vendor_GpuGameDriver.mt6835.apk \
    air_odm_vendor.xiaomi.hardware.fx.tunnel@1.0-service.xml \
    air_odm_manifest_c3vcn.xml \
    air_odm_manifest_c3vcn_ss.xml \
    air_odm_manifest_c3vcnl.xml \
    air_odm_manifest_c3vcnl_ss.xml \
    air_odm_manifest_c3vg.xml \
    air_odm_manifest_c3vg_ss.xml \
    air_odm_manifest_c3vgl.xml \
    air_odm_manifest_c3vgl_ss.xml \
    air_odm_manifest_c3vin.xml \
    air_odm_manifest_c3vin_ss.xml \
    air_odm_manifest_c3vinl.xml \
    air_odm_manifest_c3vinl_ss.xml \
    air_system_ext_BluetoothExtension.apk \
    air_system_ext_DebugLoggerUI.apk \
    air_system_ext_EngineerMode.apk \
    air_system_ext_LocationEM2.apk \
    air_system_ext_MDMConfig.apk \
    air_system_ext_MDMLSample.apk \
    air_system_ext_MiraVision.apk \
    air_system_ext_MiuiAudioMonitor.apk \
    air_system_ext_MiuiDaemon.apk \
    air_system_ext_MiuiPrintSpooler.apk \
    air_system_ext_MiuixEditor_global.apk \
    air_system_ext_ModemTestBox.apk \
    air_system_ext_TeeService.apk \
    air_system_ext_YGPS.apk \
    air_system_ext_mediatek-res.apk \
    air_system_ext_miuisystem.apk \
    air_system_ext_miuix.apk \
    air_system_ext_MtkCalendar.apk \
    air_system_ext_BuildManifestSystemExt.apk \
    air_system_ext_manifest_hypsys_system.xml \
    air_system_ext_mtk-mbrainj-default.xml \
    air_system_ext_manifest.xml \
    air_system_ext_CapCtrlInterface.jar \
    air_system_ext_CustomPropInterface.jar \
    air_system_ext_MiuiBooster.jar \
    air_system_ext_MiuiSettingsSearchLib.jar \
    air_system_ext_NetworkBoost.jar \
    air_system_ext_apprecovery.proinstaller.jar \
    air_system_ext_camerax-vendor-extensions.jar \
    air_system_ext_com.android.hotwordenrollment.common.util.jar \
    air_system_ext_com.xiaomi.NetworkBoost.jar \
    air_system_ext_com.xiaomi.slalib.jar \
    air_system_ext_duraspeed.jar \
    air_system_ext_framework-ext-res.apk \
    air_system_ext_global-cleaner-empty.jar \
    air_system_ext_gson.jar \
    air_system_ext_log-handler.jar \
    air_system_ext_mediatek-carrier-config-manager.jar \
    air_system_ext_mediatek-common.jar \
    air_system_ext_mediatek-framework.jar \
    air_system_ext_mediatek-ims-base.jar \
    air_system_ext_mediatek-ims-common.jar \
    air_system_ext_mediatek-ims-extension-plugin.jar \
    air_system_ext_mediatek-services.jar \
    air_system_ext_mediatek-telecom-common.jar \
    air_system_ext_mediatek-telephony-base.jar \
    air_system_ext_mediatek-telephony-common.jar \
    air_system_ext_mirilhook.jar \
    air_system_ext_miui-cameraopt.jar \
    air_system_ext_miui-connectivity-service.jar \
    air_system_ext_miui-enterprise-sdk.jar \
    air_system_ext_miui-framework.jar \
    air_system_ext_miui-services.jar \
    air_system_ext_miui-telephony-common.jar \
    air_system_ext_miui-wifi-service.jar \
    air_system_ext_miuix.jar \
    air_system_ext_security-device-credential-sdk.jar \
    air_system_ext_vendor.xiaomi.hardware.misys.common-V1-java.jar \
    air_system_ext_version-seperation.jar \
    air_system_ext_xiaomi-modem-common.jar \
    air_system_ext_xiaomi-telephony-common.jar \
    air_system_ext_AccessibilityMenu.apk \
    air_system_ext_AtciService.apk \
    air_system_ext_AuthManager.apk \
    air_system_ext_CallRecorderService.apk \
    air_system_ext_CarrierConfig.apk \
    air_system_ext_ConfigurationClient.apk \
    air_system_ext_DuraSpeed.apk \
    air_system_ext_EmergencyInfoGms.apk \
    air_system_ext_FindDevice.apk \
    air_system_ext_GoogleFeedback.apk \
    air_system_ext_GoogleServicesFramework.apk \
    air_system_ext_ImsService.apk \
    air_system_ext_LPPeService.apk \
    air_system_ext_MiuiFreeformService.apk \
    air_system_ext_MiuiSystemUI.apk \
    air_system_ext_MiuiVpnDialogs.apk \
    air_system_ext_MiuiWifiDialog.apk \
    air_system_ext_MtkCapCtrl.apk \
    air_system_ext_MtkGbaService.apk \
    air_system_ext_MtkTelephonyAssist.apk \
    air_system_ext_Provision.apk \
    air_system_ext_RtMiCloudSDK.apk \
    air_system_ext_Settings.apk \
    air_system_ext_SetupWizard.apk \
    air_system_ext_SmartRatSwitch.apk \
    air_system_ext_StorageManager.apk \
    air_system_ext_VoiceUnlock.apk \
    air_system_ext_WallpaperCropper.apk \
