wBase = 50;
dBase = 10;
hBase = 2;
wTeeth = 1;
dTeeth = 1;
hTeeth = 10;
teethSpace = 3;

union(){
    cube([wBase,dBase,hBase]); //base
    for (h = [1:500]) {
        translate ([teethSpace,0,0]){
        cube([wTeeth,dTeeth,hTeeth]);
        }
    }
        
}