#
# Copyright (C) 2020 The ConquerOS Project
#				2021 a xdroid Prjkt
#

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# A/B backuptool
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Media
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Storage manager
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.storage_manager.enabled=true

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    net.tethering.noprovisioning=true

# Disable RescueParty
PRODUCT_PRODUCT_PROPERTIES += \
        persist.sys.disable_rescue=true

# Spoof fingerprint for Google Play Services and SafetyNet
ifeq ($(PRODUCT_OVERRIDE_GMS_FINGERPRINT),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.build.gms_fingerprint=google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.build.gms_fingerprint=$(PRODUCT_OVERRIDE_GMS_FINGERPRINT)
endif
