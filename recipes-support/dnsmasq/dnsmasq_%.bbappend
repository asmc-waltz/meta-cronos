SUMMARY = "Cronos: Custom dnsmasq configuration"
DESCRIPTION = "Provides custom dnsmasq configuration for Cronos embedded system"

# Extra files path
FILESEXTRAPATHS:append := "${THISDIR}/files:"

# Source files to install
SRC_URI += " \
    file://01-cronos-dnsmasq.conf \
"

# Display banner during build
python do_display_banner() {
    bb.plain("*********************************************")
    bb.plain("* Cronos: --- dnsmasq configuration --- *")
    bb.plain("*********************************************")
}

# Installation of configuration file
do_install:append() {
    install -d ${D}${sysconfdir}/dnsmasq.d
    install -m 0644 ${UNPACKDIR}/01-cronos-dnsmasq.conf \
        ${D}${sysconfdir}/dnsmasq.d/01-cronos-dnsmasq.conf
}

# Add task dependency
addtask display_banner before do_build
