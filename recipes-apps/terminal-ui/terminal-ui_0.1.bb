SUMMARY = "Cronos: Graphical user interface"
DESCRIPTION = "Provides user interface application for Cronos embedded system"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

inherit cmake pkgconfig
DEPENDS = "libdrm lvgl libcrobj dbus"

# SRC_URI += "\
#     git://github.com/asmc-waltz/terminal-ui.git;protocol=https;branch=master \
# "

SRC_URI = " \
    git://${TOPDIR}/share/src/terminal-ui/.git;protocol=file;branch=master \
"

SRCREV = "${AUTOREV}"

python do_display_banner() {
    bb.plain("********************************************");
    bb.plain("* Cronos: --- Terminal User Interface --- *")
    bb.plain("********************************************");
}

S = "${WORKDIR}/git"

do_configure:append() {
    cmake ${S}/ \
      -DCMAKE_SYSROOT=${STAGING_DIR_HOST} \
      -DLVGL_INCLUDE_DIR=${STAGING_DIR_HOST}/usr/include/lvgl \
      -DCMAKE_LIBRARY_PATH=${STAGING_DIR_HOST}/usr/lib
}

do_compile() {
    cmake --build . --target terminal-ui
    # cmake --build . --target ui-utils
}

do_install() {
    install -d ${D}${bindir}
    install -m 755 terminal-ui ${D}${bindir}
    # install -m 755 ui-utils ${D}${bindir}

    install -d ${D}${sysconfdir}/dbus-1/system.d
    install -m 0644 ${S}/conf/com.TerminalUI.Service.conf ${D}${sysconfdir}/dbus-1/system.d/
}

addtask display_banner before do_fetch
