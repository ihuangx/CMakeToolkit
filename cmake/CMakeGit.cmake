# ----------------------------------------------------------------------------
#
# CMakeGit_InitGit()
# - find git [required]
#
# ----------------------------------------------------------------------------
#
# CMakeGit_UpdateSubmodule()
# - update submodule
#
# ----------------------------------------------------------------------------

message(STATUS "include CMakeGitGit.cmake")

macro(CMakeGit_InitGit)
	message(STATUS "----------")
	find_package(Git REQUIRED)
	message(STATUS "GIT_FOUND: ${GIT_FOUND}")
	message(STATUS "GIT_EXECUTABLE: ${GIT_EXECUTABLE}")
	message(STATUS "GIT_VERSION_STRING: ${GIT_VERSION_STRING}")
endmacro()

function(CMakeGit_UpdateSubmodule)
	if(NOT GIT_FOUND)
		message(FATAL_ERROR "you should call CMakeGit_InitGit() before calling CMakeGit_UpdateSubmodule()")
	endif()
	execute_process(
		COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
		#OUTPUT_VARIABLE out
		#OUTPUT_STRIP_TRAILING_WHITESPACE
		#ERROR_QUIET
		WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
	)
endfunction()
