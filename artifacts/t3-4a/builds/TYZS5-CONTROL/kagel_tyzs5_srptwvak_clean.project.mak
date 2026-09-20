####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 16                                              #
####################################################################

BASE_SDK_PATH = C:/Users/Aerial/SimplicityStudio/SDKs/gecko_sdk
BASE_PKG_PATH = C:/Users/Aerial/.silabs/slt/installs
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
PKG_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_PKG_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
PKG_PATH ?= $(BASE_PKG_PATH)
COPIED_SDK_PATH ?= gecko_sdk_4.5.1

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DKAGEL_CONTROL_STAGE2G=1' \
 '-DKAGEL_PROFILE=KAGEL_PROFILE_TYZS5_SRPTWVAK' \
 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1' \
 '-DKAGEL_REQUIRE_TYZS5_PROFILE=1' \
 '-DKAGEL_TELEMETRY_ONLY=1' \
 '-DTZLL_ACCESS_EDITION=0' \
 '-DEFR32MG13P732F512GM48=1' \
 '-DSL_APP_PROPERTIES=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DCORTEXM3=1' \
 '-DCORTEXM3_EFM32_MICRO=1' \
 '-DCORTEXM3_EFR32=1' \
 '-DPHY_RAIL=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DSL_LEGACY_HAL_ENABLE_WATCHDOG=1' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DMBEDTLS_PSA_CRYPTO_CLIENT=1' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DCUSTOM_TOKEN_HEADER="sl_token_manager_af_token_header.h"' \
 '-DUSE_NVM3=1' \
 '-DUC_BUILD=1' \
 '-DSL_ZIGBEE_LEAF_STACK=1' \
 '-DEMBER_MULTI_NETWORK_STRIPPED=1' \
 '-DSL_ZIGBEE_PHY_SELECT_STACK_SUPPORT=1' \
 '-DSL_ZIGBEE_STACK_COMPLIANCE_REVISION=22' \
 '-DCONFIGURATION_HEADER="app/framework/util/config.h"'

ASM_DEFS += \
 '-DKAGEL_CONTROL_STAGE2G=1' \
 '-DKAGEL_PROFILE=KAGEL_PROFILE_TYZS5_SRPTWVAK' \
 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1' \
 '-DKAGEL_REQUIRE_TYZS5_PROFILE=1' \
 '-DKAGEL_TELEMETRY_ONLY=1' \
 '-DTZLL_ACCESS_EDITION=0' \
 '-DEFR32MG13P732F512GM48=1' \
 '-DSL_APP_PROPERTIES=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1' \
 '-DCORTEXM3=1' \
 '-DCORTEXM3_EFM32_MICRO=1' \
 '-DCORTEXM3_EFR32=1' \
 '-DPHY_RAIL=1' \
 '-DPLATFORM_HEADER="platform-header.h"' \
 '-DSL_LEGACY_HAL_ENABLE_WATCHDOG=1' \
 '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' \
 '-DMBEDTLS_PSA_CRYPTO_CLIENT=1' \
 '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' \
 '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' \
 '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' \
 '-DCUSTOM_TOKEN_HEADER="sl_token_manager_af_token_header.h"' \
 '-DUSE_NVM3=1' \
 '-DUC_BUILD=1' \
 '-DSL_ZIGBEE_LEAF_STACK=1' \
 '-DEMBER_MULTI_NETWORK_STRIPPED=1' \
 '-DSL_ZIGBEE_PHY_SELECT_STACK_SUPPORT=1' \
 '-DSL_ZIGBEE_STACK_COMPLIANCE_REVISION=22' \
 '-DCONFIGURATION_HEADER="app/framework/util/config.h"'

INCLUDES += \
 -Iconfig \
 -Iconfig/zcl \
 -Iautogen \
 -I. \
 -I../../firmware/TYZS5 \
 -I../../firmware/common \
 -I$(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG13P/Include \
 -I$(SDK_PATH)/platform/common/inc \
 -I$(SDK_PATH)/platform/bootloader \
 -I$(SDK_PATH)/platform/bootloader/api \
 -I$(SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(SDK_PATH)/platform/service/device_init/inc \
 -I$(SDK_PATH)/platform/emdrv/common/inc \
 -I$(SDK_PATH)/platform/emlib/inc \
 -I$(SDK_PATH)/platform/service/legacy_hal/inc \
 -I$(SDK_PATH)/platform/service/legacy_hal_wdog/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/config/preset \
 -I$(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/inc \
 -I$(SDK_PATH)/util/third_party/mbedtls/include \
 -I$(SDK_PATH)/util/third_party/mbedtls/library \
 -I$(SDK_PATH)/platform/emdrv/nvm3/inc \
 -I$(SDK_PATH)/platform/service/power_manager/inc \
 -I$(SDK_PATH)/platform/security/sl_component/sl_psa_driver/inc \
 -I$(SDK_PATH)/platform/radio/rail_lib/common \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ble \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/ieee802154 \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/wmbus \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/zwave \
 -I$(SDK_PATH)/platform/radio/rail_lib/chip/efr32/efr32xg1x \
 -I$(SDK_PATH)/platform/radio/rail_lib/protocol/sidewalk \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ieee802154 \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/efr32xg1x \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti \
 -I$(SDK_PATH)/util/silicon_labs/silabs_core/memory_manager \
 -I$(SDK_PATH)/platform/common/toolchain/inc \
 -I$(SDK_PATH)/platform/service/system/inc \
 -I$(SDK_PATH)/platform/service/sleeptimer/inc \
 -I$(SDK_PATH)/platform/service/token_manager/inc \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/common \
 -I$(SDK_PATH)/protocol/zigbee/stack/platform/micro \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/service-function \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch \
 -I$(SDK_PATH)/protocol/zigbee/stack/include \
 -I$(SDK_PATH)/protocol/zigbee/stack/security \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/signature-decode \
 -I$(SDK_PATH)/platform/radio/rail_lib/plugin \
 -I$(SDK_PATH)/protocol/zigbee \
 -I$(SDK_PATH)/protocol/zigbee/stack \
 -I$(SDK_PATH)/protocol/zigbee/stack/gp \
 -I$(SDK_PATH)/protocol/zigbee/stack/zigbee \
 -I$(SDK_PATH)/platform/radio/mac/rail_mux \
 -I$(SDK_PATH)/platform/radio/mac \
 -I$(SDK_PATH)/util/silicon_labs/silabs_core \
 -I$(SDK_PATH)/protocol/zigbee/stack/core \
 -I$(SDK_PATH)/protocol/zigbee/stack/mac \
 -I$(SDK_PATH)/protocol/zigbee/app/em260 \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/include \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/util \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/security \
 -I$(SDK_PATH)/protocol/zigbee/app/util/zigbee-framework \
 -I$(SDK_PATH)/protocol/zigbee/app/util/counters \
 -I$(SDK_PATH)/protocol/zigbee/app/framework/cli \
 -I$(SDK_PATH)/protocol/zigbee/app/util/common \
 -I$(SDK_PATH)/protocol/zigbee/app/util/security

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys \
 $(SDK_PATH)/platform/emdrv/nvm3/lib/libnvm3_CM4_gcc.a \
 $(SDK_PATH)/platform/radio/rail_lib/autogen/librail_release/librail_efr32xg13_gcc_release.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m4/zigbee-pro-leaf-stack/release_singlenetwork/libzigbee-pro-leaf-stack.a \
 $(SDK_PATH)/protocol/zigbee/build/gcc/cortex-m4/zigbee-source-route/release_singlenetwork/libzigbee-source-route.a

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -std=c99 \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 --specs=nano.specs \
 -Wno-unused-parameter \
 -Wno-missing-field-initializers \
 -Wno-missing-braces \
 -g

CXX_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -std=c++11 \
 -fno-rtti \
 -fno-exceptions \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 --specs=nano.specs \
 -Wno-unused-parameter \
 -Wno-missing-field-initializers \
 -Wno-missing-braces \
 -g

ASM_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -imacros sl_gcc_preinclude.h \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m4 \
 -mthumb \
 -mfpu=fpv4-sp-d16 \
 -mfloat-abi=softfp \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -Wl,--gc-sections \
 -Wl,--no-warn-rwx-segments


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
	# No post-build defined

####################################################################
# SDK Build Rules                                                  #
####################################################################
$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o: $(SDK_PATH)/platform/bootloader/api/btl_interface.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/api/btl_interface.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/api/btl_interface.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface.o

$(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o: $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/api/btl_interface_storage.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/api/btl_interface_storage.o

$(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o: $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/bootloader/app_properties/app_properties.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.d
OBJS += $(OUTPUT_DIR)/sdk/platform/bootloader/app_properties/app_properties.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o: $(SDK_PATH)/platform/common/src/sl_assert.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_assert.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_assert.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_assert.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o: $(SDK_PATH)/platform/common/src/sl_slist.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_slist.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_slist.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_slist.o

$(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o: $(SDK_PATH)/platform/common/src/sl_syscalls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/src/sl_syscalls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/src/sl_syscalls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/src/sl_syscalls.o

$(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.o: $(SDK_PATH)/platform/common/toolchain/src/sl_memory.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/common/toolchain/src/sl_memory.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/common/toolchain/src/sl_memory.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG13P/Source/startup_efr32mg13p.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG13P/Source/startup_efr32mg13p.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG13P/Source/startup_efr32mg13p.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG13P/Source/startup_efr32mg13p.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG13P/Source/startup_efr32mg13p.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG13P/Source/startup_efr32mg13p.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG13P/Source/system_efr32mg13p.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG13P/Source/system_efr32mg13p.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG13P/Source/system_efr32mg13p.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/Device/SiliconLabs/EFR32MG13P/Source/system_efr32mg13p.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG13P/Source/system_efr32mg13p.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFR32MG13P/Source/system_efr32mg13p.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_default_common_linker.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_default_common_linker.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_hal_flash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_hal_flash.o

$(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o: $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emdrv/nvm3/src/nvm3_lock.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/nvm3/src/nvm3_lock.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(SDK_PATH)/platform/emlib/src/em_cmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_cmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_cmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o: $(SDK_PATH)/platform/emlib/src/em_core.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_core.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_core.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_crypto.o: $(SDK_PATH)/platform/emlib/src/em_crypto.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_crypto.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_crypto.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_crypto.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_crypto.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(SDK_PATH)/platform/emlib/src/em_emu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_emu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_emu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(SDK_PATH)/platform/emlib/src/em_gpio.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_gpio.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_gpio.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o: $(SDK_PATH)/platform/emlib/src/em_msc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_msc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_msc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_msc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o: $(SDK_PATH)/platform/emlib/src/em_prs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_prs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_prs.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_rmu.o: $(SDK_PATH)/platform/emlib/src/em_rmu.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_rmu.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_rmu.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtcc.o: $(SDK_PATH)/platform/emlib/src/em_rtcc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_rtcc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_rtcc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtcc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(SDK_PATH)/platform/emlib/src/em_system.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_system.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_system.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o: $(SDK_PATH)/platform/emlib/src/em_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_timer.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o: $(SDK_PATH)/platform/emlib/src/em_usart.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_usart.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_usart.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_usart.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o: $(SDK_PATH)/platform/emlib/src/em_wdog.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/emlib/src/em_wdog.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/emlib/src/em_wdog.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_wdog.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/coexistence/protocol/ieee802154_uc/coexistence-802154.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_conversions_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/pa-conversions/pa_curves_efr32.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_ant_div/sl_rail_util_ant_div.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_power_manager_init/sl_rail_util_power_manager_init.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_pti/sl_rail_util_pti.o

$(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.o: $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/radio/rail_lib/plugin/rail_util_sequencer/sl_rail_util_sequencer.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/crypto_aes.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/crypto_aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/crypto_aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/crypto_aes.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/crypto_aes.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/crypto_aes.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/mbedtls_ccm.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o: $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_mbedtls_support/src/sl_mbedtls.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/crypto_management.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/crypto_management.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/crypto_management.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/crypto_management.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/crypto_management.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/crypto_management.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_aead.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_aead.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_aead.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_aead.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_aead.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_aead.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_cipher.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_cipher.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_cipher.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_hash.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_hash.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_hash.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_hash.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_hash.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_hash.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_mac.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_mac.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_mac.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_mac.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_mac.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_crypto_transparent_driver_mac.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_common.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_psa_driver_init.o

$(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o: $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.d
OBJS += $(OUTPUT_DIR)/sdk/platform/security/sl_component/sl_psa_driver/src/sli_se_version_dependencies.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s1.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s1.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s1.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_dcdc_s1.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s1.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_dcdc_s1.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s1.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s1.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s1.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_emu_s1.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s1.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_emu_s1.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_hfxo_s1.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_hfxo_s1.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_hfxo_s1.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_hfxo_s1.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_hfxo_s1.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_hfxo_s1.o

$(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_nvic.o: $(SDK_PATH)/platform/service/device_init/src/sl_device_init_nvic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/device_init/src/sl_device_init_nvic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/device_init/src/sl_device_init_nvic.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_nvic.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/device_init/src/sl_device_init_nvic.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/base-replacement.o: $(SDK_PATH)/platform/service/legacy_hal/src/base-replacement.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/base-replacement.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/base-replacement.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/base-replacement.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/base-replacement.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.o: $(SDK_PATH)/platform/service/legacy_hal/src/crc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/crc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/crc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/crc.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/diagnostic.o: $(SDK_PATH)/platform/service/legacy_hal/src/diagnostic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/diagnostic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/diagnostic.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/diagnostic.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/diagnostic.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-phy.o: $(SDK_PATH)/platform/service/legacy_hal/src/ember-phy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/ember-phy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/ember-phy.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-phy.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/ember-phy.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o: $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/faults.s'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/faults.s
ASMDEPS_s += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/faults.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.o: $(SDK_PATH)/platform/service/legacy_hal/src/random.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/random.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/random.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/random.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/token_legacy.o: $(SDK_PATH)/platform/service/legacy_hal/src/token_legacy.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal/src/token_legacy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal/src/token_legacy.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/token_legacy.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal/src/token_legacy.o

$(OUTPUT_DIR)/sdk/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.o: $(SDK_PATH)/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/legacy_hal_wdog/src/sl_legacy_hal_wdog.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager.o: $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager_debug.o: $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager_debug.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager_debug.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager_debug.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager_debug.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager_debug.o

$(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager_hal_s0_s1.o: $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager_hal_s0_s1.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager_hal_s0_s1.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/power_manager/src/sl_power_manager_hal_s0_s1.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager_hal_s0_s1.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/power_manager/src/sl_power_manager_hal_s0_s1.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_prortc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_rtcc.o

$(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o: $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o: $(SDK_PATH)/platform/service/system/src/sl_system_init.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/system/src/sl_system_init.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/system/src/sl_system_init.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_init.o

$(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.o: $(SDK_PATH)/platform/service/system/src/sl_system_process_action.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/system/src/sl_system_process_action.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/system/src/sl_system_process_action.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/system/src/sl_system_process_action.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_def.o: $(SDK_PATH)/platform/service/token_manager/src/sl_token_def.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sl_token_def.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sl_token_def.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_def.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_def.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager.o: $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sl_token_manager.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manager.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manufacturing.o: $(SDK_PATH)/platform/service/token_manager/src/sl_token_manufacturing.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sl_token_manufacturing.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sl_token_manufacturing.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manufacturing.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manufacturing.o

$(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manufacturing_generic.o: $(SDK_PATH)/platform/service/token_manager/src/sl_token_manufacturing_generic.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/platform/service/token_manager/src/sl_token_manufacturing_generic.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/platform/service/token_manager/src/sl_token_manufacturing_generic.c
CDEPS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manufacturing_generic.d
OBJS += $(OUTPUT_DIR)/sdk/platform/service/token_manager/src/sl_token_manufacturing_generic.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_common.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_sleep.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_sleep.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_sleep.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_sleep.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_sleep.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_sleep.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_stack_cb.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_stack_cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_stack_cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_app_framework_stack_cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_stack_cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_app_framework_stack_cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.o: $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/common/zigbee_enhanced_routing.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cb.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-ota.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-ota.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-ota.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-ota.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-ota.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-ota.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-soc.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-soc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-soc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/counters/counters-soc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-soc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/counters/counters-soc.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-soc.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-soc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-soc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-soc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-soc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-soc.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering-v2.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/network-steering/network-steering.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/network-steering/network-steering.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/scan-dispatch/scan-dispatch.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key-cb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.o: $(SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/plugin/update-tc-link-key/update-tc-link-key.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-node.o: $(SDK_PATH)/protocol/zigbee/app/framework/security/af-node.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/security/af-node.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/security/af-node.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-node.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-node.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-security-common.o: $(SDK_PATH)/protocol/zigbee/app/framework/security/af-security-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/security/af-security-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/security/af-security-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-security-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-security-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-trust-center.o: $(SDK_PATH)/protocol/zigbee/app/framework/security/af-trust-center.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/security/af-trust-center.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/security/af-trust-center.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-trust-center.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/af-trust-center.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/crypto-state.o: $(SDK_PATH)/protocol/zigbee/app/framework/security/crypto-state.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/security/crypto-state.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/security/crypto-state.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/crypto-state.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/security/crypto-state.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/service-function/sl_service_function.o: $(SDK_PATH)/protocol/zigbee/app/framework/service-function/sl_service_function.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/service-function/sl_service_function.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/service-function/sl_service_function.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/service-function/sl_service_function.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/service-function/sl_service_function.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.o: $(SDK_PATH)/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/signature-decode/sl_signature_decode.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-common.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/af-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/af-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/af-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-event.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/af-event.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/af-event.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/af-event.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-event.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-event.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-soc-common.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/af-soc-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/af-soc-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/af-soc-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-soc-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-soc-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-soc.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/af-soc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/af-soc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/af-soc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-soc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/af-soc.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-size.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-size.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-size.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-size.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-size.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-size.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-storage.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-storage.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-storage.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-storage.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-storage.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-storage.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-table.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-table.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-table.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/attribute-table.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-table.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/attribute-table.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/client-api.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/client-api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/client-api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/client-api.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/client-api.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/client-api.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-callback.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/global-callback.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/global-callback.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/global-callback.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-callback.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-callback.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-other-callback.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/global-other-callback.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/global-other-callback.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/global-other-callback.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-other-callback.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/global-other-callback.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/message.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/message.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/message.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/message.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/message.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/message.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/multi-network.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/multi-network.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/multi-network.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/multi-network.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/multi-network.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/multi-network.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-cluster-message.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/process-cluster-message.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/process-cluster-message.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/process-cluster-message.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-cluster-message.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-cluster-message.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-global-message.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/process-global-message.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/process-global-message.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/process-global-message.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-global-message.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/process-global-message.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-common.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-soc.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-soc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-soc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/service-discovery-soc.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-soc.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/service-discovery-soc.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/time-util.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/time-util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/time-util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/time-util.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/time-util.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/time-util.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/util.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/util.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/util.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/util.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/zcl-util.o: $(SDK_PATH)/protocol/zigbee/app/framework/util/zcl-util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/framework/util/zcl-util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/framework/util/zcl-util.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/zcl-util.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/framework/util/zcl-util.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/common/library.o: $(SDK_PATH)/protocol/zigbee/app/util/common/library.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/util/common/library.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/util/common/library.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/common/library.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/common/library.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/security/security-address-cache.o: $(SDK_PATH)/protocol/zigbee/app/util/security/security-address-cache.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/util/security/security-address-cache.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/util/security/security-address-cache.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/security/security-address-cache.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/security/security-address-cache.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.o: $(SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-library.o: $(SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-library.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-library.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/app/util/zigbee-framework/zigbee-device-library.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-library.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/app/util/zigbee-framework/zigbee-device-library.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration-access.o: $(SDK_PATH)/protocol/zigbee/stack/config/ember-configuration-access.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/config/ember-configuration-access.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/config/ember-configuration-access.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration-access.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration-access.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration.o: $(SDK_PATH)/protocol/zigbee/stack/config/ember-configuration.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/config/ember-configuration.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/config/ember-configuration.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/config/ember-configuration.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/ember-multi-network-stub.o: $(SDK_PATH)/protocol/zigbee/stack/core/ember-multi-network-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/core/ember-multi-network-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/core/ember-multi-network-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/ember-multi-network-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/ember-multi-network-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-common.o: $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-common.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-common.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-common.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-common.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-common.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-stub.o: $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/core/multi-pan-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/core/multi-pan-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/aes-ecb.o: $(SDK_PATH)/protocol/zigbee/stack/framework/aes-ecb.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/aes-ecb.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/aes-ecb.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/aes-ecb.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/aes-ecb.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-extended-stub.o: $(SDK_PATH)/protocol/zigbee/stack/framework/debug-extended-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/debug-extended-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/debug-extended-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-extended-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-extended-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-stub.o: $(SDK_PATH)/protocol/zigbee/stack/framework/debug-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/debug-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/debug-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/debug-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/strong-random-api.o: $(SDK_PATH)/protocol/zigbee/stack/framework/strong-random-api.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/strong-random-api.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/strong-random-api.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/strong-random-api.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/strong-random-api.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.o: $(SDK_PATH)/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/framework/zigbee-event-logger-stub-gen.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/gp/gp-stub.o: $(SDK_PATH)/protocol/zigbee/stack/gp/gp-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/gp/gp-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/gp/gp-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/gp/gp-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/gp/gp-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/mac/mac-info-element-parsing-stub.o: $(SDK_PATH)/protocol/zigbee/stack/mac/mac-info-element-parsing-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/mac/mac-info-element-parsing-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/mac/mac-info-element-parsing-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/mac/mac-info-element-parsing-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/mac/mac-info-element-parsing-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/routing/zigbee/enhanced-beacon-request-stub.o: $(SDK_PATH)/protocol/zigbee/stack/routing/zigbee/enhanced-beacon-request-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/routing/zigbee/enhanced-beacon-request-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/routing/zigbee/enhanced-beacon-request-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/routing/zigbee/enhanced-beacon-request-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/routing/zigbee/enhanced-beacon-request-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-163k1-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-283k1-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-sign-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-283k1-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-dsa-verify-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-stub.o: $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/cbke-crypto-engine-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/cbke-crypto-engine-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.o: $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager-no-vault.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager.o: $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/security/zigbee-security-manager.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/security/zigbee-security-manager.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_dynamic_commissioning_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_fragmentation_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sl_zigbee_r23_misc_support_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sli_zigbee_zdo_cluster_filter_stubs.o: $(SDK_PATH)/protocol/zigbee/stack/stubs/sli_zigbee_zdo_cluster_filter_stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/stubs/sli_zigbee_zdo_cluster_filter_stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/stubs/sli_zigbee_zdo_cluster_filter_stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sli_zigbee_zdo_cluster_filter_stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/stubs/sli_zigbee_zdo_cluster_filter_stubs.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/aps-keys-full-stub.o: $(SDK_PATH)/protocol/zigbee/stack/zigbee/aps-keys-full-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/zigbee/aps-keys-full-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/zigbee/aps-keys-full-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/aps-keys-full-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/aps-keys-full-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/zdo-r22-stub.o: $(SDK_PATH)/protocol/zigbee/stack/zigbee/zdo-r22-stub.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/zigbee/zdo-r22-stub.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/zigbee/zdo-r22-stub.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/zdo-r22-stub.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zigbee/zdo-r22-stub.o

$(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zll/zll-stubs.o: $(SDK_PATH)/protocol/zigbee/stack/zll/zll-stubs.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/protocol/zigbee/stack/zll/zll-stubs.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/protocol/zigbee/stack/zll/zll-stubs.c
CDEPS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zll/zll-stubs.d
OBJS += $(OUTPUT_DIR)/sdk/protocol/zigbee/stack/zll/zll-stubs.o

$(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/sl_malloc.o: $(SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/sl_malloc.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/sl_malloc.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/silicon_labs/silabs_core/memory_manager/sl_malloc.c
CDEPS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/sl_malloc.d
OBJS += $(OUTPUT_DIR)/sdk/util/silicon_labs/silabs_core/memory_manager/sl_malloc.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.o: $(SDK_PATH)/util/third_party/mbedtls/library/aes.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/aes.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/aes.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/aes.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.o: $(SDK_PATH)/util/third_party/mbedtls/library/ccm.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/ccm.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/ccm.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/ccm.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o: $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/cipher.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o: $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/cipher_wrap.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/cipher_wrap.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o: $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/constant_time.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/constant_time.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/platform_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/platform_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_crypto_client.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_crypto_client.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o: $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/psa_util.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/psa_util.o

$(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o: $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
	@$(POSIX_TOOL_PATH)echo 'Building $(SDK_PATH)/util/third_party/mbedtls/library/threading.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $(SDK_PATH)/util/third_party/mbedtls/library/threading.c
CDEPS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.d
OBJS += $(OUTPUT_DIR)/sdk/util/third_party/mbedtls/library/threading.o

$(OUTPUT_DIR)/project/_/_/firmware/common/kagel_control_gate.o: ../../firmware/common/kagel_control_gate.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/kagel_control_gate.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/kagel_control_gate.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/kagel_control_gate.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/kagel_control_gate.o

$(OUTPUT_DIR)/project/_/_/firmware/common/lock_app.o: ../../firmware/common/lock_app.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/lock_app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/lock_app.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_app.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_app.o

$(OUTPUT_DIR)/project/_/_/firmware/common/lock_capability_profile.o: ../../firmware/common/lock_capability_profile.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/lock_capability_profile.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/lock_capability_profile.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_capability_profile.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_capability_profile.o

$(OUTPUT_DIR)/project/_/_/firmware/common/lock_product_binding.o: ../../firmware/common/lock_product_binding.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/lock_product_binding.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/lock_product_binding.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_product_binding.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_product_binding.o

$(OUTPUT_DIR)/project/_/_/firmware/common/nicki_ek_lock_serial.o: ../../firmware/common/nicki_ek_lock_serial.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/nicki_ek_lock_serial.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/nicki_ek_lock_serial.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/nicki_ek_lock_serial.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/nicki_ek_lock_serial.o

$(OUTPUT_DIR)/project/_/_/firmware/common/tzll_access_policy.o: ../../firmware/common/tzll_access_policy.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/tzll_access_policy.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/tzll_access_policy.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/tzll_access_policy.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/tzll_access_policy.o

$(OUTPUT_DIR)/project/_/_/firmware/TYZS5/efr32_app.o: ../../firmware/TYZS5/efr32_app.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/TYZS5/efr32_app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/TYZS5/efr32_app.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/efr32_app.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/efr32_app.o

$(OUTPUT_DIR)/project/app.o: app.c
	@$(POSIX_TOOL_PATH)echo 'Building app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ app.c
CDEPS += $(OUTPUT_DIR)/project/app.d
OBJS += $(OUTPUT_DIR)/project/app.o

$(OUTPUT_DIR)/project/autogen/sl_cluster_service_gen.o: autogen/sl_cluster_service_gen.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_cluster_service_gen.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_cluster_service_gen.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_cluster_service_gen.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_cluster_service_gen.o

$(OUTPUT_DIR)/project/autogen/sl_device_init_clocks.o: autogen/sl_device_init_clocks.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_device_init_clocks.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_device_init_clocks.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_device_init_clocks.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_device_init_clocks.o

$(OUTPUT_DIR)/project/autogen/sl_event_handler.o: autogen/sl_event_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_event_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_event_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_event_handler.o

$(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.o: autogen/sl_power_manager_handler.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_power_manager_handler.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_power_manager_handler.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_power_manager_handler.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_phy_select.o: autogen/sl_rail_util_ieee802154_phy_select.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_ieee802154_phy_select.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_ieee802154_phy_select.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_phy_select.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_phy_select.o

$(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_stack_event.o: autogen/sl_rail_util_ieee802154_stack_event.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/sl_rail_util_ieee802154_stack_event.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/sl_rail_util_ieee802154_stack_event.c
CDEPS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_stack_event.d
OBJS += $(OUTPUT_DIR)/project/autogen/sl_rail_util_ieee802154_stack_event.o

$(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.o: autogen/zigbee_common_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_common_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_common_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_common_callback_dispatcher.o

$(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.o: autogen/zigbee_stack_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_stack_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_stack_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_stack_callback_dispatcher.o

$(OUTPUT_DIR)/project/autogen/zigbee_zcl_callback_dispatcher.o: autogen/zigbee_zcl_callback_dispatcher.c
	@$(POSIX_TOOL_PATH)echo 'Building autogen/zigbee_zcl_callback_dispatcher.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ autogen/zigbee_zcl_callback_dispatcher.c
CDEPS += $(OUTPUT_DIR)/project/autogen/zigbee_zcl_callback_dispatcher.d
OBJS += $(OUTPUT_DIR)/project/autogen/zigbee_zcl_callback_dispatcher.o

$(OUTPUT_DIR)/project/main.o: main.c
	@$(POSIX_TOOL_PATH)echo 'Building main.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ main.c
CDEPS += $(OUTPUT_DIR)/project/main.d
OBJS += $(OUTPUT_DIR)/project/main.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA