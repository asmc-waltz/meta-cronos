SUMMARY = "Cronos: System manager"
DESCRIPTION = "Provides system manager application for Cronos embedded system"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

inherit cmake pkgconfig
DEPENDS = "dbus networkmanager glib-2.0 alsa-lib"

# SRC_URI = "\
#     git://github.com/asmc-waltz/sys-mgr.git;protocol=https;branch=master \
# "

SRC_URI = " \
    git://${TOPDIR}/share/src/sys-mgr/.git;protocol=file;branch=master \
"

SRCREV = "${AUTOREV}"

python do_display_banner() {
    bb.plain("********************************************");
    bb.plain("* Cronos: -------- System Manager --------- *")
    bb.plain("********************************************");
}

# Working source directory
S = "${WORKDIR}/git"

do_configure:append() {
    cmake ${S}/ \
      -DCMAKE_SYSROOT=${STAGING_DIR_HOST} \
      -DCMAKE_LIBRARY_PATH=${STAGING_DIR_HOST}/usr/lib
}

do_compile() {
    cmake --build . --target sys-mgr
    # cmake --build . --target sys-utils
}

do_install() {
    install -d ${D}${bindir}
    install -m 755 sys-mgr ${D}${bindir}
    # install -m 755 sys-utils ${D}${bindir}

    install -d ${D}${sysconfdir}/dbus-1/system.d
    install -m 0644 ${S}/conf/com.SystemManager.Service.conf ${D}${sysconfdir}/dbus-1/system.d/
}

addtask display_banner before do_build
