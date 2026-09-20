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
 '-DKAGEL_EM2_DEEPSLEEP=0' \
 '-DKAGEL_PROFILE=KAGEL_PROFILE_TYZS3_HARDENED' \
 '-DKAGEL_REQUIRE_EXPLICIT_PROFILE=1' \
 '-DKAGEL_REQUIRE_TYZS3_PROFILE=1' \
 '-DKAGEL_TELEMETRY_ONLY=1' \
 '-DLOCK_PROFILE_UJCJK46O=1' \
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