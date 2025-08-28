Project {
    property string installPrefix: ""

    minimumQbsVersion: "3.0.0"

    Library {
        readonly property var cppDefines: isDynamicLibrary ? ["QDJANGO_SHARED"] : [];

        Depends { name: "cpp" }
        cpp.defines: cppDefines.concat(["QDJANGO_DB_BUILD"])

        Depends { name: "Qt"; submodules: "sql" }

        Group {
            fileTagsFilter: product.type
            qbs.install: true
            qbs.installPrefix: project.installPrefix
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
            cpp.defines: exportingProduct.cppDefines
            cpp.includePaths: exportingProduct.sourceDirectory

            Depends { name: "Qt"; submodules: "sql" }
        }
    }
}
