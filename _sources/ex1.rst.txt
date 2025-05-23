###########
 Example 1
###########

XMake fails to compile the example with a compiler with sysroot provided
as flags

.. code:: lua

    toolchain("custom_llvm", function()
        set_kind("standalone")
        set_toolset("cc", "clang")
        set_toolset("cxx", "clang++")
        if is_plat("windows") then
            set_toolset("ld", "lld-link")
        elseif is_plat("linux") then
            set_toolset("ld", "ld.lld")
        elseif is_plat("macos") then
            set_toolset("ld", "ld64.lld")
        elseif is_plat("wasm") then
            set_toolset("ld", "wasm-ld")
        end
        set_toolset("ld", "lld-link")
        set_toolset("sh", "clang++")
        set_toolset("ar", "llvm-ar")
        set_toolset("ex", "llvm-ar")
        set_toolset("strip", "llvm-strip")
        set_toolset("mm", "clang")
        set_toolset("mxx", "clang++")
        set_toolset("as", "llvm-as")
        add_cxflags("--target=x86_64-pc-linux-gnu", "--sysroot=C:/devtools/sysroots/deb", "-fuse-ld=lld")
        add_ldflags("--target=x86_64-pc-linux-gnu", "--sysroot=C:/devtools/sysroots/deb", "-fuse-ld=lld")
    end)

    set_toolchains("custom_llvm")

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

   xmake config --plat=cross --cross=x86_64-pc-linux-gnu -cvD

.. code:: bash

   checking for architecture ... x86_64
   error: @programdir\core\main.lua:329: @programdir\core\tool\toolchain.lua:300: @programdir\toolchains\cross\check.lua:61: cross toolchain not found!
   stack traceback:
       [C]: in function 'error'
       [@programdir\core\base\os.lua:1075]:
       [@programdir\toolchains\cross\check.lua:61]:
       [C]: in function 'xpcall'
       [@programdir\core\base\utils.lua:246]:
       [@programdir\core\tool\toolchain.lua:296]: in function 'check'
       [@programdir\core\platform\platform.lua:276]: in function 'check'
       [@programdir\actions\config\main.lua:366]:
       [C]: in function 'xpcall'
       [@programdir\core\base\utils.lua:246]:
       [@programdir\core\base\task.lua:504]: in function 'run'
       [@programdir\core\main.lua:327]: in function 'cotask'
       [@programdir\core\base\scheduler.lua:406]:

   stack traceback:
           [C]: in function 'error'
           @programdir\core\base\os.lua:1075: in function 'base/os.raiselevel'
           (...tail calls...)
           @programdir\core\main.lua:329: in upvalue 'cotask'
           @programdir\core\base\scheduler.lua:406: in function <@programdir\core\base\scheduler.lua:399>
   PS C:\Users\cakit\Desktop\ex1>

.. code:: bash

   xmake config --plat=linux --plat=x86_64 -cvD

.. code:: bash

    checking for architecture ... x86_64
    error: @programdir\core\main.lua:329: @programdir\core\tool\toolchain.lua:300: @programdir\toolchains\cross\check.lua:61: cross toolchain not found!
    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [@programdir\toolchains\cross\check.lua:61]:
        [C]: in function 'xpcall'
        [@programdir\core\base\utils.lua:246]:
        [@programdir\core\tool\toolchain.lua:296]: in function 'check'
        [@programdir\core\platform\platform.lua:276]: in function 'check'
        [@programdir\actions\config\main.lua:366]:
        [C]: in function 'xpcall'
        [@programdir\core\base\utils.lua:246]:
        [@programdir\core\base\task.lua:504]: in function 'run'
        [@programdir\core\main.lua:327]: in function 'cotask'
        [@programdir\core\base\scheduler.lua:406]:

    stack traceback:
            [C]: in function 'error'
            @programdir\core\base\os.lua:1075: in function 'base/os.raiselevel'
            (...tail calls...)
            @programdir\core\main.lua:329: in upvalue 'cotask'
            @programdir\core\base\scheduler.lua:406: in function <@programdir\core\base\scheduler.lua:399>
    PS C:\Users\cakit\Desktop\ex1> xmake config --plat=linux --plat=x86_64 -cvD
    checking for architecture ... x64
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
    -> glfw latest [toolchains:"custom_llvm"]
    please input: y (y/n/m)
    y
    checking for ninja ... C:\Users\cakit\scoop\shims\ninja.exe
    checking for clang ... C:\llvm\bin\clang.exe
    checking for the c compiler (cc) ... clang.exe
    checking for clang++ ... C:\llvm\bin\clang++.exe
    checking for the c++ compiler (cxx) ... clang++.exe
    checking for llvm-as ... C:\llvm\bin\llvm-as.exe
    checking for the assember (as) ... llvm-as.exe
    checking for llvm-ar ... C:\llvm\bin\llvm-ar.exe
    checking for the static library archiver (ar) ... llvm-ar.exe
    checking for lld-link ... C:\llvm\bin\lld-link.exe
    checking for the linker (ld) ... lld-link.exe
    checking for C:\llvm\bin\clang.exe ... ok
    checking for flags (-fPIC) ... ok
    > clang.exe "-fPIC" "-Qunused-arguments" "--target=x86_64-pc-linux-gnu" "--sysroot=C:/devtools/sysroots/deb" "-fuse-ld=lld"
    checking for C:\llvm\bin\clang++.exe ... ok
    checking for flags (-fPIC) ... ok
    > clang++.exe "-fPIC" "-Qunused-arguments" "--target=x86_64-pc-linux-gnu" "--sysroot=C:/devtools/sysroots/deb" "-fuse-ld=lld"
    error: ...amdir\core\sandbox\modules\import\core\tool\compiler.lua:37: cannot import "core.tools.llvm_as" module!
    stack traceback:
        [C]: in function 'error'
        [@programdir\core\base\os.lua:1075]:
        [...amdir\core\sandbox\modules\import\core\tool\compiler.lua:37]: in function 'load'
        [...amdir\core\sandbox\modules\import\core\tool\compiler.lua:316]: in function 'map_flags'
        [@programdir\modules\private\utils\toolchain.lua:60]: in function 'map_compflags_for_package'
        [@programdir\modules\package\tools\cmake.lua:253]: in function '_get_asflags'
        [@programdir\modules\package\tools\cmake.lua:670]: in function '_get_configs_for_cross'
        [@programdir\modules\package\tools\cmake.lua:942]: in function '_get_configs'
        [@programdir\modules\package\tools\cmake.lua:1321]: in function 'configure'
        [@programdir\modules\package\tools\cmake.lua:1380]: in function 'install'
        [.\xmake.lua:38]: in function 'script'
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
    warning: we cannot load toolchain(zig), because it has been not checked yet!
