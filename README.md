# haskellorbits

This is me remaking an old lost Python project to somewhat learn Haskell.

It takes a file as its argument and makes a graph based on the contents.
For the file format, the first line the angle to draw, in multiples of 2pi, followed by white space and then the resolution of the graph to make.
the resolution is just 1 number that gets used for both the height and width because square graphs look the besr anyway.

The rest of the file contains instructions for the actual curves of the graphs.
Each line is a new curve, and each pair of numbers is a new circle added on to the curve.
The first number is the radius of the circle, while the 2nd is its frequency.
Every number -1 <= n <= 1 must be written with its 0, i.e. 0.23 instead of .23

For example, a file

900 1
1 1
2 1 0.5 3

would create a 900x900 graph that contains a circle with radius 1
and a curve that is a circle with radius 2 and and frequency 1 added to a circle with radius 0.5 and frequency 3.

If it helps, you can think of adding curves as epi/hypocycloids, but with the 2nd circle centered on the edge of the first, and potentially extreme slipping.
Alternately, you can think of viewing the orbit of a celestial body from the perspective of a different orbiting celestial body (orbits simplified to circles), i.e. mars's moons from earth.

Todo if I ever want to come back to this:
Come up with a better file format for the input.
Figure out how to parse floats such as .81
Allow comments in the files
More comments for the source file
Actually check for errors in input/arguments.
Maybe look into if having more colours would look cool.
