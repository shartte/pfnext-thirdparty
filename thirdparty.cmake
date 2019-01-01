
set(BUILD_DIR ${CMAKE_CURRENT_LIST_DIR}/out/)

##############################################################################
# GSL
##############################################################################
add_library(GSL INTERFACE IMPORTED)
target_include_directories(
    GSL
    INTERFACE
    ${BUILD_DIR}/gsl/include
)

##############################################################################
# GLFW
##############################################################################

add_library(glfw STATIC IMPORTED)
target_include_directories(glfw INTERFACE ${BUILD_DIR}/glfw-debug/include)
set_property(TARGET glfw PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/glfw-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}glfw3${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET glfw PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/glfw-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}glfw3${CMAKE_STATIC_LIBRARY_SUFFIX})
 
##############################################################################
# Ozz
##############################################################################

add_library(ozz_base STATIC IMPORTED)
target_include_directories(ozz_base INTERFACE ${BUILD_DIR}/ozz-debug/include)
set_property(TARGET ozz_base PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/ozz-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_base_d${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET ozz_base PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/ozz-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_base_rd${CMAKE_STATIC_LIBRARY_SUFFIX})
 
add_library(ozz_geometry STATIC IMPORTED)
target_link_libraries(ozz_geometry INTERFACE ozz_base)
set_property(TARGET ozz_geometry PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/ozz-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_geometry_d${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET ozz_geometry PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/ozz-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_geometry_rd${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(ozz_options STATIC IMPORTED)
target_include_directories(ozz_options INTERFACE ${BUILD_DIR}/ozz-debug/include)
set_property(TARGET ozz_options PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/ozz-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_options_d${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET ozz_options PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/ozz-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_options_rd${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(ozz_animation STATIC IMPORTED)
target_link_libraries(ozz_animation INTERFACE ozz_base)
set_property(TARGET ozz_animation PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/ozz-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_animation_d${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET ozz_animation PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/ozz-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_animation_rd${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(ozz_animation_offline STATIC IMPORTED)
set_property(TARGET ozz_animation_offline PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/ozz-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_animation_offline_d${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET ozz_animation_offline PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/ozz-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_animation_offline_rd${CMAKE_STATIC_LIBRARY_SUFFIX})
target_link_libraries(ozz_animation_offline INTERFACE ozz_animation)

add_library(ozz_animation_tools STATIC IMPORTED)
target_link_libraries(ozz_animation_tools INTERFACE ozz_animation_offline ozz_options)
set_property(TARGET ozz_animation_tools PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/ozz-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_animation_tools_d${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET ozz_animation_tools PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/ozz-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}ozz_animation_tools_rd${CMAKE_STATIC_LIBRARY_SUFFIX})

##############################################################################
# GLM
##############################################################################
add_library(glm INTERFACE IMPORTED)
target_include_directories(
    glm
    INTERFACE
    ${BUILD_DIR}/glm/include
)

##############################################################################
# Flatbuffers
##############################################################################
add_library(flatbuffers INTERFACE IMPORTED)
target_include_directories(
    flatbuffers
    INTERFACE
    ${BUILD_DIR}/flatbuffers-debug/include
)

add_library(flatbuffers-reflection STATIC IMPORTED)
target_link_libraries(flatbuffers-reflection INTERFACE flatbuffers)
set_property(TARGET flatbuffers-reflection PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/flatbuffers-debug/lib/${CMAKE_STATIC_LIBRARY_PREFIX}flatbuffers${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET flatbuffers-reflection PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/flatbuffers-release/lib/${CMAKE_STATIC_LIBRARY_PREFIX}flatbuffers${CMAKE_STATIC_LIBRARY_SUFFIX})

##############################################################################
# Filament
##############################################################################

set(_FILAMENT_DEBUG_LIBS ${BUILD_DIR}/filament-debug/lib/x86_64)
set(_FILAMENT_RELEASE_LIBS ${BUILD_DIR}/filament-release/lib/x86_64)
set(_FILAMENT_INCLUDES ${BUILD_DIR}/filament-debug/include)

add_library(filament-bluegl STATIC IMPORTED)
set_property(TARGET filament-bluegl PROPERTY IMPORTED_LOCATION_DEBUG ${_FILAMENT_DEBUG_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}bluegl${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET filament-bluegl PROPERTY IMPORTED_LOCATION ${_FILAMENT_RELEASE_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}bluegl${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(filament-filabridge STATIC IMPORTED)
set_property(TARGET filament-filabridge PROPERTY IMPORTED_LOCATION_DEBUG ${_FILAMENT_DEBUG_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filabridge${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET filament-filabridge PROPERTY IMPORTED_LOCATION ${_FILAMENT_RELEASE_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filabridge${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(filament-filaflat STATIC IMPORTED)
set_property(TARGET filament-filaflat PROPERTY IMPORTED_LOCATION_DEBUG ${_FILAMENT_DEBUG_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filaflat${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET filament-filaflat PROPERTY IMPORTED_LOCATION ${_FILAMENT_RELEASE_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filaflat${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(filament-filameshio STATIC IMPORTED)
set_property(TARGET filament-filameshio PROPERTY IMPORTED_LOCATION_DEBUG ${_FILAMENT_DEBUG_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filameshio${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET filament-filameshio PROPERTY IMPORTED_LOCATION ${_FILAMENT_RELEASE_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filameshio${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(filament-utils STATIC IMPORTED)
set_property(TARGET filament-utils PROPERTY IMPORTED_LOCATION_DEBUG ${_FILAMENT_DEBUG_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}utils${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET filament-utils PROPERTY IMPORTED_LOCATION ${_FILAMENT_RELEASE_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}utils${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(filament-image STATIC IMPORTED)
set_property(TARGET filament-image PROPERTY IMPORTED_LOCATION_DEBUG ${_FILAMENT_DEBUG_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}image${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET filament-image PROPERTY IMPORTED_LOCATION ${_FILAMENT_RELEASE_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}image${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(filament STATIC IMPORTED)
target_include_directories(
    filament
    INTERFACE
    ${_FILAMENT_INCLUDES}
)
set_property(TARGET filament PROPERTY IMPORTED_LOCATION_DEBUG ${_FILAMENT_DEBUG_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filament${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET filament PROPERTY IMPORTED_LOCATION ${_FILAMENT_RELEASE_LIBS}/${CMAKE_STATIC_LIBRARY_PREFIX}filament${CMAKE_STATIC_LIBRARY_SUFFIX})
if(WIN32)
set(OPENGL_LIBS opengl32)
endif()
target_link_libraries(filament INTERFACE filament-utils filament-filabridge filament-filaflat filament-bluegl ${OPENGL_LIBS})


##############################################################################
# CEF
##############################################################################

add_library(cef-wrapper STATIC IMPORTED)
set_property(TARGET cef-wrapper PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/cef/Debug/libcef_dll_wrapper${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET cef-wrapper PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/cef/Release/libcef_dll_wrapper${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(cef STATIC IMPORTED)
set_property(TARGET cef PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/cef/Debug/libcef${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET cef PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/cef/Release/libcef${CMAKE_STATIC_LIBRARY_SUFFIX})
target_link_libraries(cef INTERFACE cef-wrapper)
target_include_directories(
    cef
    INTERFACE
    ${BUILD_DIR}/cef
)


##############################################################################
# Bullet
##############################################################################

set(_BULLET_INCLUDES ${BUILD_DIR}/bullet3-debug/include/bullet)
set(_BULLET_DEBUG_LIBS ${BUILD_DIR}/bullet3-debug/lib)
set(_BULLET_RELEASE_LIBS ${BUILD_DIR}/bullet3-release/lib)

add_library(bullet3-common STATIC IMPORTED)
target_include_directories(bullet3-common INTERFACE ${_BULLET_INCLUDES})
set_property(TARGET bullet3-common PROPERTY IMPORTED_LOCATION_DEBUG ${_BULLET_DEBUG_LIBS}/Bullet3Common_Debug${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET bullet3-common PROPERTY IMPORTED_LOCATION ${_BULLET_RELEASE_LIBS}/Bullet3Common${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(bullet-linearmath STATIC IMPORTED)
target_include_directories(bullet-linearmath INTERFACE ${_BULLET_INCLUDES})
set_property(TARGET bullet-linearmath PROPERTY IMPORTED_LOCATION_DEBUG ${_BULLET_DEBUG_LIBS}/LinearMath_Debug${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET bullet-linearmath PROPERTY IMPORTED_LOCATION ${_BULLET_RELEASE_LIBS}/LinearMath${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(bullet3-softbody STATIC IMPORTED)
target_include_directories(bullet3-softbody INTERFACE ${_BULLET_INCLUDES})
set_property(TARGET bullet3-softbody PROPERTY IMPORTED_LOCATION_DEBUG ${_BULLET_DEBUG_LIBS}/BulletSoftBody_Debug${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET bullet3-softbody PROPERTY IMPORTED_LOCATION ${_BULLET_RELEASE_LIBS}/BulletSoftBody${CMAKE_STATIC_LIBRARY_SUFFIX})

add_library(bullet-collision STATIC IMPORTED)
target_include_directories(bullet-collision INTERFACE ${_BULLET_INCLUDES})
set_property(TARGET bullet-collision PROPERTY IMPORTED_LOCATION_DEBUG ${_BULLET_DEBUG_LIBS}/BulletCollision_Debug${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET bullet-collision PROPERTY IMPORTED_LOCATION ${_BULLET_RELEASE_LIBS}/BulletCollision${CMAKE_STATIC_LIBRARY_SUFFIX})
target_link_libraries(bullet-collision INTERFACE bullet-linearmath)

add_library(bullet-dynamics STATIC IMPORTED)
target_include_directories(bullet-dynamics INTERFACE ${_BULLET_INCLUDES})
set_property(TARGET bullet-dynamics PROPERTY IMPORTED_LOCATION_DEBUG ${_BULLET_DEBUG_LIBS}/BulletDynamics_Debug${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET bullet-dynamics PROPERTY IMPORTED_LOCATION ${_BULLET_RELEASE_LIBS}/BulletDynamics${CMAKE_STATIC_LIBRARY_SUFFIX})
target_link_libraries(bullet-dynamics INTERFACE bullet-collision bullet-linearmath)

##############################################################################
# libjpeg-turbo
##############################################################################

add_library(libjpeg-turbo STATIC IMPORTED)
target_include_directories(libjpeg-turbo INTERFACE ${BUILD_DIR}/libjpeg-turbo-debug/include)
set_property(TARGET libjpeg-turbo PROPERTY IMPORTED_LOCATION_DEBUG ${BUILD_DIR}/libjpeg-turbo-debug/lib/turbojpeg-static${CMAKE_STATIC_LIBRARY_SUFFIX})
set_property(TARGET libjpeg-turbo PROPERTY IMPORTED_LOCATION ${BUILD_DIR}/libjpeg-turbo-release/lib/turbojpeg-static${CMAKE_STATIC_LIBRARY_SUFFIX})
