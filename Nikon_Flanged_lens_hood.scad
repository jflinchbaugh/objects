// customized to replace an HB-7 for 80-200 f/2.8 AF-D lens

// Originally: https://www.thingiverse.com/thing:868776
//Parameterised olympus bayonet lens hood generator
// Glyn Cowles Feb 2014


//Thickness of tube walls
thickness=2.0;
//Inside diameter of bottom tube
d1_inside=87.5;
//Height of bottom tube
h1=1.4;
//Inside diameter of top tube
d2_inside=95;
//Height of top tube
h2=45;
//Height of connector section
c_ht=4;
// Percentage of circumference for one flange
f_pcent=16;
// Flange thickness
f_th=1.2;
//Flange height
f_ht=1.4;
// Resolution
$fn=90;

d1=d1_inside+2*thickness;
d2=d2_inside+2*thickness;
mask_degree=ceil(120-(f_pcent/100*360)); // this is the angle of the pie_slice mask
assemble();
//-----------------------------------------------------------------------
module tube(d,h,t) { // diameter height thickness
rad=d/2;
difference() {
cylinder(h=h,r=rad);
cylinder(h=h,r=rad-t);
}
}
//-----------------------------------------------------------------------

module connector(){
difference() {
 cylinder (h=c_ht,r1=d1/2,r2=d2/2);
 cylinder (h=c_ht,r1=d1/2-thickness,r2=d2/2-thickness);
}
}
//-----------------------------------------------------------------------

module flange() { // the three connecting lugs at the base
  difference() {
  tube(d1-thickness*2,f_ht,f_th);
  union () {
        pie_slice(0,mask_degree,d1,f_ht)  ; //65 deg is the amount to remove
        pie_slice(120,mask_degree,d1,f_ht)  ;
        pie_slice(240,mask_degree,d1,f_ht)  ;
    }
  }
}
//-----------------------------------------------------------------------

module pie_slice(a,b,rad,h) { // make a pie slice starting at angle a continuing for angle b with radius of rad and height of h
    x1=sin(a)*rad;
    y1=cos(a)*rad;
    x2=sin(a+b)*rad;
    y2=cos(a+b)*rad;
    linear_extrude(height=h)
    polygon(
        points=[ [0,0],[x1,y1],[x2,y2]]
    );
}
//-----------------------------------------------------------------------

module assemble() {
union() {
    tube(d1,h1,thickness); //bottom tube
    translate([0,0,h1]) connector();  // connector
    translate([0,0,h1+c_ht])  tube(d2,h2,thickness); // top tube
    translate([0,0,0]) flange(); //connecting lugs
    }
};



