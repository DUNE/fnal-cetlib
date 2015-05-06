# ======================================================================
#
# Testing
#
# ======================================================================
# - Use basic tests, then customize for those using uneeded cet
# functionality

set(cetlib_TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cetlib/test)

# - Base
add_subdirectory(${cetlib_TEST_DIR})

# - Customizations
# - Handbuilt test for LibraryManager
add_library(test_fakePlugin SHARED ${cetlib_TEST_DIR}/moduleType.cc)
add_executable(LibraryManager_t2 ${cetlib_TEST_DIR}/LibraryManager_t.cc)
set_target_properties(LibraryManager_t2
  PROPERTIES
   COMPILE_DEFINITIONS "BOOST_TEST_MAIN;BOOST_TEST_DYN_LINK"
   )
target_link_libraries(LibraryManager_t2 ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY} FNALCore)

# - Plugin test
# This will fail because unlike the above, it doesn't set LD_LIBRARY_PATH
add_library(test_TestPluginBase SHARED ${cetlib_TEST_DIR}/TestPluginBase.cc)
add_library(TestPlugin_plugin SHARED ${cetlib_TEST_DIR}/TestPlugin_plugin.cc)
target_link_libraries(TestPlugin_plugin test_TestPluginBase)

