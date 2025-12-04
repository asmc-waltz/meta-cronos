SUMMARY = "Cronos: Custom NetworkManager configuration"
DESCRIPTION = "Provides custom NetworkManager configs for Cronos embedded system"

# Extra files path
FILESEXTRAPATHS:append := "${THISDIR}/files:"

# Source files to install
SRC_URI += " \
    file://dispatcher.d/90-firewall \
    file://conf.d/99-unmanaged-devices.conf \
    file://system-connections/br0.nmconnection \
    file://system-connections/eth0.nmconnection \
    file://system-connections/vlan0.nmconnection \
    file://system-connections/eth1.nmconnection \
    file://system-connections/vlan1.nmconnection \
    file://system-connections/wlan0-uplink.nmconnection \
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
    install -d ${D}${sysconfdir}/NetworkManager/dispatcher.d
    install -m 0744 ${UNPACKDIR}/dispatcher.d/90-firewall \
        ${D}${sysconfdir}/NetworkManager/dispatcher.d/90-firewall

    install -d ${D}${sysconfdir}/NetworkManager/conf.d
    install -m 0644 ${UNPACKDIR}/conf.d/99-unmanaged-devices.conf \
        ${D}${sysconfdir}/NetworkManager/conf.d/99-unmanaged-devices.conf

    install -d ${D}${sysconfdir}/NetworkManager/system-connections
    install -m 0600 ${UNPACKDIR}/system-connections/br0.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/br0.nmconnection

    install -m 0600 ${UNPACKDIR}/system-connections/eth0.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/eth0.nmconnection
    install -m 0600 ${UNPACKDIR}/system-connections/vlan0.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/vlan0.nmconnection

    install -m 0600 ${UNPACKDIR}/system-connections/eth1.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/eth1.nmconnection
    install -m 0600 ${UNPACKDIR}/system-connections/vlan1.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/vlan1.nmconnection

    install -m 0600 ${UNPACKDIR}/system-connections/wlan0-uplink.nmconnection \
        ${D}${sysconfdir}/NetworkManager/system-connections/wlan0-uplink.nmconnection
}

# Add task dependency
addtask display_banner before do_build
