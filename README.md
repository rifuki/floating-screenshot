# Floating Screenshot

macOS-style floating screenshot thumbnails for Linux.

Capture a screenshot, get a temporary draggable preview, drag the image into
chat/browser/email, or swipe/click the save strip to save immediately.
If you leave it alone, it auto-saves to `~/Pictures/Screenshots`.

## Features

- Draggable screenshot thumbnail for dropping into other apps.
- Swipe right or click the save strip to save immediately.
- Auto-save timeout with compact progress indicator.
- Clipboard copy for Wayland (`wl-copy`) and X11 (`xclip`).
- Wayland backend via `grim` + `slurp`.
- X11 backend via `maim`, with optional ImageMagick fallback.
- Optional fallbacks for `gnome-screenshot` and KDE Spectacle.
- User-level install with desktop launcher and app icon.

## Install

```bash
git clone https://github.com/rifuki/floating-screenshot.git
cd floating-screenshot
make install
floating-screenshot --check
```

Or:

```bash
./install.sh
```

By default it installs to `~/.local`. Override with:

```bash
make install PREFIX=/usr/local
```

## Usage

```bash
floating-screenshot --area
floating-screenshot --full
```

Recommended keybinds:

```ini
# Hyprland
bind = , Print, exec, floating-screenshot --full
bind = SHIFT, Print, exec, floating-screenshot --area
```

```ini
# Sway
bindsym Print exec floating-screenshot --full
bindsym Shift+Print exec floating-screenshot --area
```

## Runtime Options

```text
--area                 Capture selected area (default)
--full                 Capture the full screen
--backend auto         auto, grim, maim, gnome, spectacle, imagemagick
--save-dir DIR         Directory for auto-save / swipe-save
--timeout SECONDS      Seconds before auto-save
--tmp-dir DIR          Temporary screenshot directory
--cleanup-after-drag N Keep temp file for N seconds after drag
--no-clipboard         Do not copy screenshot to clipboard
--no-notify            Disable notifications
--check                Print dependency/backend status
```

## Dependencies

See [docs/dependencies.md](docs/dependencies.md).

For Hyprland/Sway/wlroots, the recommended stack is:

```bash
grim slurp wl-clipboard python3 pygobject gtk3
```

## Notes

Notification swipe-to-dismiss is controlled by the notification daemon and the
desktop environment. This app keeps its own screenshot thumbnail fast: swipe
right or click the save strip and it disappears immediately.

## License

MIT
