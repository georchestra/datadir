This folder contains configuration files and custom templates for geOrchestra Gateway.

## Documentation

Documentation can be found in [docs directory at root of georchestra-gateway](https://github.com/georchestra/georchestra-gateway/blob/ui_customization_doc/docs) repository.

## List of configuration files

#### `application.yaml`

Contains filters applicable to all transfers through the gateway, and general Spring settings.

#### `gateway.conf`

Contains access rules for all services available through the gateway.

Please see https://github.com/georchestra/georchestra-gateway/blob/main/docs/access-rules.adoc

#### `roles-mappings.yaml`

Allow to map roles returned by authentication providers to standardized geOrchestra roles.

Please see https://github.com/georchestra/georchestra-gateway/blob/main/docs/roles-mappings.adoc

####  `routes.yaml`

Contains list of routes for redirection to the correct service URL based on criterias (typically URL patterns but other criterias exists).  
Also allows to apply additional filters on this route.

Please see https://cloud.spring.io/spring-cloud-gateway/reference/html

####  `security.yaml`

Contains all settings about authentication. Please see the following documents :  
OAuth2 : https://github.com/georchestra/georchestra-gateway/blob/main/docs/authzn.adoc  
Pre-authentication : https://github.com/georchestra/georchestra-gateway/blob/main/docs/pre-authentication.adoc  

## Templates

If needed, default pages can be overriden by custom templates. This includes login, logout page, and error pages. Only existing templates will override default ones.

Please see https://github.com/georchestra/georchestra-gateway/blob/main/docs/ui-customization.adoc
