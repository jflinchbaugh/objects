wBase = 51;
dBase = 10;
hBase = 2;
wTeeth = 1;
dTeeth = 10;
hTeeth = 10;
teethSpace = 5;

union(){
    cube([wBase,dBase,hBase]); //base
    for (h = [0:10]) {
        translate ([teethSpace*h,0,0]){
        cube([wTeeth,dTeeth,hTeeth]);
            //translate ([0,teethSpace,0]){
            //cube([wTeeth,dTeeth,hTeeth]);
            //}
            //translate ([0,teethSpace*2,0]){
            //cube([wTeeth,dTeeth,hTeeth]);
            //}
            //translate ([0,teethSpace*3,0]){
            //cube([wTeeth,dTeeth,hTeeth]);
            //}
        }
    }
}
