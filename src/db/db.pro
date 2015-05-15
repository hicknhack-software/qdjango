TEMPLATE = lib
CONFIG += DLL
QT -= gui
QT += sql

DEFINES += QDJANGO_DB_BUILD
DEFINES += QDJANGO_SHARED

TARGET = qdjango-db

isEmpty(PROJECT_ROOT): PROJECT_ROOT = $$OUT_PWD/fake

win32:CONFIG(release, debug|release): DESTDIR = $$PROJECT_ROOT/../Release
else:win32:CONFIG(debug, debug|release): DESTDIR = $$PROJECT_ROOT/../Debug

HEADERS += \
    QDjango.h \
    QDjango_p.h \
    QDjangoMetaModel.h \
    QDjangoModel.h \
    QDjangoQuerySet.h \
    QDjangoQuerySet_p.h \
    QDjangoWhere.h \
    QDjangoWhere_p.h

SOURCES += \
    QDjango.cpp \
    QDjangoMetaModel.cpp \
    QDjangoModel.cpp \
    QDjangoQuerySet.cpp \
    QDjangoWhere.cpp
