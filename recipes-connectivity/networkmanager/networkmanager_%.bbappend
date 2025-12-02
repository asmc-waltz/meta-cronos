SUMMARY = "Cronos: Custom NetworkManager configuration"
DESCRIPTION = "Provides custom NetworkManager configs for Cronos embedded system"

# Extra files path
FILESEXTRAPATHS:append := "${THISDIR}/files:"

# Source files to install
SRC_URI += " \
    file://99-unmanaged-devices.conf \
    file://br0.nmconnection \
    file://eth0.nmconnection \
    file://eth1.nmconnection \
    file://uplink-wifi.nmconnection \
"

# Enable optional NetworkManager features
PACKAGECONFIG:append:pn-networkmanager = " modemmanager"
PACKAGECONFIG:append:pn-networkmanager = " wwan"
PACKAGECONFIG:append:pn-networkmanager = " wifi"

# Display banner during build
python do_display_banner() {
    bb.plain("*******************************************************")
    bb.plain("* Cronos: --- NetworkManager configuration --- *")
    bb.plain("*******************************************************")
}

# Installation of configuration files
do_install:append() {
    install -d ${D}${sysconfdir}/NetworkManager/conf.d
    install -m 0644 ${UNPACKDIR}/99-unmanaged-devices.conf \
        ${D}${sysconfdir}/NetworkManager/conf.d/99-unmanaged-devices.conf

    install -d ${D}${sysconfdir}/NetworkManager/system-connections
    install -m 0600 ${UNPACKDIR}/br0.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/br0.nmconnection
    install -m 0600 ${UNPACKDIR}/eth0.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/eth0.nmconnection
    install -m 0600 ${UNPACKDIR}/eth1.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/eth1.nmconnection
    install -m 0600 ${UNPACKDIR}/uplink-wifi.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/uplink-wifi.nmconnection
}

# Add task dependency
addtask display_banner before do_build
