$fa = 1;
$fs = 0.4;

PIW=85;
PIH=56;

PLATE_DEPTH = 2.5; 
SCREW_HOLE=2.75/2;
SCREW_HEIGHT=8;

difference(){
cube([PIW,PIH,PLATE_DEPTH]);

translate([3.5,3.5,-1])
    cylinder(h=SCREW_HEIGHT,r=SCREW_HOLE);
    
translate([58+4,3.5,-1])
    cylinder(h=SCREW_HEIGHT,r=SCREW_HOLE);
    
translate([58+4,49+3.5,-1])
    cylinder(h=SCREW_HEIGHT,r=SCREW_HOLE);
    
translate([3.5,49+3.5,-1])
    cylinder(h=SCREW_HEIGHT,r=SCREW_HOLE);
}

translate([-25,-96,0])
    cube([PIW+25,PIH+40,PLATE_DEPTH]);

linear_extrude(height=3)
rotate([0,0,90])
        translate([-85,-20,-10])
     scale([.25,.25,10])
     import("vss.svg");
