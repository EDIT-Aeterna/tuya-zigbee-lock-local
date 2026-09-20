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