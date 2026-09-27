#!/bin/bash
# Retro Pack extras: the screensaver hook, and the boot splash (sudo) if you ask.
#   ~/.config/omarchy/themes/phosphor-green/extras/install-extras.sh [--boot]
set -euo pipefail
cd "$(dirname "$0")"

omarchy hook install theme-set hooks/squatchware-screensaver >/dev/null
# the theme was already set when it was installed, so run the hook once for the current one
hooks/squatchware-screensaver "$(omarchy theme current | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"
echo "Screensaver hook installed: it follows whichever theme is active."

if [[ ${1:-} == --boot ]]; then
  omarchy plymouth set by theme phosphor-green
  echo "Boot splash set. Run 'omarchy plymouth set by theme <name>' to change it again."
else
  echo "For the boot splash too (sudo): $0 --boot"
fi
