$fa = 1;
$fs = 0.4;

B_HEIGHT=10;

// Two inner holes for fan mount
difference(){
    cube([153,2,B_HEIGHT]);

    translate([59.5,2.5,5]){
        rotate([90,0,0]){
            cylinder(h=4,r=3);
        }
    }

    translate([53.5+36,2.5,5]){
        rotate([90,0,0]){
            cylinder(h=4,r=3);
        }
    }
}



// Side brackets
translate([-2,0,0]){
cube([2,30,B_HEIGHT]);
}


translate([153,0,0]){
cube([2,30,B_HEIGHT]);
}


difference(){
    translate([-25,30,0]){
        cube([25,2,B_HEIGHT]);
    }

    translate([-12.5,35,5]){
        rotate([90,0,0]){
            cylinder(h=6,r=3);
        }
    }
}



difference(){

    translate([153,30,0]){
        cube([25,2,B_HEIGHT]);
    }

    translate([165,35,5]){
        rotate([90,0,0]){
            cylinder(h=6,r=3);
        }
    }

}
