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
 '-DKAGEL_EM2_DEEPSLEEP=0' \
 '-DKAGEL_PROFILE=KAGEL_PROFILE_TYZS3_HARDENED' \
 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1' \
 '-DKAGEL_REQUIRE_TYZS3_PROFILE=1' \
 '-DKAGEL_TELEMETRY_ONLY=1' \
 '-DLOCK_PROFILE_UJCJK46O=1' \
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
 '-DKAGEL_EM2_DEEPSLEEP=0' \
 '-DKAGEL_PROFILE=KAGEL_PROFILE_TYZS3_HARDENED' \
 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1' \
 '-DKAGEL_REQUIRE_TYZS3_PROFILE=1' \
 '-DKAGEL_TELEMETRY_ONLY=1' \
 '-DLOCK_PROFILE_UJCJK46O=1' \
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
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA