SUMMARY = "Cronos: Custom base-files and input for profile.d"
DESCRIPTION = "Provides custom base files and profile.d scripts for Cronos embedded system."

# Extra files path
FILESEXTRAPATHS:append := "${THISDIR}/files:"

# Source files to install
SRC_URI += " \
    file://console.sh \
    file://network.sh \
    file://10-ax210.rules \
    file://10-rtl8821.rules \
"

# Display banner during build
python do_display_banner() {
    bb.plain("*******************************************************")
    bb.plain("* Cronos: --- Custom base-files configuration --- *")
    bb.plain("*******************************************************")
}

# Installation into profile.d
do_install:append() {
    install -d ${D}${sysconfdir}/profile.d
    install -m 0644 ${UNPACKDIR}/console.sh ${D}${sysconfdir}/profile.d/console.sh
    install -m 0644 ${UNPACKDIR}/network.sh ${D}${sysconfdir}/profile.d/network.sh

    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 0644 ${UNPACKDIR}/10-ax210.rules \
        ${D}${sysconfdir}/udev/rules.d/10-ax210.rules
    install -m 0644 ${UNPACKDIR}/10-rtl8821.rules \
        ${D}${sysconfdir}/udev/rules.d/10-rtl8821.rules
}

# Add task dependency
addtask display_banner before do_build
