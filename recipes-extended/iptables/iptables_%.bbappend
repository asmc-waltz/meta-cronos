SUMMARY = "Cronos: Custom iptables configuration"
DESCRIPTION = "Provides custom iptables rules for Cronos embedded system"

# Extra files path for Cronos
FILESEXTRAPATHS:append := "${THISDIR}/files:"

# Display banner during Cronos build
python do_display_banner() {
    bb.plain("**********************************************")
    bb.plain("* Cronos: --- iptables configuration --- *")
    bb.plain("**********************************************")
}

# Source files to install for Cronos
SRC_URI += " \
    file://iptables_v4.rules \
"

# Install iptables rules for Cronos
do_install:append() {
    install -d ${D}${sysconfdir}/iptables
    install -m 0644 ${UNPACKDIR}/iptables_v4.rules \
        ${D}${sysconfdir}/iptables/iptables_v4.rules
}

# Add task dependency in Cronos build
addtask display_banner before do_build
