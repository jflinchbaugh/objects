height = 15;

linear_extrude(30) {
    polygon([
        [0,0],[40,height],
        [90,height],[90,height + 2],[95,height + 2],
        [95,-2],
        [93,-2],[93,0],[85,0],[85,-2],
        [83,-2], [83,0], [75,0], [75,-2],
        [73,-2], [73,0], [65,0], [65,-2],
        [63,-2], [63,0], [55,0], [55,-2],
        [53,-2], [53,0], [45,0], [45,-2],
        [43,-2], [43,0], [35,0], [35,-2],
        [33,-2], [33,0], [25,0], [25,-2],
        [23,-2], [23,0], [15,0], [15,-2],
        [13,-2], [13,0], [5,0], [5,-2],
        [5,0]
        
    ]);
}