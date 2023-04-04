#!/bin/bash

DATAHUB_DIR=${1:-/usr/share/nginx/html/datahub}
SNIPPET="<iframe src='/portail/banner?active=datahub' style='height:90px; width: 100%; border: 0; overflow: hidden'></iframe>"

if grep -q "${SNIPPET}" "${DATAHUB_DIR}/index.html"; then
  echo "[INFO] geOrchestra: header already present."
  exit 0
fi

echo "[INFO] geOrchestra: adding header in the main page..."
sed -i "s#<body>#<body>${SNIPPET}#" ${DATAHUB_DIR}/index.html
