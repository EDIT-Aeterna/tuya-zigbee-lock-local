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
 '-DKAGEL_PROFILE=KAGEL_PROFILE_TYZS3_HARDENED' \
 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1' \
 '-DKAGEL_REQUIRE_TYZS3_PROFILE=1' \
 '-DKAGEL_TELEMETRY_ONLY=1' \
 '-DLOCK_PROFILE_UJCJK46O=1' \
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
 '-DKAGEL_PROFILE=KAGEL_PROFILE_TYZS3_HARDENED' \
 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1' \
 '-DKAGEL_REQUIRE_TYZS3_PROFILE=1' \
 '-DKAGEL_TELEMETRY_ONLY=1' \
 '-DLOCK_PROFILE_UJCJK46O=1' \
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

$(OUTPUT_DIR)/project/_/_/firmware/TYZS3/efr32_app.o: ../../firmware/TYZS3/efr32_app.c
	@$(POSIX_TOOL_PATH)echo 'Building ../../firmware/TYZS3/efr32_app.c'
	@$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ ../../firmware/TYZS3/efr32_app.c
CDEPS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS3/efr32_app.d
OBJS += $(OUTPUT_DIR)/project/_/_/firmware/TYZS3/efr32_app.o

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