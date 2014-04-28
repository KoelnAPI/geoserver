#!/usr/bin/env python

from mapnik2 import *

mapfile = 'test_style.xml'
map_output = 'mymap.png'

m = Map(1024, 1024)
load_map(m, mapfile)
bbox = (Box2d(6.77, 50.82, 7.17, 51.09))

m.zoom_to_box(bbox)
print("Scale = ", m.scale())
render_to_file(m, map_output)
