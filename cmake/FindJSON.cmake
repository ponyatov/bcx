include(FindPackageHandleStandardArgs)

# ~~~
# Try to find JSON (jsoncpp) include dirs and libraries.
#
# Defines:
#   JSON_FOUND          - true if jsoncpp was found
#   JSON_INCLUDE_DIRS   - include directories for jsoncpp
#   JSON_LIBRARIES      - libraries to link against
#   JSON_VERSION        - version of jsoncpp
#   JSON::JSON           - imported target (if jsoncpp was found)
# ~~~

find_package(jsoncpp CONFIG REQUIRED)

if(jsoncpp_FOUND)
    set(JSON_FOUND TRUE)
    set(JSON_VERSION      "${jsoncpp_VERSION}"     )
    set(JSON_INCLUDE_DIRS "${jsoncpp_INCLUDE_DIRS}")
    set(JSON_LIBRARIES     jsoncpp                 )
else()
    set(JSON_FOUND FALSE)
    set(JSON_VERSION "")
endif()

if(JSON_FOUND)
  message(STATUS "Found JSON: ${JSON_LIBRARIES} (found version \"${JSON_VERSION}\") ${JSON_INCLUDE_DIRS}")
  add_library(JSON::JSON INTERFACE IMPORTED)
  target_include_directories(JSON::JSON INTERFACE ${JSON_INCLUDE_DIRS})
  target_compile_options(JSON::JSON INTERFACE ${JSON_CFLAGS_OTHER})
  target_link_libraries(JSON::JSON INTERFACE ${JSON_LIBRARIES})
  list(APPEND L "${JSON_LIBRARIES}")
endif()
