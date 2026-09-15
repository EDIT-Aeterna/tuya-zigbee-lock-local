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
 -I../../firmware/TYZS5 \
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

$(OUTPUT_DIR)/project/_/_/firmware/TYZS5/efr32_app.o: ../../firmware/TYZS5/efr32_app.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/TYZS5/efr32_app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/TYZS5/efr32_app.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/efr32_app.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/efr32_app.o

$(OUTPUT_DIR)/project/_/_/firmware/TYZS5/kagel_control_gate.o: ../../firmware/TYZS5/kagel_control_gate.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/TYZS5/kagel_control_gate.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/TYZS5/kagel_control_gate.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/kagel_control_gate.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/kagel_control_gate.o

$(OUTPUT_DIR)/project/_/_/firmware/TYZS5/lock_app.o: ../../firmware/TYZS5/lock_app.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/TYZS5/lock_app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/TYZS5/lock_app.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/lock_app.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/lock_app.o

$(OUTPUT_DIR)/project/_/_/firmware/TYZS5/nicki_ek_lock_serial.o: ../../firmware/TYZS5/nicki_ek_lock_serial.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/TYZS5/nicki_ek_lock_serial.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/TYZS5/nicki_ek_lock_serial.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/nicki_ek_lock_serial.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS5/nicki_ek_lock_serial.o

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