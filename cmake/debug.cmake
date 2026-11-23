# VSCode IDE debugger interface
find_package(JSON REQUIRED)
find_package(DAP  REQUIRED)

# if(DAP_FOUND)
#   message("-- Found DAP: ${DAP_LIBRARIES} (found version \"${DAP_VERSION}\")")

#   add_library(DAP::DAP INTERFACE IMPORTED)

#   target_include_directories(DAP::DAP INTERFACE ${DAP_INCLUDE_DIRS})
#   target_compile_options(DAP::DAP INTERFACE ${DAP_CFLAGS_OTHER})
#   target_link_libraries(DAP::DAP INTERFACE ${DAP_LIBRARIES})

#   list(APPEND L ${DAP_LIBRARIES})
# endif()
