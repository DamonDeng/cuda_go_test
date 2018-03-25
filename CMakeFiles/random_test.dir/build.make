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
include CMakeFiles/random_test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/random_test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/random_test.dir/flags.make

CMakeFiles/random_test.dir/random_test.cu.o: CMakeFiles/random_test.dir/flags.make
CMakeFiles/random_test.dir/random_test.cu.o: random_test.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/workspace/cudatest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CUDA object CMakeFiles/random_test.dir/random_test.cu.o"
	/usr/local/cuda/bin/nvcc  $(CUDA_DEFINES) $(CUDA_INCLUDES) $(CUDA_FLAGS) -x cu -dc /home/ubuntu/workspace/cudatest/random_test.cu -o CMakeFiles/random_test.dir/random_test.cu.o

CMakeFiles/random_test.dir/random_test.cu.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CUDA source to CMakeFiles/random_test.dir/random_test.cu.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_PREPROCESSED_SOURCE

CMakeFiles/random_test.dir/random_test.cu.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CUDA source to assembly CMakeFiles/random_test.dir/random_test.cu.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_CUDA_CREATE_ASSEMBLY_SOURCE

# Object files for target random_test
random_test_OBJECTS = \
"CMakeFiles/random_test.dir/random_test.cu.o"

# External object files for target random_test
random_test_EXTERNAL_OBJECTS =

CMakeFiles/random_test.dir/cmake_device_link.o: CMakeFiles/random_test.dir/random_test.cu.o
CMakeFiles/random_test.dir/cmake_device_link.o: CMakeFiles/random_test.dir/build.make
CMakeFiles/random_test.dir/cmake_device_link.o: CMakeFiles/random_test.dir/dlink.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/workspace/cudatest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CUDA device code CMakeFiles/random_test.dir/cmake_device_link.o"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/random_test.dir/dlink.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/random_test.dir/build: CMakeFiles/random_test.dir/cmake_device_link.o

.PHONY : CMakeFiles/random_test.dir/build

# Object files for target random_test
random_test_OBJECTS = \
"CMakeFiles/random_test.dir/random_test.cu.o"

# External object files for target random_test
random_test_EXTERNAL_OBJECTS =

random_test: CMakeFiles/random_test.dir/random_test.cu.o
random_test: CMakeFiles/random_test.dir/build.make
random_test: CMakeFiles/random_test.dir/cmake_device_link.o
random_test: CMakeFiles/random_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/workspace/cudatest/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CUDA executable random_test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/random_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/random_test.dir/build: random_test

.PHONY : CMakeFiles/random_test.dir/build

CMakeFiles/random_test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/random_test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/random_test.dir/clean

CMakeFiles/random_test.dir/depend:
	cd /home/ubuntu/workspace/cudatest && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest /home/ubuntu/workspace/cudatest/CMakeFiles/random_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/random_test.dir/depend
