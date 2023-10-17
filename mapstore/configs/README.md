# Map configuration (config.json)

The MapStore frontend uses different JSON formatted files for different purposes:
 * `localConfig.json` is the global configuration, where most of the defaults are set.
 * Static map configuration files are used to ease configuring base maps for different scenarios (new map with `new.json`, default map with `config.json`, etc.)

## Hint for WMTS Layers

- Printing: when using WMTS layers, a `style` attribute is mandatory to ensure the printing module works (this might just be an empty string ` "style": "",`)
