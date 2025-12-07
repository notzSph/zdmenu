# zDmenu

![Version](https://img.shields.io/badge/version-5.4.0-blue)
![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![Language](https://img.shields.io/badge/language-C-cyan)
![Display](https://img.shields.io/badge/display-X11-lightgrey)
![License](https://img.shields.io/badge/license-MIT--X-lightgrey)


## Description

`zDmenu` is a personal fork of [dmenu](https://tools.suckless.org/dmenu/),  
a fast and efficient dynamic menu for X.

Like upstream dmenu, it:

- Reads newline-separated items from **stdin**
- Lets you fuzzy/select with the keyboard
- Prints the selected item to **stdout**

This fork keeps the original suckless minimalism but is branded and configured
to fit alongside `zDwm` in your setup.

---

## Requirements

To build `zDmenu` you need:

- Xlib development headers (`libX11`)
- Xft development headers (`libXft`)
- Xinerama headers (`libXinerama`) if Xinerama is enabled in `config.mk`

On most distros, just install the X11/Xft dev packages from your package
manager.

---

## Installation

Edit `config.mk` to match your environment (prefix, manpath, X11 paths, etc.):

```sh
PREFIX    = /usr/local
MANPREFIX = $(PREFIX)/share/man
VERSION   = 5.4
# ...
