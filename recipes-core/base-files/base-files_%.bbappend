SUMMARY = "Cronos: Custom base-files and input for profile.d"
DESCRIPTION = "Provides custom base files and profile.d scripts for Cronos embedded system."

# Extra files path
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Source files to install
SRC_URI += " \
    file://console.sh \
    file://network.sh \
"

# Display banner during build
python do_display_banner() {
    bb.plain("*******************************************************")
    bb.plain("* Cronos: --- Custom base-files configuration --- *")
    bb.plain("*******************************************************")
}

# Installation into profile.d
do_install:append:stm32mpcommon() {
    install -d ${D}${sysconfdir}/profile.d
    install -m 0644 ${WORKDIR}/console.sh ${D}${sysconfdir}/profile.d/console.sh
    install -m 0644 ${WORKDIR}/network.sh ${D}${sysconfdir}/profile.d/network.sh
}

# Add task dependency
addtask display_banner before do_build
