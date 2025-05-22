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
    add_cxflags("-fuse-ld=lld")
    add_ldflags("-fuse-ld=lld")
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
