//$fa=5; $fs=0.1;

use <parts.scad>

L=350; //длина профиля
H=20; //сечение профиля
J=5.5; // подъем от толщины соединителя

module xy_complete(){
// ПРРРОФИЛИ
//x
translate([L/2+H, H/2, H/2]) rotate([0,90,0]) profile(L);
translate([L/2+H, L+1.5*H, H/2]) rotate([0,90,0]) profile(L);
//y
translate([H/2, L/2+H, H/2]) rotate([0,90,90]) profile(L);
translate([L+1.5*H, L/2+H, H/2]) rotate([0,90,90]) profile(L);

// углы
translate([10, 10, 14.5]) rotate([0,0,-90]) triway();
translate([L+1.5*H, 10, 14.5]) rotate([0,0,0]) triway();
translate([10, L+1.5*H, 14.5]) rotate([0,0,180]) triway();
translate([L+1.5*H, L+1.5*H, 14.5]) rotate([0,0,90]) triway();

	
color([0.8,0,0.8]){
	translate([20,20,0]) corner();
	translate([L+H,20,0]) rotate([0,0,90]) corner();
}

// РЕЛЬСЫ
translate([H+4, L/2+H, H/2]) rotate([90,0,90]) { rail(); carriage(); }
translate([L+H-4, L/2+H, H/2]) rotate([-90,0,90]) { rail(); carriage(); }

//профиль X
color([0.7,0.7,0.7]) difference(){
    union(){
        translate([H+L/2, H+L/2, 16]) cube([L-26, 15, 15], center=true);
    }//u
    union(){

    }//u
}//d
    
//рельса X
translate([H+L/2, H+L/2, 27.5]) { rail350(); carriage(); }

//левый мотор
translate([25,0,H+3]) {
    rotate([0,0,180]) motor_holder();
    translate([0,-36,-24]){
       motor();
       translate([0,0,36]) rotate([0,0,0]) pulley();
    }
}//t

//правый мотор
translate([L+15,0,H+3]) {
    rotate([0,0,180]) motor_holder();
    translate([0,-36,-24]){
       motor();
       translate([0,0,45]) pulley();
    }
}//t

//левые ролики
//средние
translate([43,L/2+H,39]){
	roller();
	translate([0,0,9]) roller();
}
//задние
translate([43,L+1.5*H,39]){
	roller();
	translate([0,0,9]) roller();
}

//правые ролики
//средние
translate([L-3,L/2+H,39]){
	roller();
	translate([0,0,9]) roller();
}
//задние
translate([L-3,L+1.5*H,39]){
	roller();
	translate([0,0,9]) roller();
}


//xy-left
color([0,0.7,0]) translate([33, L/2-2.7, 31.5]) xy();

//xy-right
color([0,0.7,0]) translate([L+7, L/2+42.7, 31.5]) rotate([0,0,180]) xy();

//back-left
color ([0,0.9,0]) translate([H+8, L+H, H]) back_holder();

//back-right
color ([0,0.9,0]) translate([L+12, L+H, H]) mirror([1,0,0]) back_holder();

//belt
// левый наружний
color([0,0,0]) hull(){
	translate([18.5, -35.5, H+16]) cylinder(r=0.7, h=6);
	translate([31.5, L+1.5*H, 36]) cylinder(r=0.7, h=6);
}
// правый наружний
color([0,0,0]) hull(){
	translate([L+21.5, -35.5, 45]) cylinder(r=0.7, h=6);
	translate([L+8.5, L+1.5*H, 45]) cylinder(r=0.7, h=6);
}

// задние
color([0,0,0]){
	translate([43, L+1.5*H+11, 36]) cube([L-46, 1.4, 6]);
	translate([43, L+1.5*H+11, 45]) cube([L-46, 1.4, 6]);
}

//левые
color([0,0,0]){
	translate([31,-35.5,36]) cube([1.4, L/2+56, 6]);
	translate([31,L/2+20,45]) cube([1.4, L/2+10, 6]);
}

//правые
color([0,0,0]){
	translate([L+8,-35.5,45]) cube([1.4, L/2+56, 6]);
	translate([L+8,L/2+20,36]) cube([1.4, L/2+10, 6]);
}

//к башке
color([0,0,0]){
	translate([43,L/2+30,36]) cube([150, 1.4, 6]);
	translate([43,L/2+8,45]) cube([150, 1.4, 6]);
	translate([L,L/2+30,45]) mirror([1,0,0]) cube([150, 1.4, 6]);
	translate([L,L/2+8,36]) mirror([1,0,0]) cube([150, 1.4, 6]);
}

translate([L/2-2.7, L/2+6.5, 36.5]) head();
}//module

xy_complete();

//endstop x
translate([74, L/2+6.5, 53]) rotate([0,0,90]) endstop_holder();
translate([76, L/2-1, 53]) rotate([90,0,90]) endstop();

//endstop y
translate([53, 30, 21]) rotate([-90,180,0]) endstop();

translate([31.5,38+125,21]) endstop_plank();

translate([L/2-1 ,L/2+20.5,52.5]) rotate([0,0,-90]) endstop_plank();
