#!/bin/sh

# To be properl executed by datahub initialization need the +x flag
# so you need to add it with chmod and commit/push it

DATAHUB_DIR=${1:-/usr/share/nginx/html/datahub}
SNIPPET="<script src='https://mel.integration.apps.gs-fr-prod.camptocamp.com/public/header-geocontrib.js'></script><geor-header active-app='datahub' style='height:130px'></geor-header>"

if grep -q "${SNIPPET}" "${DATAHUB_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#<body>#<body>${SNIPPET}#" ${DATAHUB_DIR}/index.html
