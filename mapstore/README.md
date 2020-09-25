MapStore configuration files
----------------------------

- geostore.properties: MapStore specific database configuration properties (not contained in default.properties, e.g. the database schema used by MapStore for its persistence layer)
- proxy.properties: MapStore proxy configuration (see here: https://github.com/geosolutions-it/http-proxy/wiki/Configuring-Http-Proxy for further details)
- log4j.properties: logging configuration (see here: https://logging.apache.org/log4j/2.x/manual/configuration.html#ConfigurationSyntax)
- localConfig.json: main frontend configuration file, in JSON format (see here: https://mapstore.readthedocs.io/en/latest/developer-guide/local-config/)
- config.json: map configuration file for initial viewer map
- new.json: map configuration file for new maps
- printing: folder with mapfish-print configuration files, config.yaml and related resource (see here: https://github.com/geosolutions-it/mapfish-print/wiki)
- extensions.json: dynamic registry of currently installed extensions, in JSON format
- pluginsConfig.json: dynamic registry of available plugins (both standard and extensions) for the context configurator, in JSON format
- dist subfolder: will contain all the dynamically uploaded extensions, one folder for each of them, with all the extension assets (javascript bundle, translations, etc.)

More information is available in the [geOrchestra Configuration Guide](https://docs.georchestra.geo-solutions.it/en/latest/configuration/index.html) and the [MapStore Developer Guide](https://mapstore.readthedocs.io/en/latest/developer-guide/configuration-files/)
