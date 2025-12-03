SUMMARY = "Cronos: Hostapd module"
DESCRIPTION = "Provides custom Hostapd configuration for the Cronos system"

# Extra file search paths for Cronos
FILESEXTRAPATHS:append := "${THISDIR}/files:"

# Display Cronos banner during build
python do_display_banner() {
    bb.plain("********************************************************")
    bb.plain("* Cronos: --- Custom Hostapd configuration --- *")
    bb.plain("********************************************************")
}

SRC_URI += " \
    file://cronos_hostapd.conf \
    file://hostapd.service \
"

do_install:append() {
    # Install Cronos hostapd configuration
    install -d ${D}${sysconfdir}/hostapd
    install -m 0644 ${UNPACKDIR}/cronos_hostapd.conf \
        ${D}${sysconfdir}/hostapd/cronos_hostapd.conf

    # Install Cronos systemd service overrides
    install -d ${D}${systemd_unitdir}/system/
    install -m 0644 ${UNPACKDIR}/hostapd.service \
        ${D}${systemd_unitdir}/system/hostapd.service

    # Patch paths for Cronos systemd environment
    sed -i \
        -e 's,@SBINDIR@,${sbindir},g' \
        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
        ${D}${systemd_unitdir}/system/hostapd.service
}

addtask display_banner before do_build
