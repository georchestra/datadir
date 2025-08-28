# Installation with geOrchestra

Installing Maelstro requires several customizations of the geOrchestra instance [datadir](https://github.com/georchestra/datadir):
- copying and customizing files from [this folder](https://github.com/georchestra/maelstro/tree/main/config) into a `maelstro` subfolder of the datadir 
- security-proxy or gateway routes

It also requires an additional role to be created.


## Security proxy integration
In the `security-proxy/targets-mapping.properties` file, add: 
```
maelstro-backend=http://${MAELSTRO_HOST}:8000/
maelstro=http://${MAELSTRO_FRONT_HOST}:8080/maelstro/
```
Customize `MAELSTRO_HOST` and `MAELSTRO_FRONT_HOST` with your environment hosts.

In the `security-proxy/security-mappings.xml` file, add the following access rules:
```
   <intercept-url pattern="/maelstro-backend.*" access="ROLE_MAELSTRO" />
   <intercept-url pattern="/maelstro.*" access="ROLE_MAELSTRO" />
```

## Gateway configuration
In the `gateway/routes.yaml` file, edit the `spring.cloud.gateway.routes` section to add the following:
```
       - id: maelstro-back
         uri: ${georchestra.gateway.services.maelstro-back.target}
         predicates:
         - Path=/maelstro-backend/**
         filters:
         - RewritePath=/maelstro-backend/(?<segment>.*),/$\{segment}
       - id: maelstro
         uri: ${georchestra.gateway.services.maelstro.target}
         predicates:
         - Path=/maelstro/**
         filters:
         - RewritePath=/maelstro/(?<segment>.*),/$\{segment}
```
Then, in the`gateway/gateway.yaml` file, edit the `georchestra.gateway.services` section:
```
       maelstro-back:
         target: ${georchestra.gateway.services.maelstro-back.target}
         access-rules:
           - intercept-url: /maelstro-backend/**
             anonymous: false
             allowed-roles: MAELSTRO
       maelstro:
         target: ${georchestra.gateway.services.maelstro.target}
         access-rules:
           - intercept-url: /maelstro/**
             anonymous: false
             allowed-roles: MAELSTRO
```
In the same file, add the following into the `georchestra.gateway.services` section:
```
  maelstro-back.target: http://${MAELSTRO_HOST}:8000/
  maelstro.target: http://${MAELSTRO_FRONT_HOST}:8080/
```

## Geoserver

Maelstro assumes that the destination workspace and datastore exist, otherwise it will return an error.

Before using it, make sure that the source and destination geoservers are aligned.

## Console

To access the Maelstro module without being a super administrator, the MAELSTRO role is required.

You should also double check the credentials which are used to perform the API calls on the source and destination platforms in the [config.yaml](config.yaml) file.

## Header integration 

In order to add the geOrchestra header to the maelstro application, one can use the [`geor-header` webcomponent](https://github.com/georchestra/header/) and add it to the index.html file. 
This way you can use either the legacy header or the new one.

In this repo, we use the env `CUSTOM_SCRIPTS_DIRECTORY` in docker-compose file which execute [./scripts/add-header-webcomponent.sh](./scripts/add-header-webcomponent.sh) to add the header.

### Legacy header or new header < geOrchestra 25.0

If you are still using the legacy header, you surely have a fork of the folder `header` in `georchestra/georchestra` repository.
If you are using the webcomponent header in georchestra 24, you may have a fork of the `georchestra/header` repository.
You can edit your fork and deploy it.

### New header >= geOrchestra 25.0

Just edit your config file to add an entry for `maelstro` :
```json
{
  "label": "Maelstro",
  "url": "/maelstro",
  "activeAppUrl": "/maelstro",
  "hasRole": "ROLE_MAELSTRO"
}
```
