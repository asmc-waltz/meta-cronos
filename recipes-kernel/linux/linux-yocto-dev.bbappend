SUMMARY = "Cronos: Custom kernel fragment for Orion"
DESCRIPTION = "Provides machine-specific kernel fragment for Orion board."

# Extra files path
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Machine-specific override
SRC_URI:append:orion = " file://orion_kernel_fragment.cfg"

# Display banner during build
python do_display_banner() {
    bb.plain("*******************************************************")
    bb.plain("* Cronos: --- Custom kernel fragment configuration --- *")
    bb.plain("*******************************************************")
}

# Add task dependency
addtask display_banner before do_build
