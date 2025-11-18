# meta-cronos

This README provides an overview of the `meta-cronos` layer for the Cronos v2 project.

It contains information on layer contents, dependencies, maintainership, and usage instructions.

---

## Dependencies

The `meta-cronos` layer depends on the following super-repo:

- URI: [https://github.com/asmc-waltz/cronos_super](https://github.com/asmc-waltz/cronos_super)
- Branch: `master` (or the branch corresponding to your Yocto Scarthgap build)

This layer also requires the standard Yocto layers:

- `poky` (Scarthgap branch)
- `meta-openembedded/meta-oe`
- `meta-openembedded/meta-python`
- `meta-openembedded/meta-networking`
- `meta-openembedded/meta-filesystems`
- `meta-rockchip` (Scarthgap branch)
- Optional: `meta-clang` if building with Clang support

---

## Patches

Please submit any patches against `meta-cronos` to the Cronos development mailing list:

- Maintainer: **Phuong Nguyen <phuongnguyen0793@outlook.com>**

---

## Table of Contents

1. [Adding the meta-cronos layer to your build](#adding-the-meta-cronos-layer-to-your-build)  
2. [Contents of the meta-cronos layer](#contents-of-the-meta-cronos-layer)  
3. [Miscellaneous](#miscellaneous)

---

## Adding the meta-cronos layer to your build

From your Yocto build environment:

```bash
bitbake-layers add-layer path/to/meta-cronos
