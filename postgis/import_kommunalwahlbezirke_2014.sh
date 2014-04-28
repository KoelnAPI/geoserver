#!/bin/bash

# Import Kommunalwahlbezirke 2014 Shapefile
# Source: Stadt Köln


# Download and unpack
wget http://www.offenedaten-koeln.de/sites/default/files/2014-04-02_shape_kommunalwahlbezirk.zip
unzip 2014-04-02_shape_kommunalwahlbezirk.zip
mv "Shape Kommunalwahlbezirk" kommunalwahlbezirke_2014

# convert to WGS84 coordinate system (lon/lat)
ogr2ogr \
	-t_srs EPSG:4326 \
	kommunalwahlbezirke_2014/kommunalwahlbezirke_wgs84.shp \
	kommunalwahlbezirke_2014/Kommunalwahlbezirk.shp

# create SQL import file
shp2pgsql \
	-I -s 4326 -W latin1 \
	kommunalwahlbezirke_2014/kommunalwahlbezirke_wgs84 \
	kommunalwahlbezirke_2014 \
	> kommunalwahlbezirke_2014.sql

# import SQL data into database
psql -U postgres -d koelnapi \
	-f kommunalwahlbezirke_2014.sql \
	>kommunalwahlbezirke_2014_psql_log.txt \
	2>kommunalwahlbezirke_2014_psql_error.txt

# TODO: clean up!
