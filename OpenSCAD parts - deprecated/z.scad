//$fa=5; $fs=0.1;

use <parts.scad>

L=350; //длина профиля
Lz=350; //высота, профиль будет меньше, т.к. косяк заказа
H=20; //сечение профиля
J=5.5; // подъем от толщины соединителя

module z(){
	
	//держатели
	translate([0,100,0]) rotate([0,0,90]) sh12();// низ
	translate([0,-100,0]) rotate([0,0,90]) sh12();
	translate([0,100,Lz-9]) rotate([0,0,90]) sh12();// верх
	translate([0,-100,Lz-9]) rotate([0,0,90]) sh12();		
	
	//валы
	translate([-23,100, -2]) color([1,1,1]) cylinder(r=6, h=Lz+9);
	translate([-23,-100,-2]) color([1,1,1]) cylinder(r=6, h=Lz+9);

	// motor
	translate([0, 0, 45]) rotate([0,0,90]) motor_holder();
	translate([-H/2 - 42/2 - 5, 0, 21]) motor();
	
	// муфта
	translate([-36, 0, 81-8]) coupling();

	// ходовинт
	translate([-36, 0, 85-8]) cylinder(r=4, h=325);

	// подшипники
	translate([-23,100,200]) z_bearing();
	translate([-23,-100,200]) z_bearing();
	
}//m

z(); 

