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
