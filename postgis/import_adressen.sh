#!/bin/bash

# Import address data
# Source: Stadt Köln


# Download and unpack
wget http://www.offenedaten-koeln.de/sites/default/files/
unzip 2013-10-04_shape_adresse.zip

# convert to WGS84 coordinate system (lon/lat)
ogr2ogr \
	-t_srs EPSG:4326 \
	adressen_wgs84.shp \
	Adresse.shp

# create SQL import file
shp2pgsql \
	-I -s 4326 -W latin1 \
	adressen_wgs84 \
	adressen \
	> adressen.sql

# import SQL data into database
psql -U postgres -d koelnapi \
	-f adressen.sql \
	>adressen_psql_log.txt \
	2>adressen_psql_error.txt

# TODO: clean up!
