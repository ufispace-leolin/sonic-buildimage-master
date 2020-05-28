include $(PLATFORM_PATH)/sai-modules.mk
include $(PLATFORM_PATH)/sai.mk
include $(PLATFORM_PATH)/platform-modules-dell.mk
include $(PLATFORM_PATH)/platform-modules-arista.mk
include $(PLATFORM_PATH)/platform-modules-ingrasys.mk
include $(PLATFORM_PATH)/platform-modules-accton.mk
include $(PLATFORM_PATH)/platform-modules-alphanetworks.mk
include $(PLATFORM_PATH)/platform-modules-inventec.mk
include $(PLATFORM_PATH)/platform-modules-cel.mk
include $(PLATFORM_PATH)/platform-modules-delta.mk
include $(PLATFORM_PATH)/platform-modules-quanta.mk
#include $(PLATFORM_PATH)/platform-modules-mitac.mk
include $(PLATFORM_PATH)/platform-modules-ufispace.mk
include $(PLATFORM_PATH)/platform-modules-juniper.mk
include $(PLATFORM_PATH)/platform-modules-brcm-xlr-gts.mk
include $(PLATFORM_PATH)/docker-syncd-brcm.mk
include $(PLATFORM_PATH)/docker-syncd-brcm-rpc.mk
include $(PLATFORM_PATH)/docker-saiserver-brcm.mk
include $(PLATFORM_PATH)/one-image.mk
include $(PLATFORM_PATH)/raw-image.mk
include $(PLATFORM_PATH)/one-aboot.mk
include $(PLATFORM_PATH)/libsaithrift-dev.mk
include $(PLATFORM_PATH)/docker-ptf-brcm.mk

BCMCMD = bcmcmd
$(BCMCMD)_URL = "https://sonicstorage.blob.core.windows.net/packages/20190307/bcmcmd?sv=2015-04-05&sr=b&sig=sUdbU7oVbh5exbXXHVL5TDFBTWDDBASHeJ8Cp0B0TIc%3D&se=2038-05-06T22%3A34%3A19Z&sp=r"

DSSERVE = dsserve
$(DSSERVE)_URL = "https://sonicstorage.blob.core.windows.net/packages/20190307/dsserve?sv=2015-04-05&sr=b&sig=lk7BH3DtW%2F5ehc0Rkqfga%2BUCABI0UzQmDamBsZH9K6w%3D&se=2038-05-06T22%3A34%3A45Z&sp=r"

SONIC_ONLINE_FILES += $(BCMCMD) $(DSSERVE)

SONIC_ALL += $(SONIC_ONE_IMAGE) $(SONIC_ONE_ABOOT_IMAGE) \
             $(DOCKER_FPM)

# Inject brcm sai into sairedis
$(LIBSAIREDIS)_DEPENDS += $(BRCM_SAI) $(BRCM_SAI_DEV)
ifeq ($(ENABLE_SYNCD_RPC),y)
$(LIBSAIREDIS)_DEPENDS += $(LIBSAITHRIFT_DEV)
endif

# Runtime dependency on brcm sai is set only for syncd
$(SYNCD)_RDEPENDS += $(BRCM_SAI)
