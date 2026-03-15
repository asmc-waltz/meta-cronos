SUMMARY = "Cronos: Custom Linux kernel mainline fragment for Orion"
DESCRIPTION = "Provides machine-specific kernel fragment for Orion board."

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE:orion= "orion"

SRC_URI:append = " file://rockchip-kmeta;type=kmeta;name=rockchip-kmeta;destsuffix=rockchip-kmeta"
SRC_URI:append:orion = " file://orion_kernel_fragment.cfg"

do_kernel_configcheck[noexec] = "1"

# Display banner during build
python do_display_banner() {
    bb.plain("****************************************************************")
    bb.plain("* Cronos: --- Linux kernel mainline fragment configuration --- *")
    bb.plain("****************************************************************")
}

# Add task dependency
addtask display_banner before do_build
