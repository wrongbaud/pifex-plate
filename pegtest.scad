// PEGSTR - Pegboard Wizard
// Design by Marius Gheorghescu, November 2014
// Update log:

// January 6th, 2020 (Mike Mob / github.com/thetarkus)
//    - removed logo. sorry.
//    - bottom ledge settings.
// November 9th 2014
//    - first coomplete version. Angled holders are often odd/incorrect.
// November 15th 2014
//    - minor tweaks to increase rendering speed. added logo.
// November 28th 2014
//    - bug fixes

// preview[view:north, tilt:bottom diagonal]

// width of the orifice
holder_x_size = 100;

// depth of the orifice
holder_y_size = 40;

// hight of the holder
holder_height = 15;

// how thick are the walls. Hint: 6*extrusion width produces the best results.
wall_thickness = 1.85;

// how many times to repeat the holder on X axis
holder_x_count = 1;

// how many times to repeat the holder on Y axis
holder_y_count = 1;

// orifice corner radius (roundness). Needs to be less than min(x,y)/2.
corner_radius = 0;

// Use values less than 1.0 to make the bottom of the holder narrow
taper_ratio = 1;


/* [Advanced] */

// offset from the peg board, typically 0 unless you have an object that needs clearance
holder_offset = 0.0;

// what ratio of the holders bottom is reinforced to the plate [0.0-1.0]
strength_factor = 1;

// for bins: what ratio of wall thickness to use for closing the bottom
closed_bottom = 0.0;

// size of ledge for the x sides, must be less than holder_x_size
bottom_x_ledge = 10;

// size of ledge for the y sides, must be less than holder_y_size
bottom_y_ledge = 10;

// what percentage cu cut in the front (example to slip in a cable or make the tool snap from the side)
holder_cutout_side = 0.0;

// set an angle for the holder to prevent object from sliding or to view it better from the top
holder_angle = 0.0;


/* [Hidden] */

// what is the $fn parameter
holder_sides = max(50, min(20, holder_x_size*2));

// dimensions the same outside US?
hole_spacing = 25.4;
hole_size = 6.0035;
board_thickness = 5;


holder_total_x = wall_thickness + holder_x_count*(wall_thickness+holder_x_size);
holder_total_y = wall_thickness + holder_y_count*(wall_thickness+holder_y_size);
holder_total_z = round(holder_height/hole_spacing)*hole_spacing;
holder_roundness = min(corner_radius, holder_x_size/2, holder_y_size/2);


// what is the $fn parameter for holders
fn = 32;

epsilon = 0.1;

clip_height = 2*hole_size + 2;
$fn = fn;


module pin(clip)
{
  rotate([0,0,15])
    cylinder(r=hole_size/2, h=board_thickness*1.5+epsilon, center=true, $fn=12);

  if (clip) {
    //
    rotate([0,0,90])
      intersection() {
        translate([0, 0, hole_size-epsilon])
          cube([hole_size+2*epsilon, clip_height, 2*hole_size], center=true);

        // [-hole_size/2 - 1.95,0, board_thickness/2]
        translate([0, hole_size/2 + 2, board_thickness/2])
          rotate([0, 90, 0])
          rotate_extrude(convexity = 5, $fn=20)
          translate([5, 0, 0])
          circle(r = (hole_size*0.95)/2);

        translate([0, hole_size/2 + 2 - 1.6, board_thickness/2])
          rotate([45,0,0])
          translate([0, -0, hole_size*0.6])
          cube([hole_size+2*epsilon, 3*hole_size, hole_size], center=true);
      }
  }
}

module pinboard_clips()
{
  rotate([0,90,0])
    for(i=[0:round(holder_total_x/hole_spacing)]) {
      for(j=[0:max(strength_factor, round(holder_height/hole_spacing))]) {

        translate([
            j*hole_spacing,
            -hole_spacing*(round(holder_total_x/hole_spacing)/2) + i*hole_spacing,
            0])
          pin(j==0);
      }
    }
}



module pegstr()
{
  difference() {
    union() {

      pinboard();
      pinboard_clips();
    }

  }
}

$fa = 1;
$fs = 0.4;

PIW=85;
PIH=56;

PLATE_DEPTH = 1.5;
SCREW_HOLE=2.5/2;
SCREW_HEIGHT=8;

module piplate(){
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
}



rotate([0,0,0]) pegstr();
translate([-5,30,30]);
rotate([0,90,0]) piplate();