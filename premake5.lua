include "msdfgen"

project "msdf-atlas-gen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
	architecture "x86_64"
    configurations { "Debug", "Release", "Dist" }
    platforms { "Windows", "Linux" }
	staticruntime "on"

    dependson "msdfgen"

    objdir "build/obj/%{cfg.buildcfg}"
    targetdir "build/bin/%{cfg.buildcfg}"

    defines
    {
        "D_CRT_SECURE_NO_WARNINGS",
    }

    files
    {
        "msdf-atlas-gen/*.h",
        "msdf-atlas-gen/*.hpp",
        "msdf-atlas-gen/*.cpp"
    }

    includedirs
    {
        "msdf-atlas-gen/",
        "msdfgen/",
        "msdfgen/include/"
    }

    links
    {
        "msdfgen"
    }
    buildoptions { "/MP" }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Distribution"
		defines "DISTRIBUTION"
		runtime "Release"
		optimize "on"