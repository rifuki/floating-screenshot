# Dependencies

Floating Screenshot is a Python GTK application that delegates screen capture
to native Linux screenshot tools.

## Required

- Python 3
- GTK 3 introspection bindings
- GdkPixbuf introspection bindings

## Recommended Wayland stack

- `grim`
- `slurp`
- `wl-clipboard`
- `dunst` or `libnotify` tools for notifications

## Recommended X11 stack

- `maim`
- `xclip`

## Gentoo

```bash
sudo emerge gui-apps/grim gui-apps/slurp gui-apps/wl-clipboard \
  x11-misc/dunst x11-libs/gtk+ x11-libs/gdk-pixbuf dev-python/pygobject
```

Optional X11 backend:

```bash
sudo emerge media-gfx/maim x11-misc/xclip
```

## Arch Linux

```bash
sudo pacman -S python-gobject gtk3 grim slurp wl-clipboard libnotify
```

Optional X11 backend:

```bash
sudo pacman -S maim xclip
```

## Debian / Ubuntu

```bash
sudo apt install python3-gi gir1.2-gtk-3.0 grim slurp wl-clipboard libnotify-bin
```

Optional X11 backend:

```bash
sudo apt install maim xclip
```

## Fedora

```bash
sudo dnf install python3-gobject gtk3 grim slurp wl-clipboard libnotify
```

Optional X11 backend:

```bash
sudo dnf install maim xclip
```
