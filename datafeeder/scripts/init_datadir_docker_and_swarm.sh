#!/bin/sh

# this is only required for datafeeder docker/docker swarm deploy
# this script file need the flag -Dgeorchestra.datadir=/tmp/georchestra in JAVA_OPTIONS
cp -r -f /etc/georchestra /tmp

sed -e "s#\${FQDN}#${FQDN}#g" -i /tmp/georchestra/datafeeder/metadata_*

echo "DONE"