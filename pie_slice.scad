/**
 * draw a 2d pie with a radius, a start angle, and occupying an angle.
 */
module pie(start, angle, radius, fn=$fn) {
  intersection() {
    circle(r=radius, $fn=fn);
    slice(start, angle, radius * 1.1);
  }
}

module slice(start,angle,rad) {
     if (angle <= 45) {
          x1=sin(start)*rad;
          y1=cos(start)*rad;
          x2=sin(start+angle)*rad;
          y2=cos(start+angle)*rad;
          polygon(
               points=[ [0,0],[x1,y1],[x2,y2]]
               );
     } else {
          union() {
               slice(start, 45, rad);
               slice(start + 45, angle - 45, rad);
          }
     }
}
