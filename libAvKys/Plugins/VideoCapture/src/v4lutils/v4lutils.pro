# Webcamoid, webcam capture application.
# Copyright (C) 2011-2017  Gonzalo Exequiel Pedone
#
# Webcamoid is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Webcamoid is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
#
# Web-Site: http://webcamoid.github.io/

exists(akcommons.pri) {
    include(akcommons.pri)
} else {
    exists(../../../../akcommons.pri) {
        include(../../../../akcommons.pri)
    } else {
        error("akcommons.pri file not found.")
    }
}

CONFIG += plugin

HEADERS = \
    ../v4l2sys/src/plugin.h \
    ../v4l2sys/src/capturev4l2.h \
    ../v4l2sys/src/capturebuffer.h \
    ../capture.h

INCLUDEPATH += \
    ../../../../Lib/src \
    ../

LIBS += -L$${PWD}/../../../../Lib/ -l$${COMMONS_TARGET}

OTHER_FILES += pspec.json

DEFINES += HAVE_V4LUTILS
CONFIG += link_pkgconfig
PKGCONFIG += libv4l2

CONFIG(config_v4l2_extendedcontrols): DEFINES += HAVE_EXTENDEDCONTROLS

QT += qml

SOURCES = \
    ../v4l2sys/src/plugin.cpp \
    ../v4l2sys/src/capturev4l2.cpp \
    ../capture.cpp

DESTDIR = $${OUT_PWD}/../../submodules/VideoCapture

TEMPLATE = lib

INSTALLS += target

target.path = $${LIBDIR}/$${COMMONS_TARGET}/submodules/VideoCapture
