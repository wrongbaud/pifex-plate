$fa = 1;
$fs = 0.4;

// Define the basic shape of the target base
base_w = 22;
base_d = 71;
base_h = 1;

standoff_radius = 1;
standoff_height = 5;

x_offset = 2.3;
y_offset = 2;

// Draw the base of the device we're interested in
// Relay 1
rotate(90)
union(){
    cube([base_w,base_d,base_h]);
    translate([x_offset,y_offset,0])
        cylinder(h=5,r=standoff_radius);
    translate([15.7,y_offset,0])
        cylinder(h=standoff_height,r=standoff_radius);
    translate([x_offset,68,0])
        cylinder(h=standoff_height,r=standoff_radius);
    translate([15.7,68,0])
        cylinder(h=standoff_height,r=standoff_radius);
    //Relay 2
    translate([base_w,0,0])
        cube([base_w-4,base_d,base_h]);
    translate([base_w+x_offset,y_offset,0])
        cylinder(h=5,r=standoff_radius);
    translate([base_w+15.7,y_offset,0])
        cylinder(h=standoff_height,r=standoff_radius);
    translate([base_w+x_offset,68,0])
        cylinder(h=standoff_height,r=standoff_radius);
    translate([base_w+15.7,68,0])
        cylinder(h=standoff_height,r=standoff_radius);
}
// Breadboard One
translate([-(90),-60,0])
    cube([90,60,1]);
    
// Breadboard Two
translate([-(90),(22*2)-4,0])
    cube([90,60,1]);