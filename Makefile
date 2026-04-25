PREFIX ?= $(HOME)/.local
BINDIR := $(PREFIX)/bin
APPDIR := $(PREFIX)/share/applications
ICONDIR := $(PREFIX)/share/icons/hicolor/scalable/apps
APP_ID := dev.rifuki.FloatingScreenshot

.PHONY: install uninstall check

install:
	install -Dm755 bin/floating-screenshot "$(BINDIR)/floating-screenshot"
	install -Dm644 share/icons/hicolor/scalable/apps/$(APP_ID).svg "$(ICONDIR)/$(APP_ID).svg"
	mkdir -p "$(APPDIR)"
	sed "s|@PREFIX@|$(PREFIX)|g" share/applications/$(APP_ID).desktop.in > "$(APPDIR)/$(APP_ID).desktop"
	chmod 644 "$(APPDIR)/$(APP_ID).desktop"
	-command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$(APPDIR)"

uninstall:
	rm -f "$(BINDIR)/floating-screenshot"
	rm -f "$(APPDIR)/$(APP_ID).desktop"
	rm -f "$(ICONDIR)/$(APP_ID).svg"
	-command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$(APPDIR)"

check:
	python3 -m py_compile bin/floating-screenshot
	tmp=$$(mktemp --suffix=.desktop); \
	sed "s|@PREFIX@|$(PREFIX)|g" share/applications/$(APP_ID).desktop.in > "$$tmp"; \
	if command -v desktop-file-validate >/dev/null 2>&1; then desktop-file-validate "$$tmp"; fi; \
	rm -f "$$tmp"
