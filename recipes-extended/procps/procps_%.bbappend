SUMMARY = "Cronos: Custom procps/sysctl configuration"
DESCRIPTION = "Provides custom sysctl configuration for Cronos embedded system"

# Extra files path
FILESEXTRAPATHS:append := "${THISDIR}/files:"

# Source files to install
SRC_URI += " \
    file://99-cronos-sysctl.conf \
"

# Display banner during build
python do_display_banner() {
    bb.plain("*********************************************")
    bb.plain("* Cronos: --- Custom procps configuration --- *")
    bb.plain("*********************************************")
}

# Installation into /etc/sysctl.d
do_install:append() {
    install -d ${D}${sysconfdir}/sysctl.d
    install -m 0644 ${UNPACKDIR}/99-cronos-sysctl.conf \
        ${D}${sysconfdir}/sysctl.d/99-cronos-sysctl.conf
}

# Ensure banner is displayed before build
addtask display_banner before do_build
