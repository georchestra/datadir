#!/bin/sh

# To be properly executed during initialization, this file needs the +x flag,
# so you need to add it with chmod and commit/push it
prop() {
    variable=$(grep "^${1}=" /etc/georchestra/default.properties 2>/dev/null)
    if [ -z "$variable" ]; then
        echo "$2"
    else
        echo "${variable#*=}"
    fi
}

STYLESHEET=$(prop "georchestraStylesheet" "")
SCRIPT=$(prop "headerScript" "https://cdn.jsdelivr.net/gh/georchestra/header@dist/header.js")
HEIGHT=$(prop "headerHeight" "80")
LEGACY=$(prop "useLegacyHeader" "false")
LEGACY_URL=$(prop "headerUrl" "/header")
LOGO=$(prop "logoUrl" "https://www.georchestra.org/public/georchestra-logo.svg")
CONFIG_FILE=$(prop "headerConfigFile" "")

if [ -f /usr/share/nginx/html/metadata-editor/index.html ]; then
    APP_DIR=${1:-/usr/share/nginx/html/metadata-editor}
    SNIPPET="<style>.h-full.bg-black.rounded-r-lg {display:none !important} </style><script src='${SCRIPT}'></script><geor-header active-app='metadata-editor' config-file='${CONFIG_FILE}' logo-url='${LOGO}' legacy-header='${LEGACY}' legacy-url='${LEGACY_URL}' height='${HEIGHT}' stylesheet='${STYLESHEET}'></geor-header>"
    BODY='<body class="flex flex-col">'
    BODY_WITH_HEADER="<body class=\"m-0 h-full flex flex-col\">${SNIPPET}"
elif [ -f /usr/share/nginx/html/datahub/index.html ]; then
    APP_DIR=${1:-/usr/share/nginx/html/datahub}
    SNIPPET="<script src='${SCRIPT}'></script><geor-header active-app='datahub' config-file='${CONFIG_FILE}' logo-url='${LOGO}' legacy-header='${LEGACY}' legacy-url='${LEGACY_URL}' height='${HEIGHT}' stylesheet='${STYLESHEET}'></geor-header>"
    BODY='<body>'
    BODY_WITH_HEADER="<body>${SNIPPET}"
else
    echo "[ERROR] geOrchestra: Datahub or Metadata Editor was not found." >&2
    exit 1
fi

if grep -Fq '<geor-header' "${APP_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#${BODY}#${BODY_WITH_HEADER}#" "${APP_DIR}/index.html"
