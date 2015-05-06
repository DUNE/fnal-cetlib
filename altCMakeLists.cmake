# ======================================================================
#
# Build/install script
#
# ======================================================================
set(cetlib_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cetlib")
set(cetlib_INCLUDE_DIR "${cetlib_ROOT_DIR}/cetlib")

configure_file(${cetlib_INCLUDE_DIR}/shlib_utils.cc.in
  ${CMAKE_CURRENT_BINARY_DIR}/shlib_utils.cc @ONLY
  )

set(cetlib_PUBLIC_HDRS
  ${cetlib_INCLUDE_DIR}/base_converter.h
  ${cetlib_INCLUDE_DIR}/BasicPluginFactory.h
  ${cetlib_INCLUDE_DIR}/bit_manipulation.h
  ${cetlib_INCLUDE_DIR}/canonical_number.h
  ${cetlib_INCLUDE_DIR}/canonical_string.h
  ${cetlib_INCLUDE_DIR}/coded_exception.h
  ${cetlib_INCLUDE_DIR}/column_width.h
  ${cetlib_INCLUDE_DIR}/container_algorithms.h
  ${cetlib_INCLUDE_DIR}/cpu_timer.h
  ${cetlib_INCLUDE_DIR}/crc32.h
  ${cetlib_INCLUDE_DIR}/demangle.h
  ${cetlib_INCLUDE_DIR}/exception_collector.h
  ${cetlib_INCLUDE_DIR}/exception.h
  ${cetlib_INCLUDE_DIR}/exempt_ptr.h
  ${cetlib_INCLUDE_DIR}/filepath_maker.h
  ${cetlib_INCLUDE_DIR}/filesystem.h
  ${cetlib_INCLUDE_DIR}/getenv.h
  ${cetlib_INCLUDE_DIR}/hard_cast.h
  ${cetlib_INCLUDE_DIR}/hypot.h
  ${cetlib_INCLUDE_DIR}/include.h
  ${cetlib_INCLUDE_DIR}/includer.h
  ${cetlib_INCLUDE_DIR}/LibraryManager.h
  ${cetlib_INCLUDE_DIR}/lpad.h
  ${cetlib_INCLUDE_DIR}/make_unique.h
  ${cetlib_INCLUDE_DIR}/map_vector.h
  ${cetlib_INCLUDE_DIR}/maybe_ref.h
  ${cetlib_INCLUDE_DIR}/md5.h
  ${cetlib_INCLUDE_DIR}/name_of.h
  ${cetlib_INCLUDE_DIR}/ntos.h
  ${cetlib_INCLUDE_DIR}/nybbler.h
  ${cetlib_INCLUDE_DIR}/PluginFactory.h
  ${cetlib_INCLUDE_DIR}/PluginTypeDeducer.h
  ${cetlib_INCLUDE_DIR}/pow.h
  ${cetlib_INCLUDE_DIR}/registry.h
  ${cetlib_INCLUDE_DIR}/registry_via_id.h
  ${cetlib_INCLUDE_DIR}/rpad.h
  ${cetlib_INCLUDE_DIR}/search_path.h
  ${cetlib_INCLUDE_DIR}/sha1.h
  ${cetlib_INCLUDE_DIR}/shlib_utils.h
  ${cetlib_INCLUDE_DIR}/simple_stats.h
  ${cetlib_INCLUDE_DIR}/split.h
  ${cetlib_INCLUDE_DIR}/split_path.h
  ${cetlib_INCLUDE_DIR}/ston.h
  ${cetlib_INCLUDE_DIR}/trim.h
  ${cetlib_INCLUDE_DIR}/value_ptr.h
  ${cetlib_INCLUDE_DIR}/zero_init.h
  )

set(cetlib_DETAIL_HDRS
  ${cetlib_INCLUDE_DIR}/detail/wrapLibraryManagerException.h
  )

set(cetlib_SSL_HDRS
  ${cetlib_ROOT_DIR}/polarssl/config.h
  ${cetlib_ROOT_DIR}/polarssl/md5.h
  ${cetlib_ROOT_DIR}/polarssl/sha1.h
  ${cetlib_ROOT_DIR}/polarssl/version.h
  )

set(cetlib_SRCS
  ${CMAKE_CURRENT_BINARY_DIR}/shlib_utils.cc
  ${cetlib_INCLUDE_DIR}/detail/wrapLibraryManagerException.cc
  ${cetlib_ROOT_DIR}/polarssl/md5.cc
  ${cetlib_ROOT_DIR}/polarssl/sha1.cc
  ${cetlib_INCLUDE_DIR}/base_converter.cc
  ${cetlib_INCLUDE_DIR}/BasicPluginFactory.cc
  ${cetlib_INCLUDE_DIR}/canonical_number.cc
  ${cetlib_INCLUDE_DIR}/canonical_string.cc
  ${cetlib_INCLUDE_DIR}/cpu_timer.cc
  ${cetlib_INCLUDE_DIR}/crc32.cc
  ${cetlib_INCLUDE_DIR}/demangle.cc
  ${cetlib_INCLUDE_DIR}/exception.cc
  ${cetlib_INCLUDE_DIR}/exception_collector.cc
  ${cetlib_INCLUDE_DIR}/filepath_maker.cc
  ${cetlib_INCLUDE_DIR}/filesystem.cc
  ${cetlib_INCLUDE_DIR}/getenv.cc
  ${cetlib_INCLUDE_DIR}/inc-expand.cc
  ${cetlib_INCLUDE_DIR}/include.cc
  ${cetlib_INCLUDE_DIR}/includer.cc
  ${cetlib_INCLUDE_DIR}/LibraryManager.cc
  ${cetlib_INCLUDE_DIR}/lpad.cc
  ${cetlib_INCLUDE_DIR}/nybbler.cc
  ${cetlib_INCLUDE_DIR}/PluginFactory.cc
  ${cetlib_INCLUDE_DIR}/rpad.cc
  ${cetlib_INCLUDE_DIR}/search_path.cc
  ${cetlib_INCLUDE_DIR}/simple_stats.cc
  ${cetlib_INCLUDE_DIR}/split_path.cc
  )

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_library(obj-cetlib OBJECT
  ${cetlib_PUBLIC_HDRS}
  ${cetlib_DETAIL_HDRS}
  ${cetlib_SSL_HDRS}
  ${cetlib_SRCS}
  )

add_executable(inc-expand ${cetlib_INCLUDE_DIR}/inc-expand.cc)
target_link_libraries(inc-expand
  ${Boost_FILESYSTEM_LIBRARY}
  ${Boost_REGEX_LIBRARY}
  )

# TEMP local install of exes
install(TARGETS inc-expand
  EXPORT CETLIBExports
  DESTINATION ${CMAKE_INSTALL_BINDIR}
  COMPONENT Runtime
  )

# TEMP local install of headers
install(FILES ${cetlib_PUBLIC_HDRS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cetlib
  COMPONENT Development
  )
install(FILES ${cetlib_DETAIL_HDRS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cetlib/detail
  COMPONENT Development
  )
install(FILES ${cetlib_SSL_HDRS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cetlib/polarssl
  COMPONENT Development
  )

