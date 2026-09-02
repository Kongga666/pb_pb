#!/usr/bin/env bash
set -euo pipefail

OPENCODE_VERSION="1.18.23"
OMO_VERSION="4.19.4"

echo "==> Installing opencode ${OPENCODE_VERSION} via curl..."
# curl -fsSL https://opencode.ai/install | bash -s -- --version "${OPENCODE_VERSION}"
npm config set allow-scripts=opencode-ai --location=user
npm i -g "opencode-ai@${OPENCODE_VERSION}"

# Ensure opencode is on PATH for the rest of this script
export PATH="$HOME/.opencode/bin:$PATH"

echo "==> Verifying opencode..."
opencode --version

echo ""
echo "==> Installing oh-my-openagent ${OMO_VERSION} via npx..."
npx "oh-my-openagent@${OMO_VERSION}" install \
  --no-tui \
  --platform=opencode \
  --skip-auth \
  --claude=no \
  --gemini=no \
  --copilot=no

echo ""
echo "==> Verifying oh-my-openagent..."
npx "oh-my-openagent@${OMO_VERSION}" get-local-version
npx "oh-my-openagent@${OMO_VERSION}" doctor

echo ""
echo "==> Pinning OMO version in opencode.json to prevent auto-update..."
CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/opencode.json"
if [ -f "$CONFIG_FILE" ]; then
  # Replace bare "oh-my-openagent" or "oh-my-opencode" with pinned version
  if command -v sed &>/dev/null; then
    sed -i.bak \
      -e 's/"oh-my-openagent"/"oh-my-openagent@'"${OMO_VERSION}"'"/g' \
      -e 's/"oh-my-opencode"/"oh-my-opencode@'"${OMO_VERSION}"'"/g' \
      "$CONFIG_FILE"
    rm -f "${CONFIG_FILE}.bak"
    echo "    Pinned plugin entry in ${CONFIG_FILE}"
  else
    echo "    WARNING: sed not found. Manually edit ${CONFIG_FILE}"
    echo "    and ensure the plugin entry is: \"oh-my-openagent@${OMO_VERSION}\""
  fi
else
  echo "    WARNING: ${CONFIG_FILE} not found. OMO may not be registered."
fi

echo ""
echo "==> Done. Summary:"
echo "    opencode:          $(opencode --version)"
echo "    oh-my-openagent:   ${OMO_VERSION} (pinned)"
echo ""
echo "    To prevent auto-update, always start with:"
echo "      OMO_DISABLE_AUTO_UPDATE=1 opencode"

source ~/.bashrc
