# geOrchestra default datadir

This repository contains the default configuration files for geOrchestra modules, and can be used as a reference to build your own "geOrchestra datadir". We call this a "datadir" for the similarity with the well-known GeoServer and GeoNetwork datadirs, but this directory is not meant to host geographic data.

At startup, geOrchestra applications running inside a servlet container having the extra `georchestra.datadir` parameter, will initialize themselves with the configuration contained in the directory that this parameters points to.

Debian packages already come with their own version of the datadir, but the WARs we provide don't. 
That is the reason why this directory is provided here.

# Usage

In order to use this datadir, simply clone this repository, **checkout the branch matching your geOrchestra version**, customize the different configuration files, and launch your servlet container with an extra parameter, typically `georchestra.datadir=/etc/georchestra`. 

For instance, with tomcat, you may create a `${CATALINA_HOME}/bin/setenv.sh` file with:
```
export CATALINA_OPTS="${CATALINA_OPTS} -Dgeorchestra.datadir="/etc/georchestra"
```
