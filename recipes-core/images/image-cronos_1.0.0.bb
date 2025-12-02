SUMMARY = "Cronos v2 full-image for Orange Pi 5 Plus HW with UI, system manager"
inherit core-image

#------------------------------- Init system -----------------------------------
INIT_MANAGER = "systemd"
IMAGE_INSTALL += " systemd"

#------------------------------ Device manager ---------------------------------
USE_DEVFS = "1"
VIRTUAL-RUNTIME_dev_manager = "udev"

#------------------------------ Kernel -----------------------------------------
IMAGE_INSTALL += " \
    kernel-modules \
"

#------------------------------ Library -----------------------------------------
IMAGE_INSTALL += " alsa-lib"
IMAGE_INSTALL += " libdrm"
IMAGE_INSTALL += " libgpiod"

#------------------------------ Network ----------------------------------------
IMAGE_INSTALL += " \
    openssh \
    modemmanager \
    networkmanager \
    curl \
    iw \
    wpa-supplicant \
    ethtool \
    net-tools \
    traceroute \
    iproute2 \
    iptables \
    hostapd \
    linux-firmware-rtl8821 \
    linux-firmware-iwlwifi \
"

#------------------------------ Network ----------------------------------------
IMAGE_INSTALL += " \
    bluez5 \
"

#-------------------------- Location - Time ------------------------------------
IMAGE_INSTALL += " \
    ntp \
    ntpq \
    gpsd \
    gps-utils \
"

#------------------------------ Audio -------------------------------------------
IMAGE_INSTALL += " \
    alsa-tools \
    alsa-utils \
"

#------------------------------ Storage -----------------------------------------
IMAGE_INSTALL += " mmc-utils"

#------------------------------ Editor ------------------------------------------
IMAGE_INSTALL += " vim"

#------------------------------ Tools -------------------------------------------
# Replace busybox with coreutils (which includes full 'ls', 'cp', etc.)
IMAGE_INSTALL += " coreutils"
# A suite of basic system administration utilities
IMAGE_INSTALL += " util-linux"
# Replace busybox ps with procps
IMAGE_INSTALL += " procps"
IMAGE_INSTALL += " lsof"
IMAGE_INSTALL += " sudo"

IMAGE_INSTALL += " rfkill"
IMAGE_INSTALL += " lrzsz"
IMAGE_INSTALL += " i2c-tools"
IMAGE_INSTALL += " spidev-test"
IMAGE_INSTALL += " usbutils"
IMAGE_INSTALL += " evtest"
IMAGE_INSTALL += " pciutils"

#------------------------------ GUI package -------------------------------------
IMAGE_INSTALL += " lvgl"

#------------------------------ User Application --------------------------------
# IMAGE_INSTALL += " terminal-ui"
# IMAGE_INSTALL += " sys-mgr"

#------------------------------ Dev - Debug tools -------------------------------
IMAGE_INSTALL += " strace"
# IMAGE_INSTALL += " make"
# IMAGE_INSTALL += " gcc"
# IMAGE_INSTALL += " gdb"
# IMAGE_INSTALL += " evtest"
# IMAGE_INSTALL += " binutils"
# IMAGE_INSTALL += " glibc glibc-dev"
# IMAGE_INSTALL += " libgcc libgcc-dev"
