#!/bin/sh

# To be properl executed by datahub initialization need the +x flag 
# so you need to add it with chmod and commit/push it
# To be properl executed by datahub initialization need the +x flag
# so you need to add it with chmod and commit/push it
function prop {
    variable=$(grep "^${1}" /etc/georchestra/default.properties)
    if  [[ -z $variable ]] || [[ $variable == \#* ]] ;
    then
        echo ${2}
    else
        echo $variable | cut -d'=' -f2
    fi
    #one-line version [[ -z $variable ]] || [[ $variable == \#* ]] && echo ${2} || echo $variable | cut -d'=' -f2
}

STYLESHEET=$(prop "georchestraStylesheet" "")
SCRIPT=$(prop "headerScript" "https://cdn.jsdelivr.net/gh/georchestra/header@dist/header.js")
HEIGHT=$(prop "headerHeight" "80")
LEGACY=$(prop "useLegacyHeader" "false")
LEGACY_URL=$(prop "headerUrl" "/header")
LOGO=$(prop "logoUrl" "https://www.georchestra.org/public/georchestra-logo.svg")
CONFIG_FILE=$(prop "headerConfigFile" "")

DATAHUB_DIR=${1:-/usr/share/nginx/html/datahub}
SNIPPET="<script src='${SCRIPT}'></script><geor-header active-app='datahub' config-file='${CONFIG_FILE}' logo-url='${LOGO}' legacy-header='${LEGACY}' legacy-url='${LEGACY_URL}' height='${HEIGHT}' stylesheet='${STYLESHEET}'></geor-header>"

if grep -q "${SNIPPET}" "${DATAHUB_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#<body>#<body>${SNIPPET}#" ${DATAHUB_DIR}/index.html
