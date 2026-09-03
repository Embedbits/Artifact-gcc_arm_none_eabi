set(GCC-ARM-NONE-EABI_CURRENT_LIST_DIR ${CMAKE_CURRENT_LIST_DIR})
#------------------------------------------------------------------------------#
# Returns artifact version.
#
# The name of function must consist of folder name (doxygen) and postfix 
# (_GetArtifactVersion). Otherwise the buildprocess will fail.  
#
# ARTIFACT_VERSION [out]: Version of artifact in format X.Y.Z
#------------------------------------------------------------------------------#
function(gcc-arm-none-eabi_GetArtifactVersion RET_VERSION)

    execute_process(COMMAND arm-none-eabi-gcc --version
                    OUTPUT_VARIABLE ARTIFACT_VERSION
                    OUTPUT_STRIP_TRAILING_WHITESPACE)
    
    string(REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" VERSION "${ARTIFACT_VERSION}")
                    
    set(${RET_VERSION} "${VERSION}" PARENT_SCOPE)

endfunction()


#------------------------------------------------------------------------------#
# Initialize artifact for build.
#
# The name of function must consist of folder name (gcc-arm-none-eabi) and postfix 
# (_ArtifactInstall). Otherwise the buildprocess will fail.  
#
# ARTIFACT_VERSION [out]: Version of artifact in format X.Y.Z
#------------------------------------------------------------------------------#
function(gcc-arm-none-eabi_ArtifactInit)

    if(${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows")
    
        file(GLOB_RECURSE ALL_CONFIG_FILES "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}/*arm-none-eabi-gcc.*")
    
        foreach(FILE_PATH IN LISTS ALL_CONFIG_FILES)
            if(FILE_PATH MATCHES "arm-none-eabi-gcc.exe")
                get_filename_component(CONFIG_DIR ${FILE_PATH} DIRECTORY)
                break()
            endif()
        endforeach()
    
        if(CONFIG_DIR)
    
            message(STATUS "File arm-none-eabi-gcc.exe found in: ${CONFIG_DIR}")
            
            set(ENV{PATH} "${CONFIG_DIR};$ENV{PATH}")
            
            set(ENV{PATH} "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}/;$ENV{PATH}")
            
                        if(EXISTS "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}/gcc-arm-none-eabi.cmake")
            
                set(CMAKE_TOOLCHAIN_FILE "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}/gcc-arm-none-eabi.cmake" CACHE FILEPATH "Toolchain file")
                
            else()
            
                message(WARNING "Toolchain file was not found.")
                
            endif()
            
        else()
            
            message(FATAL_ERROR "File arm-none-eabi-gcc.exe not found.")
            
        endif()
        
    else()
    
        file(GLOB_RECURSE ALL_CONFIG_FILES "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}/*arm-none-eabi-gcc")
    
        foreach(FILE_PATH IN LISTS ALL_CONFIG_FILES)
            if(FILE_PATH MATCHES "arm-none-eabi-gcc")
                get_filename_component(CONFIG_DIR ${FILE_PATH} DIRECTORY)
                break()
            endif()
        endforeach()
    
        if(CONFIG_DIR)
    
            message(STATUS "File arm-none-eabi-gcc found in: ${CONFIG_DIR}")
            
            set(ENV{PATH} "${CONFIG_DIR}:$ENV{PATH}")
            
            set(ENV{PATH} "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}:$ENV{PATH}")
            
            if(EXISTS "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}/gcc-arm-none-eabi.cmake")
            
                set(CMAKE_TOOLCHAIN_FILE "${GCC-ARM-NONE-EABI_CURRENT_LIST_DIR}/gcc-arm-none-eabi.cmake" CACHE FILEPATH "Toolchain file")
                
            else()
            
                message(WARNING "Toolchain file was not found.")
                
            endif()
            
        else()
            
            message(FATAL_ERROR "File arm-none-eabi-gcc not found.")
            
        endif()
    
    endif()

endfunction()
