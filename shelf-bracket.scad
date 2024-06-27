$fa = 1;
$fs = 0.4;

B_HEIGHT=15;



// Side brackets
translate([-2,-5,0]){
cube([5,35,B_HEIGHT]);
}


difference(){
    translate([-50,30,0]){
        cube([53,2,B_HEIGHT]);
    }

    translate([-12.5,35,7]){
        rotate([90,0,0]){
            cylinder(h=6,r=3);
        } 
    }
    
    translate([-30,35,7]){
        rotate([90,0,0]){
            cylinder(h=6,r=3);
        } 
    }
}

difference(){
translate([-50,30,0]){

    rotate([0,0,-35.5]){
    cube([60,2,B_HEIGHT]);
    }
}

    translate([-12.5,8,7]){
        rotate([90,0,0]){
            cylinder(h=10,r=3);
        } 
    }
    
    translate([-30,20,7]){
    rotate([90,0,0]){
        cylinder(h=10,r=3);
    } 
}

}

