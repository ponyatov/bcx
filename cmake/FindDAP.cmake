include(FindPackageHandleStandardArgs)

# ~~~
# Try to find DAP (cppdap) include dirs and libraries.
#
# Defines:
#   DAP_FOUND          - true if cppdap was found
#   DAP_INCLUDE_DIRS   - include directories for cppdap
#   DAP_LIBRARIES      - libraries to link against
#   DAP_VERSION        - version of cppdap
#   DAP::DAP           - imported target (if cppdap was found)
# ~~~

find_package(cppdap CONFIG REQUIRED)

if(cppdap_FOUND)
    set(DAP_FOUND TRUE)
    set(DAP_VERSION      "${cppdap_VERSION}"     )
    set(DAP_INCLUDE_DIRS "${cppdap_INCLUDE_DIRS}")
    set(DAP_LIBRARIES     cppdap                 )
else()
    set(DAP_FOUND FALSE)
    set(DAP_VERSION "")
endif()

if(DAP_FOUND)
  message(STATUS "Found DAP: ${DAP_LIBRARIES} (found version \"${DAP_VERSION}\") ${DAP_INCLUDE_DIRS}")
  add_library(DAP::DAP INTERFACE IMPORTED)
  target_include_directories(DAP::DAP INTERFACE ${DAP_INCLUDE_DIRS})
  target_compile_options(DAP::DAP INTERFACE ${DAP_CFLAGS_OTHER})
  target_link_libraries(DAP::DAP INTERFACE ${DAP_LIBRARIES})
  list(APPEND L "${DAP_LIBRARIES}")
endif()
