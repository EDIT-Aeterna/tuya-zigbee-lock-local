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
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA