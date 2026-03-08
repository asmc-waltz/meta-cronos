SUMMARY = "LVGL wrapper library for the Cronos UI system"
DESCRIPTION = "libcrobj provides an abstraction layer for UI object and layout management on Cronos, built on top of LVGL."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

inherit cmake pkgconfig

# Dependencies
DEPENDS = "lvgl libdrm"

# SRC_URI = " \
#     git://github.com/asmc-waltz/libcrobj.git;protocol=https;branch=master \
# "

SRC_URI = " \
    git:///${TOPDIR}/share/src/libcrobj;protocol=file;branch=master \
"

SRCREV = "${AUTOREV}"

python do_display_banner() {
    bb.plain("********************************************")
    bb.plain("*        Building: libcrobj (Cronos)        *")
    bb.plain("********************************************")
}

# Working source directory
S = "${WORKDIR}/git"

# Extra CMake configuration flags
EXTRA_OECMAKE += "-DENABLE_LVGL_BACKEND=ON"
EXTRA_OECMAKE += "-DCMAKE_INSTALL_PREFIX=/usr"
EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=lib"

# Build banner (for clarity in logs)
addtask display_banner before do_fetch

SYSROOT_DIRS += "${libdir}/pkgconfig"
FILES:${PN} += "${libdir}/libcrobj.so*"
FILES:${PN}-dev += "${includedir}/crobj/*.h"
FILES:${PN}-dev += "${libdir}/pkgconfig/libcrobj.pc"
INSANE_SKIP:${PN} += "dev-so"
