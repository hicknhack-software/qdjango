Project {
    minimumQbsVersion: "3.0.0"

    Library {
        property string productInstallPrefix: project.projectRoot !== undefined ? project.projectRoot : ""

        Depends { name: "cpp" }
        cpp.defines: [
            "QDJANGO_DB_BUILD",
            isDynamicLibrary ? "QDJANGO_SHARED" : "QDJANGO_STATIC"
        ]

        Depends { name: "Qt"; submodules: "sql" }

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installPrefix: productInstallPrefix
        }

        files: [
            "QDjango.cpp",
            "QDjango.h",
            "QDjangoMetaModel.cpp",
            "QDjangoMetaModel.h",
            "QDjangoModel.cpp",
            "QDjangoModel.h",
            "QDjangoQuerySet.cpp",
            "QDjangoQuerySet.h",
            "QDjangoQuerySet_p.h",
            "QDjangoWhere.cpp",
            "QDjangoWhere.h",
            "QDjangoWhere_p.h",
            "QDjango_p.h",
        ]

        targetName: "qdjango-db"
        type: qbs.targetOS.includes("android") ? "staticlibrary" : "dynamiclibrary"

        Export {
            Depends { name: "cpp" }
            cpp.cxxLanguageVersion: "c++20"
            cpp.includePaths: exportingProduct.sourceDirectory

            Depends { name: "Qt"; submodules: "sql" }
        }
    }
}
