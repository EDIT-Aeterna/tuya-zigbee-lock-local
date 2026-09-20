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
# SIMPLICITY_STUDIO_METADATA=eJztvQlz3ciV5/tVKhQTE7MYhEhKVWVNlR2ypKrWtGTpiap2260ORBLIey+K2IyFizr83V9mYgcSyO0kwOrp93pcIon8n1/u+8n/ePLx04f/++bVZ+/Thw+fn7x48h9fnnx68+7l57f/8sYb/unLkxdfnnx58o8nv+tCXH345dOrN1ck0A9/vI+jb25xXoRp8uOXJ+dnT788+QYnfhqEyZH84pfPPznff3nyxz98yb8kP2R5+iv2y29IoKR4EacBjsg3p7LMXrju3d3dWRFG6Lo489PYLQr3qqyCMD3DfppjIktCZzgvH6588l8SrlH78oSJf/PND4c0CnD+TYJi+mc/TQ7hsfvr7O9f/WjwR/rnMMKDP3q1wNlXlBHjVR6SX9NPXrivX7iNbbd8+Fo8d6LUv3GyNC/d12maO+/oj5//+vTl03PnLixP5N9/u7p0ytT528V75xDm8R3KsVuw6DUSJY5wjMv8wa3NuoTAnVK4fVzcOjKDyA3oi8iLcZzmD23o0x4x4FG4fGA/rZKSlCJnT14OxAJugsu7NL9xihLjnBT0XbFXYBbwScZ8DY/XGHuEzoswOnhFifybvUuLCGopOj5KnCAsMlT6p12zYolEmA9FWuU+9vK0KvEjyYUFpIWoVFmASuyUvhOFyY1zgx92zYhVnIUokMbWOeTk36w20T5n1yis4iwXqCy9w7kXowQdyX93LkpLMEs50JS8CONsV/QFkOVUz1EYeVVJ/qfAf6/I+Gf/tF9HWurYbuNLL8AHVEXlrhFYAFnAzgrk+flDVqa7QnMxFpBRlnnNgDbExa7YiyjL5T3AtyHpHMIkLL3AD/y9C/sKj1wkcFw9pjiMcRaiEOEj8h+8E4p2RediyDSV496BxfvRtJmrbOvdV5OPj6D/mpHI1YXT4X7fdnSdZzkSZXqDk8cy9lmCWcb3q6JM4ybgCSMyvd+NfoFFCE/iWx2QX1Z0JvqoorJOJtVeob3L1ALLMvygbb4L0uPe/Ms4C1G4LiPSBpQ4JzlHGrLDTuhcDKkiU4Z7p/kSzAI+jqPw2qPTTdIGX1f7FpkVmOXUZ7O2Moz37wK4JMvg8TUOymjfuQAXQ4z8CMY8azRtBCar5pMNAVSV6REnyzsGZ0Xk00XJEi9vHJz5eTf7IP/cNCWaCLg9pzvDUdhCIPPCKPRRGaaJVz5keON8bWOzQLJQKD99fuO9SuMsTXBSFjshzyFWBk7tdx6JIIrSravPIJm5KHJzBp8yFWf7lPdFlmV2fEujeUJJEG0+NB1gzzBkiXdL6BnGInE46Um8RmW31F4Dko9FmaOkOKR5/Pjiw0WT3SrYvWQt4qzkDVtxfSyliw8joL+uwqgMk8cVi2UomUlPiDH+/unF+fNnXnZ68Apixi/3K1cSYIqxqvelWUv4yKI1IVtaOA6TGzKXJb85i4Jd+CcEgv3A+hgAiqJr+o92f323flsGSzdG+xQnGaz1GJGhY0wG548uk9a5tOO0azatc63MNKKqKEnXWuCcDZZpk75b87UAo0a/30yJD7NenthpvsdWQVag9GKza9VYgVqPDTp0eXqoEp+uNOy1eCAgEsZjuLWxfxxmNAv8tAb1hxB2gZ4iyK0aHrF/k3pFcOM9O3t+dr68ephFqKSTs8na4eib12wZY/TF7JurMArJwPwdui4mH84+ffPTp8uL9z+fX36cfTmXZef9ON9Nm+IHUiZjDx/yy4v4eH6ZzWr8qxfuL6RhLNyXOA9R5F6FMV2+C8uH+kC3e/X6nwu3Sze3TRi3jr07iKDbx8CtAV2ufVdIXaK8rLIdsbkAc+7ZquxCdr1NSOsQSORXb/C7y4vD8/OLY/zs+1mzYCnyDaW7CCHMuD6kh/w42w+8M6+EHPh7EtfWlYAPXhZyur4NoXsCVXDSH+xN3iKooPtxtSN1Y10JOH9I2bbmnthDBkX4rEz3JW8AlLALznxnQ+hiOsMRI9M9meSwZ1IPCJTAY0SCFn4ekozas5DPQRSjkeO/74vfAKhg412bQ6zeHOIy3hO4tq4CfMgqfNoRubOvAn3M/HzPwVRnXw063LP9a82rInt7jrN7ABXs8GLPwtFYVwIO0K7EjXkV5Ig06Dsit+ZVkT1/z8ZuQKAEjsmIq5ifudoQvCfQAPeuq8P+8C2FTgT2LTUjCB38onwE+DWEGv7eM8sBgRp4hfJ907wFUMGOiz17oca6CnDmJ3umcmteCZmzD7Mh8XTfRQp43+avB1DFLsJjgqKd03tIoRKBfNepb64+9c3TuETX0Z7DlCGCEnq5Z8PXWFcEZie096XuEBTRd05sndQmcd2b2tMEz/GefeQQQQW92LX5K9Sbv72HqloD1eZC2p5Fe4ighJ4n8+sxG2I35lWQq2LfWUFnXwX6dt+1qVuNtSkaxkuzPdenhggq6PQq9I7YrXlVZDIV2nOKMEQQo8fNDbHNgYeGxaeUZmebNsblAkgfUuL+mvNL3q+mvjvpEef1c3Bh4nPOv40PDaMyjUPApqzmcolpd6Q+TaLZ5b0kCFGS4AJwYjpmGVsQ81SAe5ZTkoq7IznLm4IYA+waJ3nTqYs46nC2OHp1EUcRhZBrtmOMTlxIUaKyslZKe3VX1EjM6nuRS9T3OtfBjnY29MS0O1IXpuJDQY+hzy9EA5EM9eXKlS2QVlw9P8s0jfwTCqfNvFTGc1xRMFfD4PHsKNsY93ZmCb/QK4q7raXYkEn0MbTQNvWRaurlzBynz+en90ZockxH3/eyHIf1aMY+29yeVJnQGhJdp2kZpfQaxfqwaOzNcb3FHH8LV3d61olzSXduUb3hQFm4Hq2RuyZLsQrdmZXVhnjsQqoo0xwdN2IbWltlHLpZGWQSWDWaQC6bE6YkzvM091PIOs5JwZEV+dy1yjSyolDiMpQXkGuVqwWuN6ZRJ7ZBHFgTMua4wKUHe5aZAzc2I2wXxV3Gq/dXb6/We4tX7GmN9RHL8lWjUUr5cREWbHso5PnU0U4pFguXgnbLFHNTgrFBHaB5p2QDtIElAVn5lXrZKPE94NSPgzU2I5VaR8gtgsWUOi7tAoyJqAtAP35mF2hgRMATZ5WH8vj2O6tAIyv2RpbNJfb1hmLgYEvUXsjNcDgeu8DSsomRO7DRDtn5ZsVTi6mH8c1hW6NqqKCXKSRJF69QiJxOb07aGlVDTW4hl5QlUVujeosOcksoMy/6xTncDIUXz2ZJZcGucknfg7c3q17e9+Ad2NUo9VvTtkZ1O79ZReg9UAOsOtILQeAp0hOyBGlsCPLqGhXYyTER83HMc0sGjcUzKGAMQnRM0qK0UYwmdGNTAi4cX+PcyU6Aa8cLWCNLAir28k1xNvWEAo3UmxHw5CgJ0th6EvVmRPMm5lemDm2damoMduV/OhgPOY3TLP71d/DDkEHM2Siklumt6XssIdMrMv+ML8VxG1Rf2/FrodyxTf1Y8nqWWQRPG+Qc/e9JI8+G68EF4CGBBczGhqh/61bLHAvLrAtoS0Y1WB2UAZ7lUeBtDcszY5zlqf1851oUUVZlCbl8t4TWmRGtSkFeSF9qoJYunU+O5sWXF14c+rmFSfSEaGJLOLq6uL932NK2E+CDhUWeKR7HoJCxfmaE+3gFPN/YmIBto65CgoS1KXmVlYXDioB1LJ5BAWOEA+tYjQ3RCjGtHw702bIFpKkxKTb6kIb96jixJUO2DZMETavjLLxgBs3FsSc3K7MN1psR8bTNrn2koSXRStaWcyWZPT86nXRGD9I5NDAunHPrlCLj+uz2ewSRcXX2PZDldhwGb+XRjvCY1wdlTmlqY6dsWpTF9i0sybI7HTCnQSeiNleImIF28Zpj1+Yx0ak5i+Wijua8cCxdH9IuD6N3YGBKw0gSviyM5NuSMLMprvLjF3DYi4d7wPaWVZFpeSieWtnWksAeWReih5PQWR7eotLCqhKPfMW4zeZiXCYtx7RpKmY29erBDrC9ZdXCtA0txyhYI1xfBIRpfZtLhXRDF75dqMUH92KGpsRFrQmQ5amPi8JD7J2FjSjnRm3W/WHSgBfPJn7tLa+xKd1c2IZybhSuEnXv/wJVpE7PQgnttPurXUNrEpnYv3ZMe2LmdGVTzJFZZV5SDqhTnu2Je8PKzDuUhbFdiY5xHNRCpZ7C8kxabVj7emIzct1F3qE1pfTfAG9qDqwprU9ggE4Ka0m6gghegUa0bR0a2RNX9ZHGpohKc9YuyGB9a2PYsWUtZPqAG2Gz0PzLog8JbLZWtWmUhfCtwTiqTXs1sqda6rdEVJqhjoJMnznbA5vHoFd5N4ZXXRbnVZ2tSzPXuh56vXvhWdj2keYfIhhFwsL+j2okZHaBBO3vfnEYENi77IXjIL9dv+rFdb6k091g2BvaDH3oUAYv3s3WHWYmt5zzqeoRpzJ0pEcPV0PHn2qz2E+NCIo9/dwqiyQDfEXjpctKXeIxgc5MeTxyR6zaT71DhApA53oLRL0ZGS56WdIuUmvB2h23YZVpn9Gun6KHG/gPIkZH++sm1cqDVcaRGenyYBWptaBXHqLwWlQeyCfM0Kv3z9hFdGQhNsSGy7Fjs4efx1zVdSKOPf8UAh5ZZ1DN+ddOetXxBv0O8vLymIB/RZkDwLxMINBefMwxMCDw5BZ69tJkrC5KF2jXjaM0kfTcSL68hnRUOGK45jkp5JQP4OO947Ih5zmSfJmjmD4Rb4ljoC4CAXewMgJZcaoyz5gcdOIxypZc7DWo+c7GWHeCsjprnCIBP307hll81paPYblhndoQQYE6yhihLLjDmALAPhU5Ilh6BnKKAPoW1Ihg4Z0nDoDdYjE2IMIBfbdpxLHwJtOsYbdWKBfe+pkBgD7cMiZYeJRlilAf07AE0YvLYVhu0OdGRFjAG7sjmuVd3AkE8BsXI4jF9yumELDnn0cM/CPOID6rmzE34DSactfOJlplqcGSJYJGWnJkYgmiE5cZBNhhwHJZwXpqOwSttMwgwA5BoyzT69oBaJRlel07ALlcKYA9OjcmWDget9Dr2oHoxeW6NzsUi4fY+N2bHYhOW6p7s8PAv6ik6UrSJ3zlw/ryY/0sRpYmOBE6k6Qe4K9xUEaFV1RZlubzEJwNTHq5XsKHThR24sj3cYTrS26Qe8B1erjDKLvzOLk1srtGNF+TX4lOGidhRu/IQj6WaxKbCZBUZLICPaJ84dHo+wni71bNjyo0QJAH0ySj3r530QMIM61ZdUGQbwko8Y4BhLythO+DejZTAJ4Q6Jcn/qmE5fK0fVVq3/PoAYT5Q/LRQ5BHKJRgB9bFJd+PdyQdWBeTxsjfE3VgXtwJnND5jqxD8zKsF8+/3Zd2ACDD+/z8Yl/eAYCQ97hrDTsq1DB6j5SMFW5RVME62FFraMcM0j2L5GGbWj/Iw1vOfQzd3ikciHoHjMoq3yQFe6v91Vo+iPS4tQkL7wBKKwprrqF4d4Zwu9nqBTjDSYATH/QlIJVorMDIDkjrw7fxNpOhSRS4CFK50IQsc5QUGcpJUI9uxNO5x05ZISLSjRa4KzKjKK05K4Od3Y3qKPT9eHEadL4o5hCa7dze+D2GUTu3SzRWYDTauc2jwEXQbRDa7AyzE+zlR/nskKEyjN4J9FAvTOROiyeAlaJGZnmPLWYNkmHEEEbBY4tZy2Q2xtda8M8Rid76an+OwsjjHcaWu3Y0yR2qBjdSYPhuS9jeLWptCJ1vkmDxAfBsyjJOa0cGqT5AW79e6dErUoBDqxVCvlkZYODh3wqjrB9a9jH8BHSFbG2SKTclz/K0TP2U9/zA9CnhiPeYIy8JyJfWYt/yusSIO7RmsAiOMf7+6cX582eS8esD2I9mb8vl2NaP9F18Xc3feebHl31rP6rMjDu2qB/Br3foVrbAsm/tR5CZcccWDWaLYYDvUHQjGcf2c/vRbC25M7vAy4n0RpC43cKH/PJiIZHmH94fz++5H/PSlAJ4RYb98AB5unPa4BMrLoNzO0SXb587TF0sTyZpj6oyPWL+wGt6oY6x5jjCqJCokW2ANq6X9PJbGxzust0kkZv4uBNcV0gDXKazqDqGEsnKoKpy1CNIbeXyAnpFifwbD9+CrnVO2wcWM5dn35XkktlE4epkpwevIHnmP67ojbH0u4IMOX6aNOtAS726fls3ws+QR2aftxYHuE1KjiM1aPqWcZSav0kkqVBvrq7vcFN2qSguIQiLfZcIu2FPrEsRz6K6bYFaQpBO7XpeuBs7D0G5pOyDvUos2+gN2oCR/2XuY+OCNm0mYLsKrdl2JdjUekKOxmbdoEb8oIpFGaqWgzLcMOPL0OVZV8zaEtCLmRYyUG4V+O8VTnzuuZC1BOjCbZdznUl3mQQiSRBdrA+nfrdECdKE2i45GoPuEoVagW4DblaoV/GNCref4vuwKGmZkBmTryzFcr4eTCMq/rGBWToPeJxmDdFyIRlY5C1pEnKXD8UrMzLxsVxq9OKzMDBbn5usTVvkdsDW0mvLhGo2LCbWrS1VydywjRHvhu28GY4r3gSZ23iRT70c019Cpy2BdVsTLt+c2HllG2grOKUdqQFqmARhjv3SIX1pZSUp5xZWb9FFdHzq0GMAFlhG4nIYDvDLNhwYZ/EJm/E9GPKlfwojwMdTe5iRuBiDNDEosQfSywtRDkQC/OnPMc7EhBDJLo0CSIb8G2w7dWZGxFinB2swtbQQwcphhhZi8fzCGKOKytBWQzcSF6ZG/XWCy7s0B9+wbFNlZmTdkZ6PAA/k9ySt7qrxKsvs9UEjcfXb3PNfjMdRdDo1GkNN3+g4hXngZSgX3f9uLqyIxm1swy6fas2SFOK2KY2aO+Bv72W6DYO7eKN0egvQPsryVdERCszRWTHNymFYDpB3l6NsK6rOmAgtTYqSrhNQlxAbwE3NCfDKU056QIiHVYRoI1MCrLYBsk81tCQJxdZ+tiPrzInwCrQV2cCSAApF4TEBuRwlbkaHpgRY1wmZfZqf9RUy9XZEQKjA3z5jr2HnCYDDeDHZ3KAIkSRvBeT+VIw3NiaHFqfmcztZssaWNJiXo7st4Vp7SoCkONyiIgQ45ahIOjKs0Nlbx5wYE3b2IDdyJXr55Su3y6MPj5rdAo5nUw10s2Zw2a4AGPtZ9zmI7wAhKs+iFORWVXpqTQSXlHmaPXhZGm2Q0VNrArgoTkvzlRYhVWdGgBMH9NaWfZ7ejhhomwZ4YEiElBVQLhHEVCNbEmDs5tI2XJ0pCawcZo1ViiuXfTyQflzmCGD7UYqrMyWaX6EA5Jki8fSqNyRCutmwq5wYE6Nt00AMDAmR7vKw3KBUDQxJztm3zEaeSdGVReqeMCq9E44yDOC4XgjJMSjavC4ij21IbgfJNSmB6UfhJgsiY1sSYHEI8EiDFFZrSQKKBD2/3HAUy7cpDXqDHzYqemN7Eg1N+25JXSQ2WSWcmdS7fhwmflQFvONxkrs/s/RAAPuoiynQ4HY/I0mPUoiY3ZCqsSbGKhLzN4TlsRprUliWO3Qe20rXzl3T3Y6utydGY6tvG6J19sRoVRgFpO09mL9YJI83sin2iET+E0Vb1tWhRRl/sRuS+XLZ6p8Q+b+LpxuSDSxK4mVpZH7GRxGwtSmBSEx4tdPwLSHHVsWY9ab9doCdPSn3xBuCLZxjmmOxR8OcizPzY7fycCObEog0/z0U/FoVpRfhI/IfoJ78U2BehdCLxCFPY7trq1LRGGIoRoSOs1nwWmqviHAwNCJSVHQijctHEBkOimKEyCxtrwg0phWB758//f1exK1tWeQ96qxCBR2cwtqScmxWDFrmXpBfbzmeGFgU4sFcYpBmW7zQwAHbcPlg0dvdFOq04bi/MSaEwn5w2o6qtSaDtWX70ZmTAPs1QzcbNhoDgxJwFjd05mALmzr8cwQbgvUGxXB2931naMt7vxOw45aLBEfJRYLTTXDYjqq1Jsai78ps202OTAoBo3jD7qgxJoRqnw7ZesVibleMavHc6Axv4dzoDOn5lkzP5aBwnOYP3nV1OFDX0FGUbriesmBcCJ2QKVyR0tt+G1aSiVExZEimQDcWTwjPAHuDQrg03LB+NMbEPqoAHm6Xhsr4D7nPoSweD5oxLZwQmiH5xbm5Cy8FrNaeFNqGrVxnTgrsu23BvpMDa28rbcc2sCiNt/G6x8ysPCi7xrQ9aGtWDJpGD+eXT7esJQOLYrw8vEUlZm/XFht2r3O7YtT20tp2kAOLQrw8JH1McP7thhukI5NiwC3XS3LJ1RL6iuZ2VK01GayL599uCtbYk0G73BTsUhbr+ZajlN6eGG3LXRzZfRt2thP5pw172ZFJOUC2NV9UYbnlcjnPshxumt6EWydoZ1MKsQzplHJbxN6mELG/4r8Z4cikGDCMt6Xr7AnRGvfH27ENDArhtt0Ylt4Kph96fr5h+zy0KIu3YX0dWpTEKzbcnhha5BxYl33HoEDiA95bHU4iMK7KGaT6QHxz5oE+J+LhBF1HeIMVth51yb4ifnMq4gY/EIthDvTWmkY8FkH0IlQ8JGnysMWeymJUhgiP6sg0JVY9Ll1HkIYqw6R+i7LYZkw4SF++eVX4LCc9ehlCPGyiAz82rwpP6wdpR+nSySYjDU4E5giykahPrG4K3ZuUh9xmr3MEKX80uw4xfs96S9aZZWXkpMT3ZbFXG7KOoRuZHaulGEU3Ujs1lOsYspEhQfMNVjsH3J1FWcStzkcPGFXOQdchttuuGmAq7Vg1YQrclJxNSUdWpVHDrxvXqc6iNGKZVwBv6CkxdiZlIbefrCjPSm5RVG3M2JuUnp/DPfhehCQaaeJF6Hp6hXv+JfmGuQcUefptjg01T0dJvNMQ10eLQO7HD2PkDqDdMZU7MivyNdB9C1Iw1BE5hUPuGn9zdEsyK+rupnXUXoe1HOUxoLtEIPKpyD4EeppCCXhqWQ60Dg3npFWRdmxer2Sxt189Fm9RsWKfbpI5Ayh3YlUqlhB+1bmvRU3fQA+P13iabtOHnLP5G9qTTw45+S/1ki9207HyGNEor2oyjxj3OvV29mj8JlX33joz4hIjbmekfY1IACDsyLnh6+eK/esdozBE0IxEhLG5s3WDGLT29fCBFj+MC5HMaJAbHugVbm1++de2+dEnQ4lrBOBNzyAHBgiykcDJCSU+Drw8JW0/gNd8FXyecf1dNEJ5G/rYOVSJTxd7pN6PbAJ5bSDL8Z8yugsI4rMTnHB2S54Uutk2KHtDT+bJSD+tqK8/vlus2dXl+lsnLZHl3O0eAawtulPTvFxdoi0AZmyatMXSrG2Z1nrfvwi73OUvsFquJkugS43yYopGAA8cayZptPC68Xrd2om2Mc1tMaUfE22ew3KKEhPY5CjTsEzDbFMDplZnv5CsDtNgzu3FI4lAQ6ITh80aTXEk5BvRWdCtGlNxJKQb11kh3KQxENcFuWZsFm8w58VA+bDu2ViloaPv7jlBWGSo9E8yrdwowDblcmTSnQFIZOg4zCaZuAZtnGtVFqASO6XvRGFy49xg3jt/s1SYh9om/+Z2Ob+SzMl5wM2aR6loyDeRnCTYpGDK5YZqEZWelIfHBJVVjp0A+ynX4zFnZtsG8upAtiflE0Z3AUFqUj4NZ3lSLoNuNCkvsE/wZ4+UcmKPDk6yQWY1PO7AnNiz8sFpwzmbrLYPKTmWZYDLvCpKx8e069+QdmpWcmufjFVIk7IV59SmSgGwvkw2z3mFIxJNnDZinNoUt3B9WQY5FyrJyTErj0ps0N87pM+zvUgxB54a12+I6dasVCO8SQPHNopHxqTqoPX5ecu1Mv3mQG2bZmODMoj13tQ2dJ0tMVhZ5uF1RUaS9EDdJngziyqQZZqj49acvVEF1JJeYNoWtDMp7qjY2ycOysItCMfWJBx6FcVGmTwwJcaqojJ0mnWdTeCmBiU8n6TU9YjjR2QASE8xbZeSK6alsY9Reo2iPajnliXGJvVeahAWfnqL841mJfXprhXbMtfNscNcwGxAOjImRNuKShroqx9tllRDWxqlb6Nx2aJhsXPXuo51J1w2gOWYlMVMyxNpxXaAnRuWH13anRmNR5cy8zfycYxC26daWq7WlNTKTHqDt+LqbGkMdLcg5BlVHuhuCtqZVBnobkA4tiaG2+K8Zw2mcLl1i1WhBkp6IWjakG9AxzGp2XdsBzs3LOMscZuOozOkPrbZAo9rVGEsvQHiyJjcWHoDKmkgOr5lj5k4m5U5jkn9xdvl915nwwvLcWuvSCK5lwLoEATkXqkslSN/qZQupW4y1BnQqQxz6g14h/lUSGjfHhPZMDlulZir9vXLMhmoSOzidzs21s+xEgvu1Jwwb9KMnlffiG5szOwesuy+kPY2fpeUKAhytirHXGTamMQ2ned0z2xmWHqvz0pe8inN6lAt76zdMOTe1yE9EhtpWFwurDu/CZ+7ZF7ynlEbsHlKfTfwgX1x9xKH9cFLJ0N2Jlp84pldxTS2ODNUKBvq3G3e7AU+sG/QOUpeBLZeEZqbdioF3nbBaZAUCoj1IjFJJRkm6onHQUng/JpaWp0cks2smRTNlUtz212VamIndT3K0EHLfBREb4mLrv2vDJV4rVc3bGm8QDhJ6tyiKoI/r8Ho+5GIjH2Bv4wFiZ3I9YHtXdiQTPP1CxpSUWB55hRVlqUADpY14zGDEETGv74hPX59ihAnZLZJNwIq+AP6E/wVs+rA599e3pzvhT02rg5/8f2O8GPj6vBBgZxbAnd42CsGHAK9aNBD93tGYmTfKCd2LVGLHHpelNY9+AznerhwsIWLRXWMB3O73o4gk+qlZ4vZ0EONTUlx4fsSJwEOtgSc2ZTraGtHVVF6pP0bDeocMfzKyRRZZFzkEq/M0+To5GTkn8ZWjlpOgbkW9Wpd669UvCoZh36eSmyKWNh/qOPforqMxEUQniIVNn+kBuN2Yt5uEqxY1RzI2tkvkqJe2zzaZsF4jClYLJ72QGTGbxloYEWUQmmV+9ihnpngt9cmqTQxJSDD8fVGpWxiSVQfomibsj+0I59WtufInERTmRazYFugSacaG3VsklidJRFXnqf0a/gzAhOqoR0Zpi14ZFYjTmFk/uzQOktnQ6oMoYhVgBKTHsrcvbFMWZpZlCvrFd07f/AtHMbkFviROQFhe7HCLtjAiohndLXGMtXUlhRbdrI9sBnZETC13mzoOBvmQZB1Nq494XyLKDggD04JxjojQwKq0V18u1xTU3Jj/2bnlEltM+KfWhRw5ujO2ab9mFgScF0/lPVxzLAMrQ8Y58ak+oTBUsAWfcLYnIDQ1sbwGGz9RMCo3UW+E6EH69V0ZEdUxtK0jFJke0A0NKO88Gx7sMY1qLFueLRw4YfbvvGsisre4UgKqu2C1xkR0ByzTSbBQzMS83L7jdjAiqhehgl93tnS3adJ5ZzaEo2DIq/W8ZpDmDCPcArGRItGpWnL6JY9UbEZ6dCgNGXwQH4V+sxVfljQt6ptuMpcQl60rrfKX9/AEj5Owvr2+tsqR1ZcrNcRrm24CwalRjyjUA7y6fX+zWkHdkXdqZ3bdiPAtXt247kKvahqdSbQEE0MSWHZmxCPoOTmw7w8D/CBnryx1WuulLahZb2G4Dh/SGc+JrC4T3zM3IEBieEJyyurladGmhrSbWc5T8Jxi9RoschmitePQa3YlFulQlZPzNRPvs0sSaNZumLBhVu7TyHKaGtNBj+P5RchSbw2qGqTlBTVuSXUTej0G4FaVHiKKSuoM9/COVRkNmKxbnXHuXn2RNOxIHXyi4sN8KaWhOP0sB0qk5Be44zKI5/YW35tfxCZVtisr+d6Tu3j2TL2mlnNgh7xLzNO5vM0S20NzYm+O7Ihs+9vv6FrsWBGFc2LW+IjWostz7Rnat7ycq4xInBOjv9e4aK0Wc2bOLS/FBEAn+qKkS8qqXS1li5lODhiz4GSPiAv2OMg9hKF2HSFdqV6RXs71oxxaEOvDLMKKvH+8dr6h2ezJWHaohUYT7ad6XXyi0uPCPhec1Fj00gsGzfpXzeJgpR96Vw45OhIaxebR2+aBQuWpWqRzDW56yqMAtE1uaPPb/+mk9cS3zvxM5lX/ZotEJIGToSZrw3ebT1u0Jy0dKjAHm3lItxMVRaCzrcSuYbPEHBeslR1SbK5Xaq4XMsuNzbuGijv1urKzdD1P3FzZTjW2zBPRmdDN8yRoV1hfkwh4XLD8AKs6HXt6Y/jwUs4X/14/YIm4q/YL93y4Wvx3IlS/8ah3YD7Ok1z5x398fNfn758eu7cheWJ/PtvV5dkzOr87eK9cwjz+A7ltFlj2VNLlGyUUuYPbmvS5fGgbP46s12cxiKXBh/yywvPIlP3D/rn5+7IHpeImtkEqL0zP7DHBUpC/yb08I3HvixYFd0Kbsk2F/QGHXFEBmVJmaeRd+S9Y2IJk295OXsJQ1D5pdds626a1Rzby6A+ytA1PXD0QMPRP2/KyjfPxc0xCmJ8dirjaNPGZWS3IxvtzbSIr+stGoIXoWscjX5znaI8eJXGGQlRx5iNuuKzIiQfF2fs72dJmuAXT8/I/0+CkMlgOQ3Bmpf4eH6ZfXd5cXh+fnGMn31Pvi3TNPJPpFleMVEUZ/SzszAgnV8en3Vhzo5JdeYH5Yvzi7OLs/Ozi6cXF+cXT58TXdIbrykGN2f10IbMMXD+4tnZcxLcc6jA828vfv/tYBTxQ5wGOHoR4MLPQ+Zn6w8/uPPftf3dKIHZb39oc5n99OR3T67evv/47u2rt5//6l19/uX12w/e+w+vf3n35urJiyf/9h+0xMTpLSbj4xcHFBX4d/V4uQyTN/dsy51MSV/827/3v75iowP223bPlnYttGSSyNEjeV6/mvO77pPrMvLY/YkD8rHnHyZ/7l/r5YTFMRmcsPMJHrtbwDUQ4SPyH7wTirh/nj8GyvvoNr70mi1ErkpWIK8+gMX98+idRK4FMuvxyUQtjb0YJRVJi7KiNB5bBvNOpBbVK6S8EKvf1CdJSRKHpRf4gc/nG3+H40rms9PhfiG6kTdI9bsg5ecM+Sy+xkEZ8UvG4M+N1aWvSEnNH5b+mqV3ZN7b3Jxb+ihHYeTRs6NehiS+GUmytBCHKUPxRwVdy0v8Zc4iwjijTk4Xv6gLgyC6zQSbVE2PTrA81goJPq5H/x4b/XM/5b0ayfmMOhzt7uM6tPIufUb/X2vpK8pGf21WmpbLRUtNE2zwAW2wSLNZRWR29+LLkx+aRvHF+/fsl9/cx1FSvGh+++OXL1+enMoye+G6d3d3bbtNmnC3KNyP9UdnmG1df6G9VN0SsmBlXtW/DAP2c+Wf1XbPClxW2Vnlv6qh6sER6ze9Is/Ku1tEsoJkC+lYfJ9JZEE80vzDF9KGs4aeHX+iK2wF6e9KeiWGfXj2v+j/us13XdPfxvIPLKEaWpIOVPcfvzNt81FVpkecuJ8+v/Fetc44iyZX2j/SokHaejpUoWsvg7+Qkka6CzKvrZd76LHHSVja4jWrWY0rYq+5Zi7+aK7UEpJRVImi9Dj/ZNjW+XRUVMxtsYOspJlLgqj27LP255mFcUOyqNI3ECHG+PunF+fPn3nZ6YHEMKIlUC5AXcm7d69GIcJJS+w1f5ohzz4sc5QU9A7KShDaOzYlRqzPutK1j9pDlId+bbNKfFpopoWt/3LYRS58VQ+svdYzuNd217MMEX/P1W/aWFn55c+56qyplNVe+vhxtY+fcUz9FuD/fC0kLdP9sPgRJXpj4j0uEXvJ8T9PytcLOL+brGiRn7tlU49Nv3pXGa/eX729cl/Rky1v23sWcREWrOcI++ZcXYAknXbYW9J+NXf9VMPTaZIfP9MIGmeVR6a8t99phC2/soUffF+KAr9m3a17RWbKJMQ7UqjdNz99urx4//P55cdOjzuFh5b2kB9n8KKBMN/VNQ9eFnYdH6xumpfwwn5cwWvmDymbFNlQJnN6eNkCC6uwsigdrjYXSmB1Y+S1a0wpfBIT+Rz/HVwWWyhnuIzBNQ9ZhU/gqsfMz+Ebm2MWwhcvKurBN7bhBXz8wwDBi0akAlgR9Xz4chVh0nIV2JYumSUerGnbSw4yWbMgbadHi3CFcnjcuICvGZmfwINmOfyYhmjaKF1Uljo8JdMdcO3cQveYp3F3ARdWuIQvXESTzeRsCFuhJbiWdHMMX80KC+XLToPY7KbAp22ZJ0dw0aqw0Xrf2hjYUFEvzeAHN3RD0Yoo6XGgWvG42T2AkSseipJI9rhmsvXSGD11m5dVNpQVrInJyc5gBaqtaxWcuygL3eEuUL9KKorxRIQeK2D+9Pw0EGYCJ2x3JEERfhzWwK5HLzOIm7tVifYVP4MoeIOXABU1cjI4Lj2ZJYlR4OGJkcmPoog0Z6PCxGe7iQVJP2FbOQlTpnEobArHYfqHfuTD4CQIUZJQBwiK4SrhEsQ4RBGF4tnJJEiJykoWrMiHiS2XQU2YGk0tyENBN65kS0J3RquN2pEMd7IcN15DJKM4U6kPnJiFJtXjKLGQPxNpEqJBECQDjoP8dpi7WKY5rEPRM08sDP2HRpD2vJRO0CNOcC6uh7ygp9oNr0Yw7xChQtj/8wLTswEK4aLwmv4/FvTV+2dsPwhJh6YFYHIejW1E1ycr5ErEWKiPu0ZgFndhOBplVv5iyWZ5FORa3BqNvvdPoXCENA4gnq1Mv2eTR6QWD7meYhIkl6ivkwDy9WcYUGqrgxNEJyUkVudH38usPI8CSKxHTb/XiYfEatLo+xzF9LCKWhjFtJJZgBgFqAfsGkG0ypnULH4UQmrOOwohuUs+CiMzq+wD0JNKKg0HbS+b76Uay/Z7Wv2VAtS1WCUIVmRidVElAK2LKt/TSqXyfa4YAVZBVAI0FUQlSF3KVULUpVwlBCuxggA5orcy6E10ep8lx37p/L3ClbBP6cNF9IwivcHe++9XDCgfhFrpPM8rBCH9KkoUA5ERT+mMDs1LBtQJM/MtJB80Q/4N1iNtHLXJB+h8jUoGGTo3kAvCTqbG1X13SpX82yw0mUjRC0TyIvQyhvzXVZaplGJGRetof+D5mv2uuVzb/cyWx+6P55dsTtr8VTQNmNig49x6DdNt5e7rv9K/eEWG/fAg7p6nqvV0kf6sH7IZ5tdrcB6ddUqWK67YAaOyyo0k4oNwhLMSWqFidOGzqDqG9B1ofB+S/iPxu8t7g1+Za3a3vQdHvSt/+IlT/1auq4AxpRWrDNGbIM3YrRgU6dkFnSq/1c2OiZH6uk/7Y10r9RJKRhiKmMa/LpMWhKFTYaipxdnnPUpKLwhvxwWi+aUer6S2IXdfX2Suc9g3NrwKYmhtfhdOdFfONKM0LJrGsQxnl/mMY8HTNOTsrg8u3CpUZW6b++sI17+VONyxpDEoleyP/c+6ikUY4DsU3dR/an/SVbuLr6ui/j37p67O1zt026QW+6dIp3smeHgnbXj3tfE/1To3Hl7Boi60I5x3r//YspPGSZjR7Txxc6Fjht74shIVulCDSN+DxLsQSpq+H8NrkikGuOjRAmhxQuc2RC+ef2tD9vn5Bbxs92toWVoVblFUiUe30sp0sahZqEfiLXQl2e4qqC9cHFPSHaSvrixNyCAPyUC0rl11AtSDgtikHZsI0/arEWc3YTOU0xu/0xuptuxIzUtVbPS/ktyt0hSXndGryBe4Xfj3ApzRR9QTX+LkkIyJQSUalCGAwlkXd27eNimFMAq2seSH2Uk8SISxdZLYboaxRJfuAA3NK4gdcZmZkor0UuUQmmA+FNyBL4S2r+K4RxDWNCkx6qYGSEpin1lSiTq7AZJKbsVrsjyppmucefQpznVykaNG/f6AiTHvQGBqLM0kpXrfQ/UMoBCu/C6E7M8lOhiTGR6ATnew0qFX0OHkdKWqspTp47mBa2+i8aUbhOiYpEUpX6ynSuLLigsh8SG+vPDi0M+la+dUIb64v3fYYVX6SpB0IzaTqX2RDTwRqUpIHF1bDmkQmhWivMrKwmHJqSkTYeEO7EJIln2O7HhzRUJyOLysoBm2/bvkLu2CSv00rG7gtgBrhm+ch5oENtQYOY2jZfJYLwd5pzSVH1tMVOtnJEY+9RyKiQvnHF5St+pwJDWUaLd5jQpMGjPymS85R+HK0AZZL+SgL9ATqB9jokcX9MI377wVWoGbKqhnuXYyVf9SXYId5+HUBJlzaUtqzUBqqibJNtpI6Vaohr+U5RIreVKHi9b0Qgi0JsHGSlrJxVNqIgmnR3O0eKowyuZpThLOy8jEsXncSEayd0nZXzlpf6OtEZqJdBdMOg3J9FnTYKlNZgH0NjKUnMxRRGkxs5iGEznpZGeHI7u8rw8Gy+y6rgqQdKbPw3rIl9sRGkn1l4U6FtlU4QlMWCSlRo5Y29jVv2we0DZUUWzoxEpTR4kwyupDGlk9uHQcaEoeaVfWrUeInvSgU1VYeug5Fm5Kev1LOnvQKt0jFcVuc11pUHqA9bqcXtCdPKKCsszt3Ba7fhS6KXO57pB/LiW9UKJdwNUXqQ8Uto5Os8zr/tZ5+IQXXl33NpWFpl095aStyvpK8CRonL5eAwi3zwR6zfOBWpLNPVmXvcG0eg9cVmZ1hUZSxCh4fWjK6bZLyKw7y0j66EF1h2TrVwoGzxXo5eGynmYDsSiYlgiWkAqCEhapXtu8JGhCN30lgvNshFGGi/XZIm2yPCyHsWKY5mIDt4vnikH07YobJP3oBZDxTybMa7IGtPOnHLivOxgVeSkb9g3opFK37046tIQ6VNChHIr040D9oRVPzzh2ZV4VpeNj2viYUdUHNOhTjqVheo2UjCI4SPa1bTtFseYpLod5UNeTZDMZpz1ExpYimrcs2t9pJqGEsBYx9VJIz3M5AfMwwoTb33n17/SIZYR1iOnBeFrADSpcKzF8UcNEwSQa7ElJEwHS8UOkhe74oQ3P5ukGESnLPLyuSBNfhF/1StxUZ92Flo4UQOxqN5sATKv+OsVCZFZCp1B0HU4bZqChz6G/dNCE127/WfhjlF6jyOlWXLQTYypkSpSWJ5zDcU3ktOliXBRGtWp8n15bJiPDeoOGN6s3BpzmHSLHOFqtYJPcxnpth0/mBH56i3OjAeaColGTP5PTzwy6ceXQf+nT9BLaFGYAZrbpy3psh9kxLNdUSDEig2ZYvTUeBmbHqFASOL+mSkOaoQbzsbDsHU8ytLJt/fWmpi5MZxIoCHLWviD/pNIK8OVUeZpX3/uygeKwXoZysmUPGtJqzS/qQ77q7ZKCKCypZuGSVJVjpU9cBe7Rb8/gOvGzVo986tA3PR22l+A2jkXIpCk5RrjpMGkR536+5H9E3nz9SqjDXgkVGh9+LGm6jpXfPg6sMGwbhawPmfnDV5IdegW1WLwQoarWeGeUbQVEejpY9anCFSdA4sB1qVALnuMmAqNBGpGqZNcL15XUcergpNFSa2a4CnrR6MPX6apVcoc6SkEHTTguHCy9bjsNXQ8u8H1Jrw8F6kkxVTIQKMo8TY5OfV5TYQI61WlaIrYC40Tp8UhKG8Vy+pdl5SSPGfk/9RjVwbQLRbcpSvKVlGytsNfUMxxJS5W1gIlCcyFFL/BDWQ+6wzU376sS/vUN6ezrZWGcHMNELxqrnudWQ9atFIrYFh2Jzoq7MAmd1aOwMuEruqT94GvmZi0yqFn6Imy3X3XrclFIP7xeSOq6bO1GhTi0VkjaHmhHV20cOQ5LPQBG6EEzudrFCq2whyMB1wuqPTQYK6gOk9rQ7fCGzltXvZesquTozjFJQMU53iRw5NW/95oJ5+qjDZJSwUNC5ovMqXIcFvTesfwO+pJmGd2uOsRelxlONrQE6E+OdtKMtlJ1BMYTRvWR+URnNOQ5Su+6cLW6FYvm2KVBA7agqKcVRdodGA2rHovWkSotJQ6Z/dIrWA59yYUdrlEdHEr5WOWG7E7FsluNdHioFLw5M9j+sj1L6FxjRAapTk4dipHCrByhfg9/NmJzzr+9vDmHlbz4HlwyKJBDN6DhVW9xHh4ebDE36qC6+mJLzYbWSFGomqTOLXuJBJSVSTqN2yJQYDVOkgmFqN/12FdGumTKfKStWX0l11wvv7j0CKDfOn4ykAxbza9B6jV7cd4hpLMxDdVu4bag58MK51CRnkC5qLc/rMEpFZr2h8Eopp6xO/WhNh0xguTkFxcasYsi1kFqpG4TUmLFo97FqJ+a8yL61hz5gfyHDQHd6+pwGFxlrH90hA6+dETXHOYr6dX3cFuP7vUftXTZ2M1jXPW/DRib56i6CzMR+WcULW7qaoqtkJWnMA/oc3ekRWzcvvVzs+bn5QGMvEQeLh3Hk9cokqULXEoad6S5X80tGSF61f/bJe+p8ipkMLP4ppy8Ct0RWps2Siv5KMZRZJ5V1CehqcQJkf+7eAqjk6XR0vRcQQnT+0HCVlNKq/b2ZqqyPDOR12DvLjkXZ0svQSgo0ZTxUPAr6WdbtwerD1uZSR/yNKbO1mDFqfc2pty4kgAXJ0MunNPHOW0YKIql4bum4P3zp78HUoTJKjKSoa43w8VHR+TFytwL8mvjury2Y6AgYtzHBifjRhf7wdLVFRUN84zG/q8ZujHOYuwvuXmTl0jKPM2Mq+najoS0yNG8Wz3dBEtbKvIa1Fs2RM2JYuNC33lBBumW46UdSAWF58YS9TC+mb6AjOAT0t0UKZ34GCd4EpJe4ebOVCYNjZM6W3w2UV5iaRFfQcEvzpfcPyipGJcbKvKdsUizdg2lA9JTd2IrR3TlxchU4PzyqXly156avObkmqkaGRlCxC4PSbUIzr81njfl5p04fawAQOPi+bcAKkuvaKtoPDev6QAD9II6nGaHkiGE2ES0qMLSfADK9NL0JgQhK0PaX5kqlacco2B591teKIwBVNbfxpWWgZiVUQ0yPTcujo2OcU7VOoX2IJm0oAArYVTFbM2iV2jn0PQ1Sg8ndL9Ae9AzV21m1Tf4gQQJ89XXKPTli4ckTR70x+kDYZo5ZZjUzvILkwaHI0qTIcCsSzaoXxxh0s3HYRkuP3moIrr6yLmakMl0ZyAk89yIll5S4vuygM3sqTh4pk8NgGY+Ucy1x1QDHbN1w4GQ6Vh/IFXgJu0gtMKvIOldlHm1+KCjihBUy7r6ttSiUHOo1F1+P0ocNAqPiWhfdk2g3u3yBCdExDJsu2vtFKGsRJwq96RzBS9HyusYfBWSMreoCBcfHBTLJV5caafr8hNg4qBrzw5JhvbucrTkjk9JQjf6Wp1XH3q4p6Abi6GIF8aZfl6OlQxrHPazTmPlJT5JHbMy3qyke1kaaccnilP1Jcw2cBzo7EENQpsU0jgrNEdZQwWtbYShQL7mXFhKgQxiFl+8EQpkKKCPVWkHvzGuEUTCJBuzG63jI13wdsil2c6MV0J1RQrUPtlW+38xETIFoR8ZZ2pOH7GNSu+Eo2z58r9Qhi1g1SlioMD2gyFQ6AlNk/Dk5/NL42a7V6InMnVV+nW4uqzcoCOO2EQrTyPv2Pulo80Ddcw7/NFHGbqmdxQfqDt46t9t+Ffyq4AM9L3mKmXzJ+aUq/5nEvo3oYdvPPZ5805O/ScKRfcnyjj68uTfaTCiFeEvT158efIDEf4V++WL9+/ZL7+5j6OkeNH89scvX748OZVl9sJ17+7uzuqDeGekiScp5n6sPzrDdKxLv/ymWU9gwcjEpP5lGLCfK/+stntW4LLKzjr/uFfsxzqtyoevxXOvyLPy7haRNIkwSs6Ovs+EsiAeKf/hy5f8y5fkm29+YPMQuuZYfJOhklYz9uHZ/6L/6zbf/eBO4voHljoNM0kNqvuP3/0HTbA4vcUB+dUBRQXuP3pzz+Y7BfnLv/17/+srdmS2++2jSN5XrBtuND6mRfknumz4X8kMnMz/lcCWE7jxckEaiZL50P5Pkr5fntAF8yNO3LMi8j3matQ983O/XfUk/3xEjXXlt+EfS/r/+5PfPbl6+/7ju7ev3n7+q3f1+ZfXbz94H1+/v3ry4skPfyQp8+XLN81O1I9fnpyfPf3yhPwGJ35KO1Dyq18+/+R8/+XJH4lZapcYbuySzxIU4x95yfCqzh1BKlBLRIyMjcqHK5/8l2i14k86e+Qj8n8/HNKIzFZ6o3UBmH238PVXP1r4tA1ARhKjz9sS9hVlDJS9UkGKH8n5OsvoL6n3YvYbVrLrzOHQuDXOAurIMh3r1Yd++nV9Q+tjA70nezv6c4fsduz0N5hIkfGo66T21QZL9oY+ve1HqmCNIHs0AtuKEs+VuB1L1JFd5+vFoW2rxRQcv6JmK0ZNNtHnR6wVucjLEZkSs3lxQe/6Jr69GCW38aXXjCNs2RguN9ixQN9xafoU+hqTvZyZvf69jSn6NLglS4PXKbco0ONqWr9eb7WuNsm4TT6xV9ftmRq/F2fPjl8VZRrPXqOzZGb8Lphto4OiiCwm4eTRV1uWrstm7ZS+Qu/5B9u1twxtxaR9wZ09LEDXT+3lzeClTXtGmvXPDSyAtXALM5YfmpMMH1F5Ij+Sakrtl1UQpi/a6ajbTsxmmvKBXTZd6wW6uW73m2/szV0/45hurWCrs9dmWWNx+jrNYTKsiUK/9vlAz6A0mdstTvRZO89vqVL06fMb71W71lyAy7PjwI26R+KBovRow8iwC/bpGj87KANtpb72f0JJEHVdk0UD8DEIJ42S15RHC3GZmSpzlBRs49Ke0dnz3PYSkk1p7CciNdOfmrVsbtDPhxjj759enD9/5mWnBzILjejypoU6xTVZr+h0D/uA2mR9YM52EKMAWLtdHagXpJpnOrx29chCmyE0CJ16jcH6GMuWUVyxaKFUto6C2te5Gm/EW5ixlH5saXu77FoyZ6k8okPv26l5SA1+MNPbGk5RjeyYDLi7seQuA+bmg/e4ROyhvUczaqZ1qF8J/H8xa9TOjhjlzOQQkOy2XHuGTbA3Nwn1mg3yV8MshLyq/WW9Q9eFRPAFkTc/fbq8eP/z+eVHaY0lHLbJo6jC70MeSJsXe/iQX17Ex/PLrGlgx8WS5E/vkbRORXeQJG4fM7dGc7m6/EZSjbdEOSmTFoC5wmrEq/u10pn7tm4fIHK3j8x3lxeH5+cXx/jZ9013o51gb1sH6UviANnca3vIjzN45E4WGDbwbbDWqsCoBy8Lu0EOKG6vDI+c5qUt5lYaFtqPKwu8jSowav6QskVtG8BDbXDs5q41PHMjDAxcdNM0UNxGFhaWrow2l+GBeQfKwMgxIuKFn4ck+2wU5rkB8Ajk+O92wBthWGBspZHDNho5XMY2UGtVWNRDVuGTBdhOFxb3mPm5jeFPpwuNG9po1VpZeFjPxji4F4YFDi9sFIVGFRg1QFZYG1lY2Ig04RZgW1l4WM+30YQNlIGRMRlFFdgGcq9sBZl6e7SH3arbQbdTRkbidsCL0iJ4LQ4NbmuGN1CGRq5QbiedW2FY4Liw0Z80qrComZ/YSNlWFhg2t7H006iCo9pp1HpheGD6LhaKLKXxUB0WPbcy+cxtTD7zNO5e6YXmHUgDQ5c2mrNGFRyVnRe0w9tJg0NbSmA7KUzSwRavZw05xzb6uaE0LHRhpVErbDRqtgaUloaTzbF9G0V4KA0MnSdHG8CNLCxsVdgZr3e6sLi3dtZ/bq2s/1BVL81srAENpWGh6f0lC8CtLDwsmcDYGLwPpSGg4+beAhjqUBDitM7sFBAQKFfY6mEd6c8lPpT5ZO62gh5f1jm7Fia+wpm12QWiMo1Dieax5qMua91RKNlM4dxlSYIQJQkuJCakY+vjkCYElcRe4dR2pbQTyEnxosAy3eckxbtQ+pZ735IqlvtQ+paLKJRZSR0b7gIZ2C1RWSmXrz6U2LJ8uzGtt0VuVG/r8iA8HNnEjBhzR6EM0vShoAf3C1Xbw3CmJUnVdBvIZn6WaRr5JxTKNOIARWIpgWovQdIp1FG3adWHl84kxZ7WpANbjzWZqh9DhRauj3xT82cyimOOpdwwBIIgOfq+l+W4uZ2gTzTXAS8nloZY12laRim9kqMzzBo7kNFtuccq4lraM7vjoO5cyWbjhrJQN8ojBxSKMQ7dWWjNrmPsBqMo0xwdDWmGKppUw+v7g8wUVs4J1rKMQWoxP+J+KtNWcFJpFBoiz7QoRqFBSk6G8kJmNXS14PQioKXZDGqgYkCVY/putdyJYg7OODhIi6bTVbx6f/X2SqeXeEXdg2qP//SuBk1ywY+LsH5UKYxkSiqLq0vBu+WXuYTR6KOWG7xrpwk0UDDiKb+2zzdpwYyDA6TMUWazYjFVjjr7EVMO6lTJj5/pYQwCG1HEWeWhPL79TgtjFPq3MiZtLvbrNDUDlzb6LQ7E3IvjW0eYf0283UHYdoLBlzOd/kzdMoIhtmKQgFLXLST5tC5ZiH0YgvG1YpCAya3MkrYkYCu21XIIxCLQzAlpcS6e6/DSo1kUWtADLvOQlL0cdMmHpBzogZd/KMZWbI8udaGK9K4zd1xrpZeWpNO4J2ZJ3IQ1ynP64KKTY2LKx3HvCEsdhidkRBaE6JikRalSCCdMYwkjGhxf49zJThJr4gswIwUjFuZEuzgrNEH64EYUOUqCNNZOjj642SyM+UhqXqrVZZmKPOY9i/nQP1RowFZSsnmuSnrAM0hDNt5hwd1eZQ+vKGQSSWbU8SVEegwaD900aXHcsdYeKaPSy60kysmghND/njYsG+M18kLikMYCeBPWrJ/tVikdhcXoBaAlMXBCh76PB0nZCkKRYpzlqX7OcpXM2KqylFmeXALqgputxMlcsV9qtHSu0c8OSsaXF14c+rnCFH/CMdEwHL1d3N87bFvACfBBYWlpCsURMiSr3dEPfKrrUI1FjIgMm3hj+6ytyKusLBxWBLRheEJGZBEOtGGasGYr27QuOLLn7xZApiIARNRlvH6VmmiY85iRGDO0VpzR2yLqNBwdiPmaLk4f3IyibTr1QYYKZutdEDMe831EOvl0Ro/TOFQaF865NptI1BaxfmstEoUmhgSF2HkYPORDO65jXh/EOaWpyk7YtIiKdR/lgiy7A7PvCdgJjM7aEgvYLoZz9B7zMpMoOTRKZJ0c82KpekFrg5I4euBj33I4QpEvhaNgbRmcaZk2WuOHUNh7WpCIvSIsKC11xVOlLTgJ2JGqIXA40c7y8Ja+GiVd7Xi8K6K/paZoXIo1U6RphmZaNmoEIGKvCFvAzBg5Yo+oMa+vge7bijdXUelWuHybUwca3HwaSpgW1EYuy1MfF4WH2Gsmhmxzsd9SuzJMYOnq0KRDe+dvLGEnj8zY5mKPqap2L2buXF07DoUa0YXpLwwOVYwLQ/+aKB1pMMc9IHAjOWBKUtqoCyc4zl4QmBQwt8d6xh31WFih+k8ReVK/qQa6r086idBdCB+qAOaOAdRU5hE1yaO3wPdtlWsUuvIrXU1H9G1NHemYNiMjCyBggPPzTnCwVgmEOFa0AOqxx9NUTv/JAg+Vf0vtXx0VlIXyLc04SZoWcKQDW/4hwABn4yPB6ZOKkLA8bRuVFwgZduuCV8WgSilX1QZwvdfkKWy5SVMPpS2iK+y9qaKb78AJWmJ48oHyb+UaH46D/FbnEp+026+F8MadE5a74c8iOHSThJXv9tsf8Ca3CueH4ZOSmqdjU3pIXzZFaRiWntPARlWWimkRgFiWbxp4aaBR+5dJpGbdPAqI43CtkHeIUCHhbnKBow9uTkOv0+qBtCF/M7cghxWqfRw+CpMbmaneIAHoXGRdCrKMaJGNggOVES2QNuRWZSQKr83KCBFg4K/eP2NuFJBCrElYlxP+tzNikUs9SHejOPb8UyhxLYHBNeejuyCaTmmogsx1+rFNtUvzXJPMfwqSGgmMLQ8CavtJDD31eI9D6cdd1sHpKN7G/k2JxrWMq8+R1WtZN5+L+Sx5pHucx6YeVYlGjuJDlUiNsQaWB6H0TUs78hmZ1nDew0vuXGqyMkrs3MSnVaOgMqadGNeaz84hJB9BHptXfuB4ybBmYzYNq48h5RJlZFzR8cncpNwDoiObqo+Dzo1KvS02sqn4bhjXpF72jgPqA0i9+zWyrPimF6f5VC5Oiu9FcUxKPQM0tqn4xM/caH10RNFsH8jUsGazOQ+sDyK5wTuyr76bOzMr+UbKyKzy+ydzs3InvEdW5Q9x7+LrvBmRSkxIaZxqdx1tCMOBhqLNJohxH69otgtk1rmqWcWmCcx6SjWbbRCzzlXNZhPCrG9TM9mEMOvb1Ezmprkpd6RtbFPx2Npi36Zmtg9k2qWo2VU+VLbUpaiZ7cIYdilqVuWvSVlzq+kT1vJBZ4GrfvIkSxOcGDjWpL77r3FQRoVXVFmW5vJaC4q1kwAQf0FR2MEh38cRrq8Wyuzl1unqDhPJncfVrWHdNUtqK9XCiKRxEmb0hrHMg8cm8ZgYAopGVqAN8oJnZQ+fRuq7OwsJ10ZW5qiZZHK176D0wgBZ3KyEIJk3H5RIx8IApK0R35fyEKeAOlHeo9yp7/GLyh1cNW1ffOmFAXKTlAsPyRxHUMIcqELUDT+2wDhQhWCMkW8DciAL0ZGc0LkFyqEsDOXF82/tcA6EYUifn1/YIR0IA5AerdShI2gdojdiyfjjFkWVnNMhtYZzrG21dzE+3FLTBnl4q3AzY0EMrE8LB1DeAaOyyo3yqVfrLxvzDQCOoRt1eVdbWvC6TrgW0QvcbpB6Ac5wEuDEl3oJSiUCK0bghrj1Ad/YbBo2gedKA6V8o13mKCkylBNxj26R09kRcPKLLNmLkLSbN6PI6DqCe1wzylE9l731L063zo/HXNxa62cLvJe33PqBRmDFiJXWDwyeK22vsWgzOcxOctci5bNAxpr1iJ2kDtrCROukdSpXI1JkHrlVnBpT1qOEMAq2ilNr63HMGixtiuSIJJ/OjkiOwshTOWxtes2JW1oohXgMwyLptsTtjaU2rKEbViIaHyRO0yxDtOHNQeoDs/U7qx69jCUxwFvh4suZY0oOPVfIYPwLMyn5Se0Kj87E1XTBIMvTMvVT1Ycg5k9gR6qPiy4nJtFSTsc2Hi4J7A5VdtkMwBh///Ti/PkzsDTpJfWTptdwOZp7JNRdfF3Jv3guSiOmpp88LLg7VtojUb7eoVu4ysTU9BOFBXfHSrvMwsMA36HoBixdWkH9pGkV3Jne4xjsLaQkvfVk2trjQ355oZkVPKn74/m9ltxy/tJoekWG/fAgc0p42i2T0C5DcztAl6+rNV3RqhPblhNUlekRqw+t51cpWbrlOMKoAGnXWsk2Zy7pFcnWgPiq5SSrm3i6E1BXaOVR1/Isqo6hceaxBKjK0VgB6JgDT9orSuTfePhWao1/2i6zGLs8XVfSHsxWJNdSdnrwClJ2/G0iNja3R4edIcdPk2ZdVHeMZ7+vGCVghjy/ym81pnFNHo0jPeg6ls1s1n1wo09ReuC6rRMvjUlFfkkaoJJ1CQgOPFEFYp0lA0zxWpIGTOF6jQScmidtoVzAAmuzwjSog/Zj5P2dbvaB98lzE7qVbE3TlbAJ3SdzrBh3yBox278QlSF8qSlDgGJShi5PFbwglBLeCLVgd8/bAv+9womvfAJMnGidsnk+d1LusoV9kxHRbbxQxvueWiI2uuZJ2Ai5S+rQVaaVNq42q+A7VR8/xfdhUdKyBzNb0dxaWdUcTPEqvWNJK3k9SAGn2RfQLKIDJd72A2F3+cZ0SqxajDTLrl6MNIe1BsXaPCjIDrtcnkBkRrOBOlH9zS/K6ntEiJGKRwRe5xdXqgssC50GEfJyTH8pm9ME3m2DunwZU5fDraQpktVd+hF0mARhjv3SISOjSikp5yE1b2tHdAbj0ANaCtZHgUwNO5LvpnHMO8oPpE1vLhIN/xRGEk999+ZHgUwMkwYOJeqm+2AGxg9EXPrR6jHAJKgBhJ59ENMZ8m+wbgrMApuAnB6UzddBDIwqHbFqzSqfqpoarqIyVG1qRoEMYlzrJLi8S3PpowFtzGeBdZ1s+kjiglFvu/1e01yVZept+yiQfW8c63+cjmLodHJ1BDN/0egU5oGXoVzPs0dzcVB/3MU2m3MZ2ysZueYDgCaJO4hle2febSy7Wvf85/et9QH0Lu9PANavFogZNC8LcDG8uxxlpiydiBlQmhQlXV+hzoIMkKYyRlDlKSc949rzU0KgkYQRTNvE6bMMFUBQ2KqYOU8nYwZVIFOegYIRCorCY7J6DVTc2A0ljGCuEzIXXL49ICTpw5thoAJ/+8wLkxLnycrTFGKeuZAZGEnoSuBeWQw1FoEAitPlGZUsT6MBhOPl6A4CqdUBxCLF4RYV4co5YkW+kSBYV6sNNxEx7GpX/QNI9LF6DgDWenwvjDODNoGvBYln3Gwt6xlhYj/rxFa9oAgBeUoAaKbVcqpihpSUeZo9eFkaGWTlVMUIKYrTcnkFQ8jSBTeCiAN6Z1Sfog9vimHWTA4EzECyQuRGRcwy0jDGYbcTzWg6CWOYfH21UYomh3lylEqVOVrZqpOi6STM5iAoWH1mTDwF6QXMQG4AuqyJiCmQWdUeCBiC3OVhaVBaBgIg81WIjOJJmV0Zps5So9I74SjDK09UCNE4Qmbbo0Xksc0yczSulDGcH4VGE/+xhjFOHK48qiIF0yoYoxDh80uAESFfCwjvBj8YFqmxjnET0b4jVBcJo7WtmdRWV/jDxI+qQPXQmvEexkrKopVdw8W0bKLR/YzA/MehPNQYfc94GhUIoCJZflNcHqhRAQLS7Lh5VJpdOBetXpA05+p1IKDYahYAVKcDAVWFUUBa7cPy22LyYCMtCC9m5D9RBFEPh0owPqIBmHyoTPRPiPzfxVMApoESGFiWRsvnUBTRWi0QOOzfePVzBBB4YzUIwHpj2Ryt0wFyPQ6ApHjqZg2IPfnnXJwtH86UxxppgcDR8uCh4NeqKL0IH5H/IHo8U4F2VdwW/iFPY721SakIDOXBo0DH3MxAbQw6Chx5K1EoKjo5xqXFaHBMgEeFzM2g0RtJcNT7509/D83aasLBQtZK0Co4OAEEwTeWg0Ascy/IryHGAQMlALD1A+zSVMqH2VeRACbqWh4d+TgngLF4IwKAg/3gZM7TqsAAQbQKnQwI0q8ZugFoCgZCIFgamyFzJI0NET5OvacNgNQLQWDp7XrOoPR2PrlIR4jp+BFsOn66CQ7mPK0KBBB91wmmextJAaBFMUBn0ogA4LSP+UCtCsz1ICA1TiHOwDROIS7APIegeQ6Fg+M0f/Cuq8OBOlKPohRgtWJBFAA3IROsIqU3vgCqwUQMAi8k05QbjROmM7ReCAArDQFqQCMC4UEKA3Q/jQgEjsZhlxmNxnmXBRi/OF92qqUA1OoAQQG0Wp0MENJ3MEjfQSG1d1PMqQZKgGBA6wkzOUhEdnkFDrGVg0BMo4fzy6cQ9WCgBAGWh7eoxOxl6AKgW5zrQUC2F5PM8QZKAGB5SHqS4PxbgM3AkRQEGsQ6RA62CkHfkTXnaVVggC6efwuC1OjAQF2CIF3CAT2HGFH0OhBQEDsZcHsX7MQi8k8AveNICgqNbUgXVVhCLCXzFKFA0/QmhErETgsIrgzpVA8GrtcCgOsvWBuzjaQg0MIYhqvTAYBqnAabUw2EALBgtjwBNzmplOfnAC3tUAkODKAuDpXAwAqA5fqhkuIBapiXAQoEccjY9OgNwXBhT9jUB8CbEwH0WREPJ+g6wgYrXD3kki44eHNm4AY/EKYwF7yzpxGDRQO2olI8JGnyYLI7sRiJofQjOcJLWeGP79aRp7plmNTvoRZmY75BmvJl4bGznPT1Zbj2wIcO9lgWHpvWFNKC0qUPo7EFB30uDYdfn8AEwe2lIPHM9gVHeJBHhWvN8YvoEJQzRQuwSYnvywK6fViXtxcNCxVPbMJedICbv3V5uGgQ8dxgtXFA3CnBwZme2h3QwZ7OrTXNN34GgMB7P41qgZuSBMI4UgOEDL8C1ZpOCRCuzKuVd+WU6DopODy4CYSFmcItiiogul7K6qwa0oW8zCfzl3ijkLT5XoSuZS4L88KTkMyZm76/1OYYT/OkkrG3+rg+CLR6/3sYb3cQCXfM4o7kzO7Nd0qrxVMdTKGIml5Obw5agWRU3UG2brVrZc2kGWO5S8pmPvSYjMBpvxLmVBECr9YWu9NUZBzLblXa2EuuHksfs6LGhIyyboDiTtTAU2Nb79pS7xrNX7UPj9dYJlfmD1Fn8u+VzwIfcvJf6o/d1D2GwTM4k7JVp4RHouV1dO2sfPG9pfbJoTqwSwK7XeD2DRyBMMCgiWuhfkTZv7YAP5S2hh9hvOym24C91bUFLlgaMi4yMONsrgXBC9/a5JAvefOThgygrtGKDzqDVB9Iw+Hj5IQSHwdenpL+asXXugo4T3SPncQC57ehj51Dlfh0+QzopcZG1mtlNdNsSucuSEOcIeEo65VQKei9No7Z628wjzP6aUW9+em5u+LmQavopCXSLDHd83a1kjuV1Ckp66zFyqxXk7XQmfnKsGqPMBZR9QcWq6SaVW8JU7dDEKRmtPL8sWZyRhpvH8vWKGDWRlKr7QV8XLN5LMopSoxz0pPCNUdTZbO6M1Wb/QK0Ik3FndsLy/iNBXsxMG5oxVGAbnhnBkwbYHEUgBvkWSE1akTEdQCy8ZuljdCRMVAe6Hs5/gLePNKX7ZwgLDJU+ie4tnEka1amR1LuTBisOIyVjYrAGvIjyPMqC1CJndJ3ojC5cW6w6qt4K6k41zbL/bke51eg5WAub9wsS0UCumnmJJNRoZbLiS2LN9ASR3hMUFnl2Amwnyp7eeamPZ3St7JeLau7xDGhcxekgZY4psqaSxwy0DstcRTYJ9GReoRUmGLo4CQGWduQuAMZCE/TB6dVdoz2PIZ8HEUY1DKvitLxMR0SAXBO5cCOsZDRG2nqTAmnWrDZrb0gOc9n0CNATXwN6aZaEC1eX6pXTypLEnLkICEJBf2LQ/pc3cWaOepUdI8mmW7zAzXHRg0eO24wEgGqn9orEy2RwcIDFwcmncZCMHD1/qIZV6cBgVSWeXhdkVEuPVZqBDZTgsUr0xwdoQh7MVDIkl6qg0HspCC6KfaijIOy0IRtrALinq0oDLN0IAEBVEVl6DTrWUZYUyEQTzgpdVnj+BEZAtLzceaptyIJCHyM0msUQfLOFUHGIfW+dRAWfnqLc8PZRX22b0UTxoEBdpi7IAPGkQgAlCkPIMpXPzJOnqGGlVJmOHpaFIRwpVvXs+5ckQEmRwoOMC1PpPUCxJwLQo7+9OY249EfzNyLyMUo1D3p0xK1EkArJukNNiXqNKwMQU3YeGIWhqAgiJ0U7BDUgG2sAoFlcgK2RgK9DG2yTtPgAC7NTBttAy6OlLX23xxzLgjjytKs8e8EbIxDTMC4YqDjWwO4kQjU+NaABxCFjk3ZYy6OcdniSO2xVKr3Ei03cdDyswvr6dFezEVQLy7QAcnqDWZZHgfy+jJd4DQa0Ay4YAcz9Ya8w3x0JLS/j4nhMDmaJuCq7h6lnQxnQHbju30Z7RO5JKQ7lQHIyTSjp/0NucYij+Nm/EKGauz0WN3A77IUBUHOVvqY81aVCXLTwU/31WaCgDuBSmWFz7dXja7BHN07o9xkaTQDzMZYGouSdQc/IXOXZMFujrXSzRP34MgDXYjuMA7rg6tOhtQmhHzWmR54umrMXRVKgg3iNsegkQe6u3TjYBe7tatKc7sStkroFrAGBrQgaRedScrA0FAfVg5KAufXVHH1dMg0U9mn8BpcY4S4vtakiPGVtR2dIC0kLfM9oO94QnMgyG+Bu4Fb42XFSVLnFlWR/FkUFpt+pCWja+RdZsEAMK8tTPXLNpLpq3+5RhKc5Z5TVFmWrjgx16SfiRtFwb++IeOV+twkTsjcnm6rVPKXGSbQK3LQmOffXt6cQ8OORaGRL763gDwWhUYOCuTc4jw8PEBzc5RtwNNLBTbQR7oWU91KmVnU38pHmL5HqPGMExcOVrh6VafMYIbZhzfKwnrZXyOTepSxBAANvi9xEuAAAmumBdFt1g7ZovRIezUq7Byx/KrMFFQkauYEsszT5OjkZKaRxkqHQKeYXKWtal3rO9h0fTUO/TwF2WBS2NGpU7KNgssYXPSYfL0upJbehpzkUF4t9dptnBU1KwNitb07KVbdjTzTBfMxnMFi+bwni+PlF0fWMQahzVIjrXIfO9SjmPyW5iRFJhJGPDi+Niw9EwWz0h1FZiV5GB4qXXRnyZwEgpsYM1ETIKAUYqMXo4TpFMxo8jylWvLnKSYsw/DmJCYU5isOpzBafoxrnaALC1A2UMQKe4lJj7Ls3FumjMyUIEpuRU8RPPgKB1G5xXckY8TVXhXRwxmENqMYXQvSZJlqABBlJ90hxCi8EUnrRYiOj9cfy1kn4uoYzp+IvrP6pJpgVDESMGIZ3f/Xo5lKQIyZm31YZshspDxVMqLL0Z1jVvMnCkY01w9lfRA1LEPtYdhcBKC9HkzoTdrrsYwRl+p27xhH/zzApHVEvhOhB+2qNgpvVnbStIxSpDv0GAYHXu7VHQxxhcBX5o4KV4m47RFPzaxMHY6keOoWqC6wEcMxM5oKDoMbz0n1G51BaLO6FSb0UXHFm1OTCjbVMBtxRF5txWuOWa4/6CoYfSyKATGW0S17sMSYbygExBY8kF+FPnuQICzoe+gqTjyXQBdVt1oLr295GT5Qw/rsWqnKkZKb+jph6rDughDAuGSk6SCfXv4HYxzomXWJanf2Rli6t/WmswJ63VVr9N1wTAQAYNSnlCMUiBklL88DfKAnUFR7vpVSNFTcqvof5Z8z4qYM6cA19lWPmTsIaDwAYfmsVXlqkKnAdm2vwrODKwVztJCjkx/1I2ErWhArQ0jr/En9eOBMAQhI8QoEF0n3voM4K5WbFn4uQi3tkbgaVLVJqunWuXVAI6Ytq36NYXjqJyuoI+HCOVRk/qJRt7qj0zwds+lYkDr5xYUB1FTBcBQftgNuous1Tqo88pH64mf7g0gSbAO6ngk6tQdpTdg1uc2KfKR+oXE2x6fFQXXgTsK5o7Dmu9/6zWALs9eYo3klzfTok1b7xU3P9v025xojkhxOjv9e4aLUaTqauLW/FCk/6tNSMfLNagtdMabLMw6O2NO3pIfLC/Y0i3rCEi1XqAfQg6vvQDOyYdit6hFrTIzf+l5bBfJ02joWRrS+5MG0hL2V/OLSI/K+11zHAEFfFrU3FjACl9IFSvFDjo60FrKVA5DkXlAEr0/6l+CuqzAK9C/BHX31FnU+YS/xvRM/g3n3sdkYIvnjRJj5PlG55SdhICdtNSqwR9vpCDfTQQMD3EIZhdfciJwhyfLI8tUl2eN26etyFV1ufNw1AJ0buorlFDboQhkZjuB/wyVkdCoWoHwM9YSlY2r8t1M2dryQvPrJwh+Xfj0doIb8lTeS/79iv3TbD6b5NFsG4b+Y3so0fxeo4EN+eeFNteg3L9zXvVj58LV47kSpf+PQMYn7Ok1z5x398fNfn758eu7cheWJ/PtvV5dkiuf87eK9cwjz+A7l2O3+Qf/83B1ZFNBRgxvBtV4OBhYFcEno34QevvFYmALnIYq2A12yLoC+QUcckWFxUuZp5B2nL9ZYRebblikChCao/NJrDglsXBw41mWgfZSha3rM7IEq0A825uYDCNBzjIIYn53KOFppXEZfzRSb/f6PqDwtKkgGs9gS7UrQerxRSjs2SmhvwL1m5zzdK5LBpEq9Q2RW8+anT5cX738+v/zovm1vnekbaIoS+d5EpT04R0ZfICqkXwtNlF69v3p75b6iOyAAadT4bXXrQ7demISlaYLhOMhvgRIfx2QYaCrSxjHCR+Q/eCcUwSt6d0F6NJdtfdjRXqZxUUl/iK9xUEZFu6Litod/NjNF2g5c4HITi3qJWDv6PYV54GUoJ2Ya2fbsFqRkc7jYvJIkt/ElVFnM0juce83tUmslMSuQF+ThrbmJHJHfkf8NI4/WcfP+ZCLYzUavI6MWckk2xBh///Ti/PkzG+p38XVV2BD+eoduIdPDP4VZPSWq//f+eH5vg7sIA3yHohtI7frVX/YzreuenSytrWSIbhqSekPX8kFzlqdvJy+m6TVqctjYwaq1UmfcVDuHrceYXkQHmeQH8h+vPkOC4zR/aKMAMNgs0zTyTyg0Hvm0zXrxUJQ4BlOLMM6oO3yAHqJWZPvhpt3OugNo7Z5BwgMHOG37EMKhSny6IwNuoKkXvdNGO/r9SUKMc3bwwI6dwkcJfTUiQ6XP2QbWzGT9Qd+6Myr44jJ7mh24ATUnhkpEsMygZ5+BpPRjOE50epyBJXxcAfS47AwJbE8HlmKgYnoR5dUoHF98+9RWG1WfuXNK34nC5IaeuQS3BNdgzV92sdDHgbaGXP/ekNrW+kr2egckJ9BIZ/YqAkeT1L08fY0PdNhOxyndAvo/v/z5zTvv1Yc/f/704Z139Zn8ePEzW0q/RVFFvzhXl/v46cNPb9+9GcmM/uKxJW3v6tPHz3/5l5f/rG7h05v/75e3n954b/7147u3r95+5prUIG91az4g0c9v3r15/+bzp796H/787q/6av2C+XeXFz89P7/4+f2z71UErt55Lz9+pNH6+ObT57dvrhQDv/rw/uOHP7/582fv1cvPL999+JlIvbkiP6vovPrw6fObf31/qRPGe/PT+8sL7/3bV58+aIYnSagS8uM//dX79PLtO6Uw715+/unDp/feP715+frNp1GG//e/V2n5f9ohgHPCdJfg7FT/WjE73r35+eWrv3r/9PKd9+bPL/9EqtVfXn5+9U+vPxhU4Pd/evP687sr2iL89PZnb1b8/3tU/p/BMm57NPoPOjY+Xr30Xn3668fPH7xX794qFiOeyAozXcqs3Q/oMZPkpsXAe/f2T977X959fksq0ecPr2ib+cvHj6R4jSzyBidC6V8+k//5+LKNBq/w1Ik/WCVBerF59cvV5w/vvc8f/vnNn5dLKTE1mvB76ND8Qr/Y/nL1xvvzv6jV/l9eeX/65e2714qJ+re3P//pzRtSS17+RDu2V0rdzBtSvj7VOe39+c3nv3z49M9E5NPbjx/faHLQluSK9ASvPtc03IKjVFd77VqQNs/v3r7886s3pB/7l7dXbz/8eSR+odTy1cXwl08vPxOd5UKy8ibpYulotlR+qrfy5TZO6CSX/D/6b+/V+2fe0fd5x8PktScTaFSV6RE3D4eQ3zXn1Lqf2zXWS2q5/asEwfBcq9yn0h/Gsh8mafHAGw8L02rHM6CQcKAHEH+gq74fsqay0B/eBj/Sa/Dtb88q/6xbGWY1pn7Rbu2zMz+rRpVrcIh5G4DDBOCQ3T5zCt7iix3zUYpKD12HI4giPZQHXQa6lUkKT76O0H51luV43fkxM/ouLMrOcIcZsUahV+DdcfnB7Q3rRAcVBY6vhfHpPnv0EaLLK6LY1N80/7ny8zArRwXkv3XnR7vmm37JTo/RawhbFJx28d8j8++y3u8bEJZ5xVvoscARoBKBMyhkUoISMrimneleKZDGYemxwYiXpcw/8E4gJCHwvY+zPYsDYcjLMtyhIJB6iHNU4vcoY733PvH3PTK2SAKUB+OO9fe/38j+/f0Cwf/+3+e8cb4FhjuUJ+zBYxRFO2VDh4DvyxztDZHhACVl6I+HOigqtgZBOfaYi+piLxT6RRx+RfW+9bDzD7/KI8ToBrPeFuXxGZ2TlSg/4nLKsPDZbNjrxOQ3P6oPfg0xylMVX09Amt9tAzAdfTsx+c2PzRjcCc6/3QyEOw4nOPT3Dvn9j4pj8pmhvoEUMvWfLrXmZP4Y/KjSpK/YyDIFIHrnZqmBr6GUWnlgLF7f7xyS1Kl/uxvUwqCIoQ3/tm3Zahtlb9pLOn9hv9k+uewTaaXPvAt3/tL8bsc0skqlkk6LParzAaRMq6aQbR6VtFmenDoH+jen/9v2CbUpnEqqrS8tOIf277um3i6QSvVyfVnAOdAP6sMoTvfBDtV1H0yVlHx8S4qA6f8biNziGvDyl7+FaPHXlhY+W14MNlsDNqRiq5+ztU+HTN+wX/xI/3rG/rkVT7sI59U/ezHKxmT/2uh9+cZ5j7If/9v/+PDL54+/fPZev/30P93/9j8+fvrwf9+8+vznl+/f/M8zFliSu96jOwtJaWkW56fIzfXTNBuPStgOa3w8v8y+u7w4PD+/OMbc401myRUWSw6GluuB85fod45z9Fd6MDkJMs2hw1Ynv7snWsyTE69AwLWCMNGXKMTi+JO4V0lV4ID6pCN9GLf7kpJhPtKSo3MIcRQ47OACisKv3DOfSoLXOfKxjgjvwoR+Jp7SovyvXATPRfUcIel/Vh+rZ81ZEV5e1PkSlGf1maiAnTpg+9hnx6Q6GwwprlGBpxk3EJx8XX90RnP2LC1POI9IPP8rj8Fr6qKzvJUwh+ZFMCfCybE8/cg73bdF2aLraCqla/j9f5Wv/8fKl8LcQas3uSc/dJK1Exk249qn1W0GvYJaoSrnh7lfRSgPcIaTACf+g/7+5eOJVUKGF8FspqK286jXevGH5CZav5Es6r9tG+IoOETouOSbeK95hFFWSHZJw1TYKQ1+aL1jdb/55oc/3scRtVH7VCBWzs+estiQMpVSR2rkV798/skhM9I/9kLtDLc7alv5Z3EaVKTdLXBZZWev2C2vj/VnH0nN+xNLv9q5HPPN5RV5Vt7dohvPjzBKzthJYSJIpDOclw9XPvkvUe4m09MYZkSV5cpVibM/kLiNft4hzqCxde3zNk86XeGyZGczHjlu5TcJDFqKpj5nm8W0pco5/fysiNgWvcDx7cR935mf++0NFvJPRkyLLsmHrvEmv2rXsoLFFr2t7HKeTud14cnvnly9fV/fJfyrd/X5l9dvPwzuyT158eQ/Wm+UvOT+8uTFF/LFly9PCnSLScVL/Zt/QXlIH/Eo6K9f0P+hH9D/j7SKWUi+Cm7epX69O9f84UX7jyP2b1KvCG68Z2fPz87bX/+u/Qd1UfUhm4fjr6E1f/xH/T9E5cnrusj/trj/QXKpRqDHCguSKf/270/+8f8D2UZs7g===END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA