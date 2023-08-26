include "msdfgen"

project "msdf-atlas-gen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
	architecture "x86_64"
    configurations { "Debug", "Release", "Dist" }
    platforms { "Windows", "Linux" }
    staticruntime "off"

    dependson "msdfgen"

    objdir "build/obj/%{cfg.buildcfg}"
    targetdir "build/bin/%{cfg.buildcfg}"

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
        "freetypeg",
        "msdfgen.a"
    }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"