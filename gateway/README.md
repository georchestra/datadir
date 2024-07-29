This folder contains configuration files and custom templates for geOrchestra Gateway.

## List of configuration files

#### `application.yaml`

Contains filters applicable to all transfers through the gateway.

#### `gateway.conf`

Contains access rules for all services available through the gateway.

#### `roles-mappings.yaml`

Allow to map roles returned by authentication providers to standardized geOrchestra roles.

####  `routes.yaml`

Contains list of routes for redirection to the correct service URL based on criterias (typically URL patterns but other criterias exists).
Also allows to apply additional filters on this route.

####  `security.yaml`

Contains all settings about authentication

## Templates

If needed, default pages can be overriden by custom templates. This includes login, logout page, and error pages. Only existing templates will override default ones.

All templates are typically kept into a `templates` sub-directory, but this can be changed. In all cases, this sub-directory shall be specified in gateway configuration file `application.yaml` as below :
```
spring:
  thymeleaf:
    prefix: file:${georchestra.datadir}/gateway/templates/
    cache: false
```

Template directory content is shown below.

#### `login.html` file

This contains custom login page.

#### `logout.html` file

This contains custom logout confirmation page.

#### `error` sub-directory

This directory can contain with custom templates for handling 4xx and 5xx HTTP errors. Just create a template file that has the name of error to handle (like `404.html`).

#### `messages` sub-directory

This directory can contain translation files for captions used in custom templates. File naming consists of a base name followed by an underscore and a language code, then the `.properties` extension. For example `basename_fr.properties` will be used for French translations. English translation can be left without underscore and language code as `basename.properties`.

In-file format is `key = value` lines, and expected encoding is UTF-8.

This sub-directory and the basename shall be specified in gateway configuration file `application.yaml`, by concatenation of the both as below :
```
spring:
  messages
    basename: file:${georchestra.datadir}/gateway/templates/messages/basename
```


#### `static` sub-directory

This directory can contain all needed static files for custom templates, such as images, CSS files, JS files... This sub-directory shall be specified in gateway configuration file `application.yaml` as below :
```
spring:
  web:
    resources:
      static-locations: file:${georchestra.datadir}/gateway/templates/static/
```

The path where they will be made available to the HTTP client has also to be specified in same location as below. Be aware not to collide with gateway routes when choosing this path.
```
spring:
  webflux:
    static-path-pattern: /path/to/static/**
```
