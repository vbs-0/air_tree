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
    vendor_GoogleNetworkStackResOverlay.apk \
    vendor_GoogleTetheringResOverlay.apk \
    vendor_InProcessTetheringResOverlay.apk \
    vendor_NetworkStackInProcessResOverlay.apk \
    vendor_NetworkStackResOverlay.apk \
    vendor_TetheringResOverlay.apk \
    vendor_compatibility_matrix.xml \
    vendor_android.hardware.biometrics.fingerprint@2.1-service.xml \
    vendor_android.hardware.boot@1.2.xml \
    vendor_android.hardware.cas@1.2-service-lazy.xml \
    vendor_android.hardware.drm-service.clearkey.xml \
    vendor_android.hardware.health-service.example.xml \
    vendor_android.hardware.identity@4.0-service.mitee.xml \
    vendor_android.hardware.neuralnetworks-shim-service-mtk.xml \
    vendor_android.hardware.security.keymint-service.mitee.xml \
    vendor_android.hardware.security.secureclock-service.mitee.xml \
    vendor_android.hardware.security.sharedsecret-service.mitee.xml \
    vendor_android.hardware.sensors-multihal.xml \
    vendor_android.hardware.usb-aidl-service.mediatek.xml \
    vendor_android.hardware.usb.gadget-service.mediatek.xml \
    vendor_android.hardware.wifi.hostapd.xml \
    vendor_android.hardware.wifi.supplicant.xml \
    vendor_android.hardware.wifi@1.0-service.xml \
    vendor_bluetooth_audio.xml \
    vendor_dumpstate-xiaomi.xml \
    vendor_em_hal_service.xml \
    vendor_gnss-default.xml \
    vendor_gnss@2.1-service-mediatek.xml \
    vendor_lbs_hidl_service@1.0.xml \
    vendor_lights-mtk-default.xml \
    vendor_manifest_android.hardware.drm-service.widevine.xml \
    vendor_manifest_cameraproviderhidl.xml \
    vendor_manifest_hwcomposer.xml \
    vendor_manifest_media_c2_V1_1_default.xml \
    vendor_manifest_vendor.xiaomi.hardware.otrpagent@2.0.xml \
    vendor_memtrack-mediatek.xml \
    vendor_mrm.xml \
    vendor_mtkgnss-batching.xml \
    vendor_mtkpower_applist-mtk-default.xml \
    vendor_power-mediatek.xml \
    vendor_vendor.xiaomi.hardware.micharge@1.0.xml \
    vendor_vendor.xiaomi.hardware.mimd@1.0-service.xml \
    vendor_vendor.xiaomi.hardware.misys@1.0.xml \
    vendor_vendor.xiaomi.hardware.misys@2.0.xml \
    vendor_vendor.xiaomi.hardware.misys@3.0.xml \
    vendor_vendor.xiaomi.hardware.misys@4.0.xml \
    vendor_vibrator-mtk-default.xml \
    vendor_manifest.xml \
    vendor_CellbroadcastUIResOverlay.apk \
    vendor_FrameworkResOverlay.apk \
    vendor_FrameworkResOverlayExt.apk \
    vendor_MtkSettingsResOverlay.apk \
    vendor_SettingsProviderResOverlay.apk \
    vendor_WifiResMainlineOverlay.apk \
    vendor_WifiResOverlay.apk \
    vendor_GpuGameDriver.mt6835.apk \
    odm_vendor.xiaomi.hardware.fx.tunnel@1.0-service.xml \
    odm_manifest_c3vcn.xml \
    odm_manifest_c3vcn_ss.xml \
    odm_manifest_c3vcnl.xml \
    odm_manifest_c3vcnl_ss.xml \
    odm_manifest_c3vg.xml \
    odm_manifest_c3vg_ss.xml \
    odm_manifest_c3vgl.xml \
    odm_manifest_c3vgl_ss.xml \
    odm_manifest_c3vin.xml \
    odm_manifest_c3vin_ss.xml \
    odm_manifest_c3vinl.xml \
    odm_manifest_c3vinl_ss.xml \
    system_ext_BluetoothExtension.apk \
    system_ext_DebugLoggerUI.apk \
    system_ext_EngineerMode.apk \
    system_ext_LocationEM2.apk \
    system_ext_MDMConfig.apk \
    system_ext_MDMLSample.apk \
    system_ext_MiraVision.apk \
    system_ext_MiuiAudioMonitor.apk \
    system_ext_MiuiDaemon.apk \
    system_ext_MiuiPrintSpooler.apk \
    system_ext_MiuixEditor_global.apk \
    system_ext_ModemTestBox.apk \
    system_ext_TeeService.apk \
    system_ext_YGPS.apk \
    system_ext_mediatek-res.apk \
    system_ext_miuisystem.apk \
    system_ext_miuix.apk \
    system_ext_MtkCalendar.apk \
    system_ext_BuildManifestSystemExt.apk \
    system_ext_manifest_hypsys_system.xml \
    system_ext_mtk-mbrainj-default.xml \
    system_ext_manifest.xml \
    system_ext_CapCtrlInterface.jar \
    system_ext_CustomPropInterface.jar \
    system_ext_MiuiBooster.jar \
    system_ext_MiuiSettingsSearchLib.jar \
    system_ext_NetworkBoost.jar \
    system_ext_apprecovery.proinstaller.jar \
    system_ext_camerax-vendor-extensions.jar \
    system_ext_com.android.hotwordenrollment.common.util.jar \
    system_ext_com.xiaomi.NetworkBoost.jar \
    system_ext_com.xiaomi.slalib.jar \
    system_ext_duraspeed.jar \
    system_ext_framework-ext-res.apk \
    system_ext_global-cleaner-empty.jar \
    system_ext_gson.jar \
    system_ext_log-handler.jar \
    system_ext_mediatek-carrier-config-manager.jar \
    system_ext_mediatek-common.jar \
    system_ext_mediatek-framework.jar \
    system_ext_mediatek-ims-base.jar \
    system_ext_mediatek-ims-common.jar \
    system_ext_mediatek-ims-extension-plugin.jar \
    system_ext_mediatek-services.jar \
    system_ext_mediatek-telecom-common.jar \
    system_ext_mediatek-telephony-base.jar \
    system_ext_mediatek-telephony-common.jar \
    system_ext_mirilhook.jar \
    system_ext_miui-cameraopt.jar \
    system_ext_miui-connectivity-service.jar \
    system_ext_miui-enterprise-sdk.jar \
    system_ext_miui-framework.jar \
    system_ext_miui-services.jar \
    system_ext_miui-telephony-common.jar \
    system_ext_miui-wifi-service.jar \
    system_ext_miuix.jar \
    system_ext_security-device-credential-sdk.jar \
    system_ext_vendor.xiaomi.hardware.misys.common-V1-java.jar \
    system_ext_version-seperation.jar \
    system_ext_xiaomi-modem-common.jar \
    system_ext_xiaomi-telephony-common.jar \
    system_ext_AccessibilityMenu.apk \
    system_ext_AtciService.apk \
    system_ext_AuthManager.apk \
    system_ext_CallRecorderService.apk \
    system_ext_CarrierConfig.apk \
    system_ext_ConfigurationClient.apk \
    system_ext_DuraSpeed.apk \
    system_ext_EmergencyInfoGms.apk \
    system_ext_FindDevice.apk \
    system_ext_GoogleFeedback.apk \
    system_ext_GoogleServicesFramework.apk \
    system_ext_ImsService.apk \
    system_ext_LPPeService.apk \
    system_ext_MiuiFreeformService.apk \
    system_ext_MiuiSystemUI.apk \
    system_ext_MiuiVpnDialogs.apk \
    system_ext_MiuiWifiDialog.apk \
    system_ext_MtkCapCtrl.apk \
    system_ext_MtkGbaService.apk \
    system_ext_MtkTelephonyAssist.apk \
    system_ext_Provision.apk \
    system_ext_RtMiCloudSDK.apk \
    system_ext_Settings.apk \
    system_ext_SetupWizard.apk \
    system_ext_SmartRatSwitch.apk \
    system_ext_StorageManager.apk \
    system_ext_VoiceUnlock.apk \
    system_ext_WallpaperCropper.apk \
