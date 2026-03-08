SUMMARY = "Cronos: Mesa configuration override"

inherit pkgconfig

PACKAGECONFIG:append = " egl"
PACKAGECONFIG:append = " gles"
PACKAGECONFIG:append = " gbm"
PACKAGECONFIG:append = " kmsro"
PACKAGECONFIG:append = " panfrost"

python do_display_banner() {
    bb.plain("******************************************")
    bb.plain("* Cronos: --- Custom Mesa configuration --- *")
    bb.plain("******************************************")
}

addtask display_banner before do_build
