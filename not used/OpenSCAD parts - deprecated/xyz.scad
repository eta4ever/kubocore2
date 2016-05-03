//$fa=5; $fs=0.1;

use <parts.scad>
use <xy.scad>
use <z.scad>

L=350; //длина профиля
Lz=350; //высота, 
H=20; //сечение профиля
J=5.5; // подъем от толщины соединителя

xy_complete();

//z prof
translate([H/2,H/2,-Lz/2+H-J]) profile(Lz);
translate([H/2,L+1.5*H,-Lz/2+H-J]) profile(Lz);
translate([L+1.5*H,H/2,-Lz/2+H-J]) profile(Lz);
translate([L+1.5*H,L+1.5*H,-Lz/2+H-J]) profile(Lz);

// нижние 3way
translate([H/2,H/2,-Lz+H-J]) rotate([0,180,0]) triway();
translate([H/2,L+1.5*H,-Lz+H-J]) rotate([0,180,-90]) triway();
translate([L+1.5*H,H/2,-Lz+H-J]) rotate([0,180,90]) triway();
translate([L+1.5*H,L+1.5*H,-Lz+H-J]) rotate([0,180,180]) triway();

// нижние Y
translate([H/2, L/2+H, -Lz-2*J+1.5*H]) rotate([90,0,0]) profile(L);
translate([L+1.5*H, L/2+H, -Lz-2*J+1.5*H]) rotate([90,0,0]) profile(L);

// нижние X
translate([L/2+H, H/2, -Lz-2*J+1.5*H]) rotate([0,90,0]) profile(L);
translate([L/2+H, L+1.5*H, -Lz-2*J+1.5*H]) rotate([0,90,0]) profile(L);

// левая 
//translate([0, L/2+H, -Lz+12]) z();

// правая Z
//translate([L+40, L/2+H, -Lz+12]) rotate([0,0,180]) z();

// задняя Z
translate([L/2+H, L+20, -Lz+12]) rotate([0,0,90]) z();

// столЪ левоправый
//color([0.5,0.5,0]) translate([-55,50, -160]) cube([550,340,12]);

// столЪ задний
color([0.5,0.5,0]) translate([45,40, -150]) cube([L-50,L-10,12]);

//днище
//color([0.9,0.9,0.7]) translate([0,0, -Lz-3]) cube([L+2*H,L+2*H,12]);

//задняя стенка
//color([0.9,0.9,0.7]) translate([0,L+2*H, -Lz-3]){
//	cube([28,12,Lz+23]);
//	translate([28,0,0]) cube([38,12,Lz+3]);
//	translate([28+38,0,0]) cube([L-92,12,Lz+23]);
//	translate([28+38+L-92,0,0]) cube([38,12,Lz+3]);
//	translate([28+38+L-92+38,0,0]) cube([28,12,Lz+23]);
//}

// уголкиииии
color([0.8,0,0.8]){
	translate([0,20,0]) rotate([0,90,0]) corner();
	translate([L+20,20,0]) rotate([0,90,0]) corner();
	
	translate([20,L,0]){
		translate([0,20,0]) rotate([0,90,180]) corner();
		translate([L+20,20,0]) rotate([0,90,180]) corner();

		translate([0,40,0]) rotate([0,90,-90]) corner();
		translate([L,20,0]) rotate([0,90,90]) corner();
	}
		
	translate([20,20,-Lz+10]) rotate([0,0,0]) corner();
	translate([20,20,-Lz+30]) rotate([0,-90,0]) corner();
	translate([20,20,-Lz+30]) rotate([90,0,0]) corner();
	
	translate([0,L,0]){
		translate([20,20,-Lz+10]) rotate([0,0,-90]) corner();
		translate([0,20,-Lz+30]) rotate([0,-90,180]) corner();
		translate([20,40,-Lz+30]) rotate([90,0,0]) corner();
	}
	
	translate([L,0,0]){
		translate([20,20,-Lz+10]) rotate([0,0,90]) corner();
		translate([40,20,-Lz+30]) rotate([0,-90,0]) corner();
		translate([20,0,-Lz+30]) rotate([90,0,180]) corner();
	}

		translate([L,L,0]){
		translate([20,20,-Lz+10]) rotate([0,0,180]) corner();
		translate([20,20,-Lz+30]) rotate([0,-90,180]) corner();//
		translate([20,20,-Lz+30]) rotate([90,0,180]) corner();//
	}
}