#!/usr/bin/env python

from mapnik2 import *

mapfile = 'test_style.xml'
map_output = 'mymap.png'

m = Map(1024, 1024)
load_map(m, mapfile)
bbox = (Envelope(6, 51, 8, 52))

m.zoom_to_box(bbox)
print("Scale = ", m.scale())
render_to_file(m, map_output)
