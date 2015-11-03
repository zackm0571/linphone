# Generated by CMake 3.3.20150929-gdb70f

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget bellesip ortp bzrtp mediastreamer_base mediastreamer_voip linphone)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)

# Create imported target bellesip
add_library(bellesip SHARED IMPORTED)

set_target_properties(bellesip PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/include"
  INTERFACE_LINK_LIBRARIES "/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libantlr3c.dylib;pthread;dl;resolv;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libpolarssl.dylib"
)

# Create imported target ortp
add_library(ortp SHARED IMPORTED)

# Create imported target bzrtp
add_library(bzrtp SHARED IMPORTED)

set_target_properties(bzrtp PROPERTIES
  INTERFACE_LINK_LIBRARIES "/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libpolarssl.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libcunit.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libxml2.dylib"
)

# Create imported target mediastreamer_base
add_library(mediastreamer_base SHARED IMPORTED)

set_target_properties(mediastreamer_base PROPERTIES
  INTERFACE_LINK_LIBRARIES "ortp;dl"
)

# Create imported target mediastreamer_voip
add_library(mediastreamer_voip SHARED IMPORTED)

set_target_properties(mediastreamer_voip PROPERTIES
  INTERFACE_LINK_LIBRARIES "ortp;mediastreamer_base;dl;bzrtp;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libsrtp.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libpolarssl.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libgsm.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libopus.dylib;/usr/lib/libm.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libspeex.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libspeexdsp.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libavcodec.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libavutil.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libswscale.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libvpx.a;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/cmake/Matroska2/../../libmatroska2.a;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/cmake/Matroska2/../../libebml2.a;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/cmake/Matroska2/../../libcorec.a"
)

# Create imported target linphone
add_library(linphone SHARED IMPORTED)

set_target_properties(linphone PROPERTIES
  INTERFACE_LINK_LIBRARIES "bellesip;mediastreamer_base;mediastreamer_voip;ortp;bzrtp;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libxml2.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libz.dylib;/Volumes/SSD/workspace_mac/linphone-desktop-all-codecs-mac/OUTPUT/lib/libsqlite3.dylib;/opt/local/lib/libiconv.dylib;/opt/local/lib/libintl.dylib"
)

if(CMAKE_VERSION VERSION_LESS 2.8.12)
  message(FATAL_ERROR "This file relies on consumers using CMake 2.8.12 or greater.")
endif()

# Load information for each installed configuration.
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/BelleSIPTargets-*.cmake")
foreach(f ${CONFIG_FILES})
  include(${f})
endforeach()

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

# Loop over all imported files and verify that they actually exist
foreach(target ${_IMPORT_CHECK_TARGETS} )
  foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
    if(NOT EXISTS "${file}" )
      message(FATAL_ERROR "The imported target \"${target}\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
  endforeach()
  unset(_IMPORT_CHECK_FILES_FOR_${target})
endforeach()
unset(_IMPORT_CHECK_TARGETS)

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)