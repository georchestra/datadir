#!/bin/sh

# To be properly executed by datafeeder initialization need the +x flag
# so you need to add it with chmod and commit/push it

DATAFEEDER_DIR=${1:-/usr/share/nginx/html}
SNIPPET="<script src='https://mel.integration.apps.gs-fr-prod.camptocamp.com/public/header-geocontrib.js'></script><geor-header active-app='import' style='height:130px'></geor-header>"

if grep -q "${SNIPPET}" "${DATAFEEDER_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#<body class=\"m-0 h-full flex flex-col\">#<body class=\"m-0 h-full flex flex-col\">${SNIPPET}#" ${DATAFEEDER_DIR}/index.html
