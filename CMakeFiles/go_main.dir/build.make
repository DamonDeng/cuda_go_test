# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.11

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/workspace/cudatest

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/workspace/cudatest

# Include any dependencies generated for this target.
include CMakeFiles/go_main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/go_main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/go_main.dir/flags.make

CMakeFiles/go_main.dir/go_main.cu.o: CMakeFiles/go_main.dir/flags.make
CMakeFiles/go_main.dir/go_main.cu.o: go_main.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/workspace/cudatest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CUDA object CMakeFiles/go_main.dir/go_main.cu.o"
	/usr/local/cuda/bin/nvcc  $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -x cu -dc /home/ubuntu/workspace/cudatest/go_main.cu -o CMakeFiles/go_main.dir/go_main.cu.o

CMakeFiles/go_main.dir/go_main.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CUDA source to CMakeFiles/go_main.dir/go_main.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/go_main.dir/go_main.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CUDA source to assembly CMakeFiles/go_main.dir/go_main.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

# Object files for target go_main
go_main_OBJECTS = \
"CMakeFiles/go_main.dir/go_main.cu.o"

# External object files for target go_main
go_main_EXTERNAL_OBJECTS =

CMakeFiles/go_main.dir/cmake_device_link.o: CMakeFiles/go_main.dir/go_main.cu.o
CMakeFiles/go_main.dir/cmake_device_link.o: CMakeFiles/go_main.dir/build.make
CMakeFiles/go_main.dir/cmake_device_link.o: CMakeFiles/go_main.dir/dlink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/workspace/cudatest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CUDA device code CMakeFiles/go_main.dir/cmake_device_link.o"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/go_main.dir/dlink.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/go_main.dir/build: CMakeFiles/go_main.dir/cmake_device_link.o

.PHONY : CMakeFiles/go_main.dir/build

# Object files for target go_main
go_main_OBJECTS = \
"CMakeFiles/go_main.dir/go_main.cu.o"

# External object files for target go_main
go_main_EXTERNAL_OBJECTS =

go_main: CMakeFiles/go_main.dir/go_main.cu.o
go_main: CMakeFiles/go_main.dir/build.make
go_main: CMakeFiles/go_main.dir/cmake_device_link.o
go_main: CMakeFiles/go_main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/workspace/cudatest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CUDA executable go_main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/go_main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/go_main.dir/build: go_main

.PHONY : CMakeFiles/go_main.dir/build

CMakeFiles/go_main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/go_main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/go_main.dir/clean

CMakeFiles/go_main.dir/depend:
	cd /home/ubuntu/workspace/cudatest && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest/CMakeFiles/go_main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/go_main.dir/depend

