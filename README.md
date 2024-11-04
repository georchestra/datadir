# geOrchestra default datadir

This repository contains the default configuration files for geOrchestra modules, and can be used as a reference to build your own "geOrchestra datadir". We call this a "datadir" for the similarity with the well-known GeoServer and GeoNetwork datadirs, but this directory is not meant to host geographic data.

At startup, geOrchestra applications running inside a servlet container having the extra `georchestra.datadir` parameter, will initialize themselves with the configuration contained in the directory that this parameters points to.

Debian packages already come with their own version of the datadir, but the WARs we provide don't. 
That is the reason why this directory is provided here.


## Usage

In order to use this datadir:
 * simply clone this repository (typically in `/etc/georchestra` but it might be elsewhere)
 * **checkout the branch matching your geOrchestra version** (eventually prefixed with `docker-` if you use [official docker images](https://hub.docker.com/u/georchestra))
 * customize the different configuration files (see below)
 * launch your servlet container with an extra parameter, typically `georchestra.datadir=/etc/georchestra`

For instance, with tomcat, you may create a `${CATALINA_HOME}/bin/setenv.sh` file with:
```
export CATALINA_OPTS="${CATALINA_OPTS} -Dgeorchestra.datadir="/etc/georchestra"
```

Note that if you are developing, and running the servlet container with the Maven embedded Jetty server, by default, the datadir will be set to `/etc/georchestra/`, and you only need to launch `mvn jetty:run`. If you need to point to another location, say `/etc/anotherlocation/`, you will have to pass it to Jetty: `mvn -Dgeorchestra.datadir=/etc/anotherlocation jetty:run`.

## 3-steps editing

Before using this datadir, you should at least change the default FQDN (`georchestra-127-0-0-1.nip.io`) for yours.
This can be done very easily with eg:
```
cd /etc/georchestra
find ./ -type f -exec sed -i 's/georchestra-127-0-0-1.nip.io/my.fqdn/' {} \;
```
...where `my.fqdn` is your server's FQDN.


Next thing to do, for security, is changing the password of the `geoserver_privileged_user`, that is internally used by several geOrchestra modules:
```
cd /etc/georchestra
find ./ -type f -exec sed -i 's/gerlsSnFd6SmM/'$(pwgen 16 1)'/' {} \;
```

Remember to **change it in the LDAP** too !


**Restart your tomcat or jetty services when done with datadir editing**.


## Notes

There are plenty of other configuration options available, so feel free to browse the sub-folders of this repository and read the comments to make your mind.

We do recommend that you:
 * change the default language in [default.properties](./default.properties)
 * upload a new logo to [header/logo.png](header/logo.png)
 * update the viewer config with [mapstore/config/localConfig.json](mapstore/config/localConfig.json)
 * translate the console ([console/templates](console/templates)) email templates to the desired language.
 
## Switching to another language - tasklist

This is a "WIP" reminder of the steps required to switch a geOrchestra instance from the default language (English) to another language, eg French here:
 * `default.properties`: language=fr
 * `datafeeder/metadata_template.xml`: `<gmd:language><gmd:LanguageCode codeList="http://www.loc.gov/standards/iso639-2/" codeListValue="fre" /></gmd:language>`
 * `analytics/analytics.properties`: `localTimezone=Europe/Paris`
 * `console/templates`: translate
 * `console/console.properties`: translate
   * `orgTypeValues=Association,Company,NGO,Individual,Other`
   * `subject.*` values
 * `datafeeder/templates`: translate
 * `mapstore/configs` folder: translate, adapt layers

Also to be mentioned, even if not specific to this "datadir" repository: open a browser, login as "testadmin" (or any other privileged account) then edit the following.
 * Metadata templates on `/geonetwork/srv/fre/catalog.edit#/board?isTemplate="y"`
 * Services descriptions and contact point on `/geoserver/web/`
