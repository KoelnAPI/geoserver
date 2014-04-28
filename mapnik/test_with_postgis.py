#!/usr/bin/env python

from mapnik2 import *

mapfile = 'test_style.xml'
map_output = 'mymap.png'

m = Map(1024, 1024)
load_map(m, mapfile)

# bounding box for Cologne in Google Mercator projection
bbox = (Box2d(752000, 6591000, 797500, 6637000))

m.zoom_to_box(bbox)
print("Scale = ", m.scale())
render_to_file(m, map_output)
