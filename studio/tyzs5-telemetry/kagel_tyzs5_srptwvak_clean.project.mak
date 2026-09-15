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
 -I../../firmware \
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

$(OUTPUT_DIR)/project/_/_/firmware/efr32_app.o: ../../firmware/efr32_app.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/efr32_app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/efr32_app.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/efr32_app.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/efr32_app.o

$(OUTPUT_DIR)/project/_/_/firmware/kagel_control_gate.o: ../../firmware/kagel_control_gate.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/kagel_control_gate.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/kagel_control_gate.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/kagel_control_gate.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/kagel_control_gate.o

$(OUTPUT_DIR)/project/_/_/firmware/lock_app.o: ../../firmware/lock_app.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/lock_app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/lock_app.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/lock_app.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/lock_app.o

$(OUTPUT_DIR)/project/_/_/firmware/nicki_ek_lock_serial.o: ../../firmware/nicki_ek_lock_serial.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/nicki_ek_lock_serial.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/nicki_ek_lock_serial.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/nicki_ek_lock_serial.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/nicki_ek_lock_serial.o

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