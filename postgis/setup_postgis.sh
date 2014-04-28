#!/bin/bash


# Setup PostGIS 1.5 on a Debian 6 squeeze machine
#
# This can't really be run in one go, so please copy
# and paste.


# Install packages
apt-get install postgresql-8.4-postgis gdal-bin unzip

# Switch to postgres system user
su - postgres

# Apply PostGis extension and create DB template
createdb template_postgis
createlang plpgsql template_postgis
psql -d template_postgis -c "UPDATE pg_database SET datistemplate=true WHERE datname='template_postgis'"
psql -d template_postgis -f /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql
psql -d template_postgis -f /usr/share/postgresql/8.4/contrib/postgis-1.5/spatial_ref_sys.sql 
psql -d template_postgis -f /usr/share/postgresql/8.4/contrib/postgis_comments.sql

# create database user and database
createuser -s -D -U postgres koelnapi
createdb -O koelnapi -T template_postgis -U postgres koelnapi
psql -U postgres "ALTER ROLE koelnapi WITH PASSWORD 'koelnapi'"
