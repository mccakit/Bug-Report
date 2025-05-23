###########
 Example 3
###########

XMake fails to compile with the builtin llvm toolchain

.. code:: lua

    set_toolchains("llvm")
    package("glfw", function()
        add_deps("cmake")
        set_sourcedir("glfw")
        on_install(function (package)
            local configs = {
                "-DGLFW_BUILD_DOCS=OFF",
                "-DGLFW_BUILD_TESTS=OFF",
                "-DGLFW_BUILD_EXAMPLES=OFF"
            }
            import("package.tools.cmake")
            cmake.install(package, configs)
        end)
    end)
    add_requires("glfw")

    target("glad", function()
        set_kind("static")
        add_files("glad/src/*.c")
        add_headerfiles("glad/include/glad/*.h")
        add_headerfiles("glad/include/KHR/*.h")
        add_includedirs("glad/include",{public=true})
    end)

    target("hi", function()
        set_kind("binary")
        add_files("src/*.cpp")
        add_deps("glad")
        add_packages("glfw")
        if is_plat("windows") then
            add_syslinks("msvcrt", "opengl32", "user32", "shell32", "gdi32")
        elseif is_plat("linux") then
            add_syslinks("dl", "pthread")
        end
    end)

.. code:: bash

   xmake config --plat=cross --cross=x86_64-pc-linux-gnu --toolchain=llvm --sdk=C:/dev/sysroots/deb -cvD

.. code:: bash

    checking for architecture ... x86_64
    checking for git ... C:\Users\cakit\scoop\shims\git.exe
    checkinfo: cannot runv(gzip.exe --version), No such file or directory
    checking for gzip ... no
    checking for 7z ... C:\Program Files\xmake\winenv\bin\7z
    checking for ping ... C:\Windows\System32\PING.EXE
    pinging the host(gitlab.com) ... 53 ms
    pinging the host(github.com) ... 58 ms
    pinging the host(gitee.com) ... 65535 ms
    C:\Users\cakit\scoop\shims\git.exe rev-parse HEAD
    checking for nim ... C:\Users\cakit\scoop\shims\nim.exe
    checking for ninja ... no
    checking for cl.exe ... C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.43.34808\bin\HostX64\x64\cl.exe
    checking for Microsoft Visual Studio (x64) version ... 2022
    checking for Microsoft C/C++ Compiler (x64) version ... 19.43.34810
    checking for ninja ... no
    checking for ninja ... no
    checking for ninja ... C:\Users\cakit\scoop\shims\ninja.exe
    checking for cmake ... no
    checking for cmake ... no
    checking for cmake ... no
    checking for cmake ... C:\Users\cakit\scoop\shims\cmake.exe
    finding glfw from xmake ..
    checking for xmake::glfw ... no
    finding glfw from vcpkg ..
    finding glfw from conan ..
    checking for glfw ... no
    note: install or modify (m) these packages (pass -y to skip confirm)?
    -> glfw latest [toolchains:"llvm"]
    please input: y (y/n/m)
    y
    checking for ninja ... C:\Users\cakit\scoop\shims\ninja.exe
    checking for clang ... C:\llvm\bin\clang.exe
    checking for the c compiler (cc) ... clang.exe
    checking for clang ... C:\llvm\bin\clang.exe
    checking for the c++ compiler (cxx) ... clang.exe
    checking for clang ... C:\llvm\bin\clang.exe
    checking for the assember (as) ... clang.exe
    checking for llvm-ar ... C:\llvm\bin\llvm-ar.exe
    checking for the static library archiver (ar) ... llvm-ar.exe
    checking for clang++ ... C:\llvm\bin\clang++.exe
    checking for the linker (ld) ... clang++.exe
    checking for llvm-ranlib ... C:\llvm\bin\llvm-ranlib.exe
    checking for the archive index generator (ranlib) ... llvm-ranlib.exe
    checking for C:\llvm\bin\clang.exe ... ok
    checking for flags (-fPIC) ... ok
    > clang.exe "-fPIC" "-Qunused-arguments" "--target=x86_64-pc-linux-gnu"
    checking for flags (-fPIC) ... ok
    > clang.exe "-fPIC" "-Qunused-arguments" "--target=x86_64-pc-linux-gnu"
    checking for flags (-fPIC) ... ok
    > clang.exe "-fPIC" "-Qunused-arguments" "--target=x86_64-pc-linux-gnu"
    checking for C:\llvm\bin\clang++.exe ... ok
    checking for flags (-fPIC) ... no
    > clang++.exe "-fPIC" "--target=x86_64-pc-linux-gnu" "--target=x86_64-pc-linux-gnu"
    checkinfo: @programdir\core\sandbox\modules\os.lua:273: clang++: warning: treating 'c' input as 'c++' when in C++ mode, this behavior is deprecated [-Wdeprecated]
    clang++: error: unable to execute command: program not executable
    clang++: error: linker command failed with exit code 1 (use -v to see invocation)

    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:273]: in function 'runv'
        [@programdir\modules\core\tools\gcc\has_flags.lua:42]:
    checking for clang++ ... C:\llvm\bin\clang++.exe
    checking for the shared library linker (sh) ... clang++.exe
    checking for flags (-fPIC) ... no
    > clang++.exe "-fPIC" "-shared" "--target=x86_64-pc-linux-gnu" "--target=x86_64-pc-linux-gnu"
    checkinfo: @programdir\core\sandbox\modules\os.lua:273: clang++: warning: treating 'c' input as 'c++' when in C++ mode, this behavior is deprecated [-Wdeprecated]
    clang++: error: unable to execute command: program not executable
    clang++: error: linker command failed with exit code 1 (use -v to see invocation)

    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:273]: in function 'runv'
        [@programdir\modules\core\tools\gcc\has_flags.lua:42]:
    checking for cmake ... C:\Users\cakit\scoop\shims\cmake.exe
    C:\Users\cakit\scoop\shims\cmake.exe -DGLFW_BUILD_DOCS=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=C:\Users\cakit\Desktop\ex3\build\.packages\g\glfw\latest\d838b2dcf55d4c1b9ec05d8a77d64c01 -DCMAKE_INSTALL_LIBDIR:PATH=lib -G Ninja -DCMAKE_MAKE_PROGRAM=C:\Users\cakit\scoop\shims\ninja.exe -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DHAVE_FLAG_SEARCH_PATHS_FIRST=0 -DCMAKE_AR=C:/llvm/bin/llvm-ar.exe -DCMAKE_C_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_ASM_COMPILER=C:/llvm/bin/clang.exe -DCMAKE_CXX_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_OSX_SYSROOT= -DBUILD_SHARED_LIBS=OFF "-DCMAKE_CXX_LINK_EXECUTABLE=C:/llvm/bin/clang++.exe <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>" -DCMAKE_FIND_USE_INSTALL_PREFIX=0 -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=BOTH -DCMAKE_CXX_COMPILER=C:/llvm/bin/clang++.exe -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER -DCMAKE_BUILD_TYPE=Release -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=BOTH -DCMAKE_SHARED_LINKER_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_SYSTEM_PROCESSOR=x86_64 -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=0 -DCMAKE_RANLIB=C:/llvm/bin/llvm-ranlib.exe -DCMAKE_EXE_LINKER_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_FIND_ROOT_PATH=C:/dev/sysroots/deb -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=BOTH -DCMAKE_MODULE_LINKER_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_ASM_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_C_COMPILER=C:/llvm/bin/clang.exe -DCMAKE_STATIC_LINKER_FLAGS= -DCMAKE_POLICY_VERSION_MINIMUM=3.5 C:\Users\cakit\Desktop\ex3\glfw
    -- The C compiler identification is Clang 21.0.0
    -- Detecting C compiler ABI info
    -- Detecting C compiler ABI info - failed
    -- Check for working C compiler: C:/llvm/bin/clang.exe
    -- Check for working C compiler: C:/llvm/bin/clang.exe - broken
    CMake Error at C:/Users/cakit/scoop/apps/cmake/current/share/cmake-4.0/Modules/CMakeTestCCompiler.cmake:67 (message):
    The C compiler

        "C:/llvm/bin/clang.exe"

    is not able to compile a simple test program.

    It fails with the following output:

        Change Dir: 'C:/Users/cakit/Desktop/ex3/build/.packages/g/glfw/latest/cache/build_d838b2dc/CMakeFiles/CMakeScratch/TryCompile-ufe6sd'

        Run Build Command(s): C:\Users\cakit\scoop\shims\ninja.exe -v cmTC_7f647
        [1/2] C:\llvm\bin\clang.exe   --target=x86_64-pc-linux-gnu  -fPIE -MD -MT CMakeFiles/cmTC_7f647.dir/testCCompiler.c.o -MF CMakeFiles\cmTC_7f647.dir\testCCompiler.c.o.d -o CMakeFiles/cmTC_7f647.dir/testCCompiler.c.o -c C:/Users/cakit/Desktop/ex3/build/.packages/g/glfw/latest/cache/build_d838b2dc/CMakeFiles/CMakeScratch/TryCompile-ufe6sd/testCCompiler.c
        [2/2] C:\WINDOWS\system32\cmd.exe /C "cd . && C:\llvm\bin\clang.exe --target=x86_64-pc-linux-gnu --target=x86_64-pc-linux-gnu CMakeFiles/cmTC_7f647.dir/testCCompiler.c.o -o cmTC_7f647   && cd ."
        FAILED: cmTC_7f647
        C:\WINDOWS\system32\cmd.exe /C "cd . && C:\llvm\bin\clang.exe --target=x86_64-pc-linux-gnu --target=x86_64-pc-linux-gnu CMakeFiles/cmTC_7f647.dir/testCCompiler.c.o -o cmTC_7f647   && cd ."
        clang: error: unable to execute command: program not executable
        clang: error: linker command failed with exit code 1 (use -v to see invocation)
        ninja: build stopped: subcommand failed.





    CMake will not be able to correctly generate this project.
    Call Stack (most recent call first):
    CMakeLists.txt:3 (project)


    -- Configuring incomplete, errors occurred!
    error: @programdir\core\sandbox\modules\os.lua:378: execv(C:\Users\cakit\scoop\shims\cmake.exe -DGLFW_BUILD_DOCS=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=C:\Users\cakit\Desktop\ex3\build\.packages\g\glfw\latest\d838b2dcf55d4c1b9ec05d8a77d64c01 -DCMAKE_INSTALL_LIBDIR:PATH=lib -G Ninja -DCMAKE_MAKE_PROGRAM=C:\Users\cakit\scoop\shims\ninja.exe -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DHAVE_FLAG_SEARCH_PATHS_FIRST=0 -DCMAKE_AR=C:/llvm/bin/llvm-ar.exe -DCMAKE_C_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_ASM_COMPILER=C:/llvm/bin/clang.exe -DCMAKE_CXX_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_OSX_SYSROOT= -DBUILD_SHARED_LIBS=OFF "-DCMAKE_CXX_LINK_EXECUTABLE=C:/llvm/bin/clang++.exe <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>" -DCMAKE_FIND_USE_INSTALL_PREFIX=0 -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=BOTH -DCMAKE_CXX_COMPILER=C:/llvm/bin/clang++.exe -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER -DCMAKE_BUILD_TYPE=Release -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=BOTH -DCMAKE_SHARED_LINKER_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_SYSTEM_PROCESSOR=x86_64 -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=0 -DCMAKE_RANLIB=C:/llvm/bin/llvm-ranlib.exe -DCMAKE_EXE_LINKER_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_FIND_ROOT_PATH=C:/dev/sysroots/deb -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=BOTH -DCMAKE_MODULE_LINKER_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_ASM_FLAGS=--target=x86_64-pc-linux-gnu -DCMAKE_C_COMPILER=C:/llvm/bin/clang.exe -DCMAKE_STATIC_LINKER_FLAGS= -DCMAKE_POLICY_VERSION_MINIMUM=3.5 C:\Users\cakit\Desktop\ex3\glfw) failed(1)
    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:378]:
        [@programdir\core\sandbox\modules\os.lua:291]: in function 'vrunv'
        [@programdir\modules\package\tools\cmake.lua:1338]: in function 'configure'
        [@programdir\modules\package\tools\cmake.lua:1380]: in function 'install'
        [.\xmake.lua:13]: in function 'script'
        [...dir\modules\private\action\require\impl\utils\filter.lua:114]: in function 'call'
        [...\modules\private\action\require\impl\actions\install.lua:470]:

    => install glfw latest .. failed
    error: @programdir\core\main.lua:329: @programdir\modules\async\runjobs.lua:331: ...\modules\private\action\require\impl\actions\install.lua:579: install failed!
    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [...\modules\private\action\require\impl\actions\install.lua:579]: in function 'catch'
        [@programdir\core\sandbox\modules\try.lua:123]: in function 'try'
        [...\modules\private\action\require\impl\actions\install.lua:437]:
        [...modules\private\action\require\impl\install_packages.lua:510]: in function 'jobfunc'
        [@programdir\modules\async\runjobs.lua:247]:

    stack traceback:
            [C]: in function 'error'
            @programdir\core\base\os.lua:1075: in function 'base/os.raiselevel'
            (...tail calls...)
            @programdir\core\main.lua:329: in upvalue 'cotask'
            @programdir\core\base\scheduler.lua:406: in function <@programdir\core\base\scheduler.lua:399>

.. code:: bash

    xmake config --plat=linux --arch=x86_64 --toolchain=llvm --sdk=C:/dev/sysroots/deb -cvD

.. code:: bash

    checking for git ... C:\Users\cakit\scoop\shims\git.exe
    checkinfo: cannot runv(gzip.exe --version), No such file or directory
    checking for gzip ... no
    checking for 7z ... C:\Program Files\xmake\winenv\bin\7z
    C:\Users\cakit\scoop\shims\git.exe rev-parse HEAD
    checking for cl.exe ... C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.43.34808\bin\HostX64\x64\cl.exe
    checking for Microsoft Visual Studio (x64) version ... 2022
    checking for Microsoft C/C++ Compiler (x64) version ... 19.43.34810
    checking for nim ... C:\Users\cakit\scoop\shims\nim.exe
    checking for ninja ... no
    checking for ninja ... no
    checking for ninja ... no
    checking for ninja ... C:\Users\cakit\scoop\shims\ninja.exe
    checking for cmake ... no
    checking for cmake ... no
    checking for cmake ... no
    checking for cmake ... C:\Users\cakit\scoop\shims\cmake.exe
    finding glfw from xmake ..
    checking for xmake::glfw ... no
    finding glfw from vcpkg ..
    finding glfw from conan ..
    checking for glfw ... no
    note: install or modify (m) these packages (pass -y to skip confirm)?
    -> glfw latest [toolchains:"llvm"]
    please input: y (y/n/m)
    y
    checking for ninja ... C:\Users\cakit\scoop\shims\ninja.exe
    checking for clang ... C:\llvm\bin\clang.exe
    checking for the c compiler (cc) ... clang.exe
    checking for clang ... C:\llvm\bin\clang.exe
    checking for the c++ compiler (cxx) ... clang.exe
    checking for clang ... C:\llvm\bin\clang.exe
    checking for the assember (as) ... clang.exe
    checking for llvm-ar ... C:\llvm\bin\llvm-ar.exe
    checking for the static library archiver (ar) ... llvm-ar.exe
    checking for clang++ ... C:\llvm\bin\clang++.exe
    checking for the linker (ld) ... clang++.exe
    checking for llvm-ranlib ... C:\llvm\bin\llvm-ranlib.exe
    checking for the archive index generator (ranlib) ... llvm-ranlib.exe
    checking for C:\llvm\bin\clang.exe ... ok
    checking for flags (-fPIC) ... no
    > clang.exe "-fPIC" "-Qunused-arguments" "-m64"
    checkinfo: @programdir\core\sandbox\modules\os.lua:273: clang: error: unsupported option '-fPIC' for target 'x86_64-pc-windows-msvc'

    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:273]: in function 'runv'
        [@programdir\modules\core\tools\gcc\has_flags.lua:42]:
    checking for flags (-fPIC) ... no
    > clang.exe "-fPIC" "-Qunused-arguments" "-m64"
    checkinfo: @programdir\core\sandbox\modules\os.lua:273: clang: error: unsupported option '-fPIC' for target 'x86_64-pc-windows-msvc'

    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:273]: in function 'runv'
        [@programdir\modules\core\tools\gcc\has_flags.lua:42]:
    checking for flags (-fPIC) ... ok
    > clang.exe "-fPIC" "-Qunused-arguments" "-m64"
    checking for C:\llvm\bin\clang++.exe ... ok
    checking for flags (-fPIC) ... no
    > clang++.exe "-fPIC" "-m64" "-m64"
    checkinfo: @programdir\core\sandbox\modules\os.lua:273: clang++: warning: treating 'c' input as 'c++' when in C++ mode, this behavior is deprecated [-Wdeprecated]
    clang++: error: unsupported option '-fPIC' for target 'x86_64-pc-windows-msvc'

    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:273]: in function 'runv'
        [@programdir\modules\core\tools\gcc\has_flags.lua:42]:
    checking for clang++ ... C:\llvm\bin\clang++.exe
    checking for the shared library linker (sh) ... clang++.exe
    checking for flags (-fPIC) ... no
    > clang++.exe "-fPIC" "-shared" "-m64" "-m64"
    checkinfo: @programdir\core\sandbox\modules\os.lua:273: clang++: warning: treating 'c' input as 'c++' when in C++ mode, this behavior is deprecated [-Wdeprecated]
    clang++: error: unsupported option '-fPIC' for target 'x86_64-pc-windows-msvc'

    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:273]: in function 'runv'
        [@programdir\modules\core\tools\gcc\has_flags.lua:42]:
    checking for cmake ... C:\Users\cakit\scoop\shims\cmake.exe
    C:\Users\cakit\scoop\shims\cmake.exe -DGLFW_BUILD_DOCS=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=C:\Users\cakit\Desktop\ex3\build\.packages\g\glfw\latest\00c4b83070f6435aa611d0b42c91d0e5 -DCMAKE_INSTALL_LIBDIR:PATH=lib -G Ninja -DCMAKE_MAKE_PROGRAM=C:\Users\cakit\scoop\shims\ninja.exe -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DCMAKE_STATIC_LINKER_FLAGS= -DCMAKE_MODULE_LINKER_FLAGS=-m64 -DBUILD_SHARED_LIBS=OFF -DCMAKE_AR=C:/llvm/bin/llvm-ar.exe -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=BOTH -DCMAKE_CXX_COMPILER=C:/llvm/bin/clang++.exe -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER -DCMAKE_ASM_FLAGS=-m64 -DCMAKE_FIND_USE_INSTALL_PREFIX=0 -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=0 -DCMAKE_EXE_LINKER_FLAGS=-m64 -DCMAKE_OSX_SYSROOT= -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=BOTH -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=BOTH -DCMAKE_SHARED_LINKER_FLAGS=-m64 -DCMAKE_FIND_ROOT_PATH=C:/dev/sysroots/deb -DCMAKE_SYSTEM_PROCESSOR=x86_64 -DHAVE_FLAG_SEARCH_PATHS_FIRST=0 -DCMAKE_C_COMPILER=C:/llvm/bin/clang.exe "-DCMAKE_CXX_LINK_EXECUTABLE=C:/llvm/bin/clang++.exe <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>" -DCMAKE_ASM_COMPILER=C:/llvm/bin/clang.exe -DCMAKE_CXX_FLAGS=-m64 -DCMAKE_C_FLAGS=-m64 -DCMAKE_RANLIB=C:/llvm/bin/llvm-ranlib.exe -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_CXX_FLAGS_RELEASE=-m64 -DCMAKE_STATIC_LINKER_FLAGS_RELEASE= -DCMAKE_SHARED_LINKER_FLAGS_RELEASE=-m64 -DCMAKE_EXE_LINKER_FLAGS_RELEASE=-m64 -DCMAKE_C_FLAGS_RELEASE=-m64 C:\Users\cakit\Desktop\ex3\glfw
    -- The C compiler identification is Clang 21.0.0 with GNU-like command-line
    -- Detecting C compiler ABI info
    -- Detecting C compiler ABI info - done
    -- Check for working C compiler: C:/llvm/bin/clang.exe - skipped
    -- Detecting C compile features
    -- Detecting C compile features - done
    -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
    -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Failed
    -- Looking for pthread_create in pthreads
    -- Looking for pthread_create in pthreads - not found
    -- Looking for pthread_create in pthread
    -- Looking for pthread_create in pthread - not found
    -- Check if compiler accepts -pthread
    -- Check if compiler accepts -pthread - no
    CMake Error at C:/Users/cakit/scoop/apps/cmake/current/share/cmake-4.0/Modules/FindPackageHandleStandardArgs.cmake:227 (message):
    Could NOT find Threads (missing: Threads_FOUND)
    Call Stack (most recent call first):
    C:/Users/cakit/scoop/apps/cmake/current/share/cmake-4.0/Modules/FindPackageHandleStandardArgs.cmake:591 (_FPHSA_FAILURE_MESSAGE)
    C:/Users/cakit/scoop/apps/cmake/current/share/cmake-4.0/Modules/FindThreads.cmake:226 (find_package_handle_standard_args)
    CMakeLists.txt:60 (find_package)


    -- Configuring incomplete, errors occurred!
    error: @programdir\core\sandbox\modules\os.lua:378: execv(C:\Users\cakit\scoop\shims\cmake.exe -DGLFW_BUILD_DOCS=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_EXAMPLES=OFF -DCMAKE_INSTALL_PREFIX=C:\Users\cakit\Desktop\ex3\build\.packages\g\glfw\latest\00c4b83070f6435aa611d0b42c91d0e5 -DCMAKE_INSTALL_LIBDIR:PATH=lib -G Ninja -DCMAKE_MAKE_PROGRAM=C:\Users\cakit\scoop\shims\ninja.exe -DCMAKE_POSITION_INDEPENDENT_CODE=ON -DCMAKE_STATIC_LINKER_FLAGS= -DCMAKE_MODULE_LINKER_FLAGS=-m64 -DBUILD_SHARED_LIBS=OFF -DCMAKE_AR=C:/llvm/bin/llvm-ar.exe -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=BOTH -DCMAKE_CXX_COMPILER=C:/llvm/bin/clang++.exe -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER -DCMAKE_ASM_FLAGS=-m64 -DCMAKE_FIND_USE_INSTALL_PREFIX=0 -DCMAKE_SYSTEM_NAME=Linux -DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=0 -DCMAKE_EXE_LINKER_FLAGS=-m64 -DCMAKE_OSX_SYSROOT= -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=BOTH -DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE=BOTH -DCMAKE_SHARED_LINKER_FLAGS=-m64 -DCMAKE_FIND_ROOT_PATH=C:/dev/sysroots/deb -DCMAKE_SYSTEM_PROCESSOR=x86_64 -DHAVE_FLAG_SEARCH_PATHS_FIRST=0 -DCMAKE_C_COMPILER=C:/llvm/bin/clang.exe "-DCMAKE_CXX_LINK_EXECUTABLE=C:/llvm/bin/clang++.exe <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>" -DCMAKE_ASM_COMPILER=C:/llvm/bin/clang.exe -DCMAKE_CXX_FLAGS=-m64 -DCMAKE_C_FLAGS=-m64 -DCMAKE_RANLIB=C:/llvm/bin/llvm-ranlib.exe -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_CXX_FLAGS_RELEASE=-m64 -DCMAKE_STATIC_LINKER_FLAGS_RELEASE= -DCMAKE_SHARED_LINKER_FLAGS_RELEASE=-m64 -DCMAKE_EXE_LINKER_FLAGS_RELEASE=-m64 -DCMAKE_C_FLAGS_RELEASE=-m64 C:\Users\cakit\Desktop\ex3\glfw) failed(1)
    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\core\sandbox\modules\os.lua:378]:
        [@programdir\core\sandbox\modules\os.lua:291]: in function 'vrunv'
        [@programdir\modules\package\tools\cmake.lua:1338]: in function 'configure'
        [@programdir\modules\package\tools\cmake.lua:1380]: in function 'install'
        [.\xmake.lua:13]: in function 'script'
        [...dir\modules\private\action\require\impl\utils\filter.lua:114]: in function 'call'
        [...\modules\private\action\require\impl\actions\install.lua:470]:

    => install glfw latest .. failed
    error: @programdir\core\main.lua:329: @programdir\modules\async\runjobs.lua:331: ...\modules\private\action\require\impl\actions\install.lua:579: install failed!
    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [...\modules\private\action\require\impl\actions\install.lua:579]: in function 'catch'
        [@programdir\core\sandbox\modules\try.lua:123]: in function 'try'
        [...\modules\private\action\require\impl\actions\install.lua:437]:
        [...modules\private\action\require\impl\install_packages.lua:510]: in function 'jobfunc'
        [@programdir\modules\async\runjobs.lua:247]:

    stack traceback:
            [C]: in function 'error'
            @programdir\core\base\os.lua:1075: in function 'base/os.raiselevel'
            (...tail calls...)
            @programdir\core\main.lua:329: in upvalue 'cotask'
            @programdir\core\base\scheduler.lua:406: in function <@programdir\core\base\scheduler.lua:399>
