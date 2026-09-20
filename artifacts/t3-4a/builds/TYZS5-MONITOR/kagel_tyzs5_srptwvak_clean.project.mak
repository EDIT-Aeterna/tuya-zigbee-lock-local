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
 '-DTZLL_ACCESS_EDITION=1' \
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
 '-DTZLL_ACCESS_EDITION=1' \
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
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA