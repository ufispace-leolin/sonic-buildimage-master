# UfiSpace S9700_53DX Platform modules

UFISPACE_S9700_53DX_PLATFORM_MODULE_VERSION = 1.0.0

export UFISPACE_S9700_53DX_PLATFORM_MODULE_VERSION


UFISPACE_S9700_53DX_PLATFORM_MODULE = sonic-platform-ufispace-s9700-53dx_$(UFISPACE_S9700_53DX_PLATFORM_MODULE_VERSION)_amd64.deb
$(UFISPACE_S9700_53DX_PLATFORM_MODULE)_SRC_PATH = $(PLATFORM_PATH)/sonic-platform-modules-ufispace
$(UFISPACE_S9700_53DX_PLATFORM_MODULE)_DEPENDS += $(LINUX_HEADERS) $(LINUX_HEADERS_COMMON)
$(UFISPACE_S9700_53DX_PLATFORM_MODULE)_PLATFORM = x86_64-ufispace_s9700_53dx-r0
$(UFISPACE_S9700_53DX_PLATFORM_MODULE)_PLATFORM += x86_64-ufispace_s9700_53dx-r9
SONIC_DPKG_DEBS += $(UFISPACE_S9700_53DX_PLATFORM_MODULE)

SONIC_STRETCH_DEBS += $(UFISPACE_S9700_53DX_PLATFORM_MODULE)
