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

$(OUTPUT_DIR)/project/_/_/firmware/common/lock_profile.o: ../../firmware/common/lock_profile.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/lock_profile.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/lock_profile.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_profile.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/lock_profile.o

$(OUTPUT_DIR)/project/_/_/firmware/common/nicki_ek_lock_serial.o: ../../firmware/common/nicki_ek_lock_serial.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/common/nicki_ek_lock_serial.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/common/nicki_ek_lock_serial.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/common/nicki_ek_lock_serial.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/common/nicki_ek_lock_serial.o

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