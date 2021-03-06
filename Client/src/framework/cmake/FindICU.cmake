# Try to find the ICU library
#  ICU_FOUND - system has ICU
#  ICU_INCLUDE_DIR - the ICU include directory
#  ICU_LIBRARY - the ICU library

FIND_PATH(ICU_INCLUDE_DIR NAMES unicode/utf8.h)
SET(_ICUIO_STATIC_LIBS libicuio.a)
SET(_ICUIO_SHARED_LIBS libicuio.dll.a icuio)
SET(_ICUI18N_STATIC_LIBS libicui18n.a)
SET(_ICUI18N_SHARED_LIBS libicui18n.dll.a icui18n)
SET(_ICUUC_STATIC_LIBS libicuuc.a)
SET(_ICUUC_SHARED_LIBS libicuuc.dll.a icuuc)
SET(_ICUDATA_STATIC_LIBS libicudata.a)
SET(_ICUDATA_SHARED_LIBS libicudata.dll.a icudata)
IF(USE_STATIC_LIBS)
    FIND_LIBRARY(ICUIO_LIBRARY NAMES ${_ICUIO_STATIC_LIBS} ${_ICUIO_SHARED_LIBS})
    FIND_LIBRARY(ICUI18N_LIBRARY NAMES ${_ICUI18N_STATIC_LIBS} ${_ICUI18N_SHARED_LIBS})
    FIND_LIBRARY(ICUUC_LIBRARY NAMES ${_ICUUC_STATIC_LIBS} ${_ICUUC_SHARED_LIBS})
    FIND_LIBRARY(ICUDATA_LIBRARY NAMES ${_ICUDATA_STATIC_LIBS} ${_ICUDATA_SHARED_LIBS})
ELSE()
    FIND_LIBRARY(ICUIO_LIBRARY NAMES ${_ICUIO_SHARED_LIBS} ${_ICUIO_STATIC_LIBS})
    FIND_LIBRARY(ICUI18N_LIBRARY NAMES ${_ICUI18N_SHARED_LIBS} ${_ICUI18N_STATIC_LIBS})
    FIND_LIBRARY(ICUUC_LIBRARY NAMES ${_ICUUC_SHARED_LIBS} ${_ICUUC_STATIC_LIBS})
    FIND_LIBRARY(ICUDATA_LIBRARY NAMES ${_ICUDATA_SHARED_LIBS} ${_ICUDATA_STATIC_LIBS})
ENDIF()
SET(ICU_LIBRARIES ${ICUIO_LIBRARY}  ${ICUI18N_LIBRARY} ${ICUUC_LIBRARY} ${ICUDATA_LIBRARY})
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(ICU DEFAULT_MSG ICU_LIBRARIES ICU_INCLUDE_DIR)
MARK_AS_ADVANCED(ICU_LIBRARIES  ICU_INCLUDE_DIR)