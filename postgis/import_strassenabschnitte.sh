#!/bin/bash

# Import street segment data
# Source: Stadt Köln


# Download and unpack
wget http://www.offenedaten-koeln.de/sites/default/files/2013-10-04_shape_strassenabschnitt_0.zip
unzip 2013-10-04_shape_strassenabschnitt_0.zip

# convert to WGS84 coordinate system (lon/lat)
ogr2ogr \
	-t_srs EPSG:4326 \
	strassenabschnitte_wgs84.shp \
	Strassenabschnitt.shp

# create SQL import file
shp2pgsql \
	-I -s 4326 -W latin1 \
	strassenabschnitte_wgs84 \
	strassenabschnitte \
	> strassenabschnitte.sql

# import SQL data into database
psql -U postgres -d koelnapi \
	-f strassenabschnitte.sql \
	>strassenabschnitte_psql_log.txt \
	2>strassenabschnitte_psql_error.txt

# clean up
rm Strassenabschnitt.*
rm strassenabschnitte_wgs84.*
rm strassenabschnitte.sql
