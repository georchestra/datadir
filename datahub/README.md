This folder contains a few customizations specific to geOrchestra for the Datahub:

* `conf`: geOrchestra-specific Datahub configuration
* `assets`: custom geOrchestra assets overriding the default ones
* `scripts/add-header.sh`: a script meant for injecting the geOrchestra header in the datahub application
* `scripts/add-header-webcomponent.sh`: same as above, but using the new header Web Component from https://github.com/georchestra/header/

## How to apply customizations

### Using docker

Three things are necessary:
* let the Datahub image know where to find custom assets...
* ...as well as where to find custom configuration
* inject the geOrchestra header in the main HTML file

For the header injection, the `add-header.sh` should be run at startup time. In order to do this, we need
to override the entrypoint of the docker image.

The default entrypoint of the Datahub can be seen here: https://github.com/geonetwork/geonetwork-ui/blob/a624c073ff2fdd86c2b2b649799d260463d84374/tools/docker/Dockerfile.apps#L22

Taking all this into account, this is how to start the Datahub docker image with customizations:

```bash
$ docker run -d \
    -p 8080:80 \
    -v georchestra_datadir:/etc/georchestra \
    --env ASSETS_DIRECTORY_OVERRIDE=/etc/georchestra/datahub/assets \
    --env CONFIG_DIRECTORY_OVERRIDE=/etc/georchestra/datahub/conf \
    --entrypoint sh \
    geonetwork/geonetwork-ui-datahub:latest \
    -c "sh /docker-entrypoint.sh; sh /etc/georchestra/datahub/scripts/add-header.sh; nginx -g 'daemon off;'"
```

### Not using docker

1. Copy the files in the `assets` folder to the folder of the same name in the Datahub files
   > Example: `assets/favicon.ico` goes to `/var/www/html/datahub/assets/favicon.ico`

2. Copy the configuration file in the `conf` folder to `assets/configuration` in the Datahub files
   > Example: `conf/default.toml` goes to `/var/www/html/datahub/assets/configuration/default.toml`

3. Run `add-header.sh` by specifying as argument the path to the Datahub files
   > Example: run `$ ./add-header.sh /var/www/html/datahub`
