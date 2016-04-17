//$fa=5; $fs=0.1;

// скругление - это надо вычитать 
//module rounder(corner=[0,0,0], rradius=2, rheight){
//        translate(corner) 
//            difference(){
//                cube([rradius,rradius,rheight]);
//                translate([rradius,rradius,0]) cylinder(r=rradius, h=rheight);
//            }
//}   

// параллелепипед со скругленными вертикальными ребрами
module cuberv(size, rradius=2){
    hull(){
        translate([rradius,rradius,0]) cylinder(r=rradius, h=size[2]);
        translate([size[0]-rradius, rradius, 0]) cylinder(r=rradius, h=size[2]);
        translate([rradius, size[1]-rradius, 0]) cylinder(r=rradius, h=size[2]);
        translate([size[0]-rradius, size[1]-rradius, 0]) cylinder(r=rradius, h=size[2]);
    }
}


//rounder([0,0,0], 2, 30);
//cuberv([30,30,30]);