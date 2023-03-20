TEMPLATE = lib
TARGET = QSsh

QT += gui network widgets
DEFINES += QTCSSH_LIBRARY
DEFINES += UTILS_LIBRARY

CONFIG(debug, debug | release){
    TARGET = QSshd
}
else {
    TARGET = QSsh
}
INCLUDEPATH += ./
CONFIG += console c++17
DEFINES += QTCREATOR_UTILS_STATIC_LIB
SOURCES = \
    sftpdefs.cpp \
    sftpfilesystemmodel.cpp \
    sftpsession.cpp \
    sftptransfer.cpp \
    sshconnection.cpp \
    sshconnectionmanager.cpp \
    sshkeycreationdialog.cpp \
    sshlogging.cpp \
    sshprocess.cpp \
    sshremoteprocess.cpp \
    sshremoteprocessrunner.cpp \
    sshsettings.cpp \
    utils/camelcasecursor.cpp \
    utils/completinglineedit.cpp \
    utils/environment.cpp \
    utils/execmenu.cpp \
    utils/fancylineedit.cpp \
    utils/filesystemwatcher.cpp \
    utils/fileutils.cpp \
    utils/globalfilechangeblocker.cpp \
    utils/historycompleter.cpp \
    utils/hostosinfo.cpp \
    utils/icon.cpp \
    utils/macroexpander.cpp \
    utils/namevaluedictionary.cpp \
    utils/namevalueitem.cpp \
    utils/pathchooser.cpp \
    utils/qtcassert.cpp \
    utils/qtcprocess.cpp \
    utils/savefile.cpp \
    utils/stringutils.cpp \
    utils/stylehelper.cpp \
    utils/synchronousprocess.cpp \
    utils/theme/theme.cpp \
    utils/utilsicons.cpp

HEADERS = \
    sftpdefs.h \
    sftpfilesystemmodel.h \
    sftpsession.h \
    sftptransfer.h \
    sshconnection.h \
    sshconnectionmanager.h \
    sshkeycreationdialog.h \
    sshlogging_p.h \
    sshprocess.h \
    sshremoteprocess.h \
    sshremoteprocessrunner.h \
    sshsettings.h \
    ssh_global.h \
    utils/algorithm.h \
    utils/camelcasecursor.h \
    utils/completinglineedit.h \
    utils/environment.h \
    utils/environmentfwd.h \
    utils/execmenu.h \
    utils/executeondestruction.h \
    utils/fancylineedit.h \
    utils/filesystemwatcher.h \
    utils/fileutils.h \
    utils/globalfilechangeblocker.h \
    utils/historycompleter.h \
    utils/hostosinfo.h \
    utils/icon.h \
    utils/macroexpander.h \
    utils/namevaluedictionary.h \
    utils/namevalueitem.h \
    utils/optional.h \
    utils/osspecificaspects.h \
    utils/pathchooser.h \
    utils/porting.h \
    utils/predicates.h \
    utils/qtcassert.h \
    utils/qtcprocess.h \
    utils/savefile.h \
    utils/stringutils.h \
    utils/stylehelper.h \
    utils/synchronousprocess.h \
    utils/theme/theme.h \
    utils/utils_global.h \
    utils/utilsicons.h

FORMS = $$PWD/sshkeycreationdialog.ui

RESOURCES += $$PWD/ssh.qrc
