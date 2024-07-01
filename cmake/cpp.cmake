set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB C RELATIVE ${CMAKE_SOURCE_DIR} "src/*.c*" "tmp/*.c*")
file(GLOB H RELATIVE ${CMAKE_SOURCE_DIR} "inc/*.h*" "tmp/*.h*")
# file(GLOB R RELATIVE ${CMAKE_SOURCE_DIR} "inc/*.qrc")

include_directories(
    "${CMAKE_SOURCE_DIR}/inc"
    "${CMAKE_SOURCE_DIR}/tmp"
    ${READLINE_INCLUDE_DIR}
)

# add_link_options("-Wl,-E") # dl

add_executable(${APP}
    ${C} ${H} ${R}
    ${FLEX_lexer_OUTPUTS} ${BISON_parser_OUTPUTS}
)

target_link_libraries(${APP}
#     Qt5::Core Qt5::Gui Qt5::Widgets
#     dl
    ${READLINE_LIBRARY}
)

# add_link_options("-lll${READLINE_LIBRARY}")
