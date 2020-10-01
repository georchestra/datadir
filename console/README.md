# Console

## Instructions to create a minimalistic GeoJSON file 

`ogr2ogr` is a great tool, it allows at the same time to:
 * convert from one format (here shapefile) to geojson
 * filter out useless attributes (thus reducing the file size)
 * reproject from the source SRS to the target SRS (EPSG:4326)

Exemple:
```
ogr2ogr -f geojson -s_srs EPSG:3857 -t_srs EPSG:4326 -select INSEE_COM,NOM_COM_M,INSEE_DEP cities.geojson cities.shp
```

The resulting geojson file is then imported into [mapshaper](https://mapshaper.org/), in order to reduce its complexity while retaining the shapes and topology.
 
Optionally, [geojson-precision](https://github.com/jczaplew/geojson-precision) can be applied on top, to further reduce the file size:
```
geojson-precision -p 4 cities.geojson final.geojson
```
