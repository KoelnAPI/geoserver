#!/bin/bash

#############################################################
#                                                           #
#  Installation procedure for Mapnik 2 on Debian 6 squeeze  #
#                                                           #
#############################################################


# adapted from https://github.com/mapnik/mapnik/wiki/DebianInstallation

apt-get install \
    g++-4.4 cpp \
    libicu-dev libicu44 \
    python2.6-dev \
    libboost-system1.42-dev \
    libboost-filesystem1.42-dev \
    libboost-iostreams1.42-dev \
    libboost-thread1.42-dev \
    libboost-python1.42-dev \
    libboost-program-options1.42-dev \
    libboost-regex1.42-dev \
    libxml2 libxml2-dev \
    libfreetype6 libfreetype6-dev \
    libjpeg62 libjpeg62-dev \
    libpng12-0 libpng12-dev \
    libtiff4 libtiff4-dev \
    libltdl7 libltdl-dev \
    libproj0 libproj-dev \
    libcairo2 libcairo2-dev python-cairo python-cairo-dev \
    libcairomm-1.0-1 libcairomm-1.0-dev \
    ttf-dejavu ttf-dejavu-core ttf-dejavu-extra ttf-unifont \
    postgresql-8.4 postgresql-server-dev-8.4 postgresql-contrib-8.4 \
    libgdal1-dev python-gdal \
    postgresql-8.4-postgis libsqlite3-dev  \
    subversion build-essential python-nose \
    libgeotiff1.2 libspatialite2 python-lxml


# squeezy backports, see http://osm.fsffrance.org/debian-backports/README
wget http://osm.fsffrance.org/debian-backports/libepsilon0_0.9.1-2~bpo60+1_amd64.deb
wget http://osm.fsffrance.org/debian-backports/librasterlite1_1.1~svn11-1~bpo60+1_amd64.deb
wget http://osm.fsffrance.org/debian-backports/mapnik-utils_2.0.0+ds1-3~bpo60+1_amd64.deb
wget http://osm.fsffrance.org/debian-backports/python-mapnik2_2.0.0+ds1-3~bpo60+1_amd64.deb
wget http://osm.fsffrance.org/debian-backports/libmapnik2-2.0_2.0.0+ds1-3~bpo60+1_amd64.deb

dpkg -i \
    libepsilon0_0.9.1-2~bpo60+1_amd64.deb \
    librasterlite1_1.1~svn11-1~bpo60+1_amd64.deb
dpkg -i \
    python-mapnik2_2.0.0+ds1-3~bpo60+1_amd64.deb \
    mapnik-utils_2.0.0+ds1-3~bpo60+1_amd64.deb \
    libmapnik2-2.0_2.0.0+ds1-3~bpo60+1_amd64.deb
