# geOrchestra default datadir

This repository contains the default configuration files for geOrchestra modules, and can be used as a reference to build your own "geOrchestra datadir". We call this a "datadir" for the similarity with the well-known GeoServer and GeoNetwork datadirs, but this directory is not meant to host geographic data.

At startup, geOrchestra applications running inside a servlet container having the extra `georchestra.datadir` parameter, will initialize themselves with the configuration contained in the directory that this parameters points to.

Debian packages already come with their own version of the datadir, but the WARs we provide don't. 
That is the reason why this directory is provided here.


## Usage

In order to use this datadir:
 * simply clone this repository (typically in `/etc/georchestra` but it might be elsewhere)
 * **checkout the branch matching your geOrchestra version**
 * customize the different configuration files (see below)
 * launch your servlet container with an extra parameter, typically `georchestra.datadir=/etc/georchestra`

For instance, with tomcat, you may create a `${CATALINA_HOME}/bin/setenv.sh` file with:
```
export CATALINA_OPTS="${CATALINA_OPTS} -Dgeorchestra.datadir="/etc/georchestra"
```


## 3-steps editing

Before using this datadir, you should at least change the default FQDN (`georchestra.mydomain.org`) for yours.
This can be done very easily with eg:
```
cd /etc/georchestra
find ./ -type f -exec sed -i 's/georchestra.mydomain.org/my.fqdn/' {} \;
```
...where `my.fqdn` is your server's FQDN.


Next thing to do is changing the password of the `geoserver_privileged_user`, that is internally used by several geOrchestra modules:
```
cd /etc/georchestra
find ./ -type f -exec sed -i 's/gerlsSnFd6SmM/'$(pwgen -1)'/' {} \;
```
Remember to change it in your LDAP too !


Finally, you should head to [ReCAPTCHA](https://www.google.com/recaptcha/) and get an account for your service.
Once you're done, fill in the public and private keys in the [ldapadmin/ldapadmin.properties](https://github.com/georchestra/datadir/blob/master/ldapadmin/ldapadmin.properties) file.


**Restart your tomcat or jetty services when done with datadir editing**.
