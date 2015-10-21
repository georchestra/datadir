geOrchestra default datadir
==============================


Between 15.06 and 15.12 version of geOrchestra, several pull requests have been
proposed and merged to allow the different web applications to be able to
initialize themselves with an exported configuration. In other words, this work
was meant to be able to configure once, and be able to use generic compiled
webapps without the need of rebuilding on you own system.

In order to do so, a concept similar to the one used in geonetwork and/or
geoserver has been introduced: the geOrchestra datadir.

In the meantime, with the help of the maven-debian plugin, it was possible to
bundle these generic webapps along with their "datadir configuration" into
debian and yum (redhat) packages, creating a /etc/georchestra/[webapp]
subdirectory with the exported configuration for each module.

This repository contains the default configuration which comes along the
packages, and can be used as a reference to build your own "geOrchestra
datadir".


Usage 
=======


In order to use this datadir, simply clone this repository, customize the
different configuration files, and launch your servlet container with an extra
parameter, `georchestra.datadir=/path/to/datadir`. E.g., for tomcat, you can
create a `${CATALINA_HOME}bin/setenv.sh` file, containing:

```
export CATALINA_OPTS="${CATALINA_OPTS} -Dgeorchestra.datadir="/path/to/datadir" ...`
```


