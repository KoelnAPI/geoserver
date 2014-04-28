#!/bin/bash

# Import AED (defibrillatoren)
# Source: KoelnAPI Github repo


# Download
wget --no-check-certificate https://raw.githubusercontent.com/KoelnAPI/data/master/data/health/aed/aed.min.geojson

# convert to WGS84 coordinate system (lon/lat) shapefile
ogr2ogr \
	-t_srs EPSG:4326 \
	aed_wgs84.shp \
	aed.min.geojson

# create SQL import file
shp2pgsql \
	-I -s 4326 -W utf8 \
	aed_wgs84 \
	aed \
	> aed.sql

# import SQL data into database
psql -U postgres -d koelnapi \
	-f aed.sql \
	>aed_psql_log.txt \
	2>aed_psql_error.txt

# clean up
rm aed.sql
rm aed.min.geojson
rm aed_wgs84.*
