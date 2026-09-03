set(CMAKE_SYSTEM_NAME                   Generic)
set(CMAKE_SYSTEM_PROCESSOR              arm)
                                        
set(CMAKE_C_COMPILER_FORCED             TRUE)
set(CMAKE_CXX_COMPILER_FORCED           TRUE)
set(CMAKE_C_COMPILER_ID                 GNU)
set(CMAKE_CXX_COMPILER_ID               GNU)

# Some default GCC settings
# arm-none-eabi- must be part of path environment
set(TOOLCHAIN_PREFIX                    "arm-none-eabi-")

find_program(CMAKE_C_COMPILER           ${TOOLCHAIN_PREFIX}gcc)
find_program(CMAKE_CXX_COMPILER         ${TOOLCHAIN_PREFIX}g++)
find_program(CMAKE_ASM_COMPILER         ${TOOLCHAIN_PREFIX}gcc)

get_filename_component(TOOLCHAIN_BIN_DIR "${CMAKE_C_COMPILER}" DIRECTORY)

set(CMAKE_LINKER  "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}g++"  CACHE FILEPATH "Linker tool")
set(CMAKE_OBJCOPY "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}objcopy" CACHE FILEPATH "Object copy tool")
set(CMAKE_SIZE    "${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN_PREFIX}size" CACHE FILEPATH "Size tool")
                                        
set(CMAKE_EXECUTABLE_SUFFIX_ASM         ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_C           ".elf")
set(CMAKE_EXECUTABLE_SUFFIX_CXX         ".elf")
                                        
set(CMAKE_TRY_COMPILE_TARGET_TYPE       STATIC_LIBRARY)

# Define constant values for project types, CPU architectures, FPU types, runtime libraries, and allowed values for target MCU and build types
set(PROJECT_TYPE_EXECUTABLE             "exe")
set(PROJECT_TYPE_STATIC_LIBRARY         "static-lib")
