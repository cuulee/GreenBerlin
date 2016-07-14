![GreenBerlin](https://github.com/sebastian-meier/GreenBerlin/raw/master/05_website/img/header_960.jpg)

# GreenBerlin

This is the technical documentation for how to build a  <a href="http://www.vislab.io/projects/green/index.html">tangible data visualization of green areas and water in Berlin</a>.

##01 - Data Aggregation

The data for the visualization is gathered from OpenStreetMap. If you want to just use the Berlin data, simply use the geojsons already provided in the 01_data-folder. If you want to build something similar for another city or region, use the 01_data/overpass.js. In order do download data for another region, modify the boundingbox:

```
var bbox = '(LAT_MIN,LNG_MIN,LAT_MAX,LNG_MAX)';
```

If you want to gather something else then green areas, change the values of the types array.

##02 - Data to Vector/Raster Image

If you want to laser-cut the aggregated data, you need to turn the geo-data into a vector format, we will use SVG as a transfer format before we convert it to DXF, the format accepted by most laser-cutters.
There are multiple choice for how to turn geo-data into vector images.

###02.1.1 QGIS

If you are using one of the latest versions of QGIS you can right-click the vector-layer you want to export and directly export it as dxf.

If you want to modify the vector data first, before using it, QGIS has a plugin for exporting vector-data as SVGs: http://hub.qgis.org/projects/simplesvg

###02.1.2 D3

It's kind of a cheat, but i use it quite often. Using D3s capability to easily render geojsons (or topojsons) as SVG data, allows you quickly export this data and save it as an SVG. Here is a good tutorial by Mike Bostock: https://bost.ocks.org/mike/map/

###02.2 Cleaning

You might want to edit the vector data before sending it off to the laser cutter, e.g. removing small stuff (you could also do through an algorithm). Just use you favorite vector editing application e.g. Adobe Illustrator. They can all export to DXF.

##03 - Deploy

Now we send the files off to the printer. Advice, add an extra rectangle to your DXFs, so you can easier align the various layers on top of each other in the laser-cutter application.

##04 - Slippy Map

If you have laser-cutted your map and you have taken a nice high res image of it and you want to present it as a slippy map, you first need to georeference your image. My personal advice, before you georeference your image, take it to photoshop, put the original vector data on top and try to warp and distort it until it best matches the original vector data (If you do the hard bit in photoshop you will need less geo-markers in QGIS). If you have your distorted image use QGIS to georeference it: http://www.qgistutorials.com/de/docs/georeferencing_basics.html

Now import it into TileMill (https://www.mapbox.com/tilemill) and export it as an .mbtiles raster tile set.

If you want to put labels or outlines on top, i suggest using vector-tiles. You can simply import the geojsons into Mapbox Studio and create Marker-Labels from it, there is an example project in 04_mbtiles/mapbox-project-osm_labels. I used an advanced method, by importing the data into a postgres database first (01_data/data.postgres.pg_dump.sql) and then generating points (centroids) from the data. Placing labels is quite hard, having a large polygon will likely result in multiple labels, i did not want multiple labels so i used only the centroids. In addition i based my generalization (showing and hiding labels at certain zoom levels) on the size of objects, which means showing only larger objects at low zoom levels and showing more as the user zooms in, i therefore used postgis's st_area as an input value for CartoCSS.

##05 - Website

If you are interested in the implementation of the slippy map, the folder 05_website includes the complete website http://www.vislab.io/projects/green/index.html.
If you want to know more about how to host you own tiles, check out this repo: http://www.github.com/sebastian-meier/node.tileserver

##06 - More Images

More Images are contained in the 06_image folder.

##07 - License

The data and code as provided on the Github page are available under GPLv3, so you can do what ever you want with it.

All the images on this website as well as in the repo, if not otherwise marked are available under: Creative Commons License (http://creativecommons.org/licenses/by-sa/4.0/)
This means more or less that you can do what ever you want with the images, as long as you mention the source.
Green Berlin by Sebastian Meier is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.