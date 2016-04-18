use <helper.scad>

//профиль
//module profile(length) {
//	color([0.7,0.7,0.7]) scale([1,1,length]) translate([-100, -100, -0.5]) import("prof20x20.stl", convexity=3);
//}
// упрощенный
module profile(length) {
    color([0.7,0.7,0.7])
        difference(){
            union(){
                cube([20,20,length], center=true);
            }//u
            union(){
                translate([-10, 0, 0]) cylinder(r=3, h=length+0.1, center=true);
                translate([10, 0, 0]) cylinder(r=3, h=length+0.1, center=true);
                translate([0, 10, 0]) cylinder(r=3, h=length+0.1, center=true);
                translate([0, -10, 0]) cylinder(r=3, h=length+0.1, center=true);
            }//u
        }//d
}//m

//profile(100);

// уголок профильный
module corner(){
	difference(){
		linear_extrude(height = 20) polygon([[0,0],[25,0],[25,5],[5,25],[0,25]]);
		
		union(){
			translate([-0.1, 17, 10]) rotate([0,90,0]) cylinder (r=2.2, h=20);
			translate([8, 17, 10]) rotate([0,90,0]) cylinder (r=6, h=10);
	
			translate([17, -0.1, 10]) rotate([-90,0,0]) cylinder (r=2.2, h=20);
			translate([17, 8, 10]) rotate([-90,0,0]) cylinder (r=6, h=20);
		}
	}
}

//corner();

//трехсторонний соединитель
module triway(){
	color([0,1,1]){
	translate([-10,-10,0]) cube([20,20,5.5]);
	translate([-25.5, -5.5/2, 0]) cube([15.5, 5.5, 5.5]);
	translate([-5.5/2, 10, 0]) cube([5.5, 15.5, 5.5]);
	translate([-5.5/2, -10, -15.5]) cube([5.5, 5.5, 15.5]);
	translate([10-5.5, -5.5/2, -15.5]) cube([5.5, 5.5, 15.5]);}
}

//triway();

//рельса MGN12 300мм
module rail(){
	difference(){
		union(){
			cube([300, 12, 8], center=true);
		}//u
		union(){
			for(xpos = [10 : 25 : 300]) {
				translate([-150+xpos, 0, 0]) cylinder(r=2, h=8.1, center=true);
				translate([-150+xpos, 0, 2]) cylinder(r=3, h=4.1, center=true);		
			}
		}//u
	}//d	
}//m

//рельса MGN12 350мм
module rail350(){
	difference(){
		union(){
			cube([350, 12, 8], center=true);
		}//u
		union(){
			for(xpos = [10 : 25 : 350]) {
				translate([-175+xpos, 0, 0]) cylinder(r=2, h=8.1, center=true);
				translate([-175+xpos, 0, 2]) cylinder(r=3, h=4.1, center=true);		
			}
		}//u
	}//d	
}//m

//каретка MGN12H
module carriage(){
	difference(){
		union(){
			translate([0,0,4]) color([0.7, 0, 0]) cube([45.4, 27, 10], center=true);
		}//u
		union(){
			translate([-10, -10, 6.5]) cylinder(h=5.1, r=1.5, center=true);
			translate([10, -10, 6.5]) cylinder(h=5.1, r=1.5, center=true);
			translate([-10, 10, 6.5]) cylinder(h=5.1, r=1.5, center=true);
			translate([10, 10, 6.5]) cylinder(h=5.1, r=1.5, center=true);
		}//u
	}//d
}//m

//NEMA17
module motor(){
	mwidth=42.3;
	mheight=48;
	difference(){
		union(){
			color([0.4, 0.4, 0.4]) cube([mwidth, mwidth, mheight], center=true);
			color([0.1, 0.1, 0.1]) translate([0, 0, mheight/2+1]) cylinder(h=2, r=11, center=true);
			color([0.8, 0.8, 0.8]) translate([0, 0, mheight/2+12]) cylinder(h=24, r=2.5, center=true);
		}
		union(){
			translate([-15.5, -15.5, mheight/2 - 2.25]) cylinder(h=4.6, r=1.5, center=true);
			translate([-15.5, 15.5, mheight/2 - 2.25]) cylinder(h=4.6, r=1.5, center=true);
			translate([15.5, -15.5, mheight/2 - 2.25]) cylinder(h=4.6, r=1.5, center=true);
			translate([15.5, 15.5, mheight/2 - 2.25]) cylinder(h=4.6, r=1.5, center=true);
		}
	}//difference
}//module

//GT2 20teeth pulley
module pulley(){
	translate([0,0,-8]) color([0,0.5,0])
	difference(){
		union(){
			translate([0,0,4.5]) cylinder(h=9, r=8, center=true);
			translate([0,0,9+3]) cylinder(h=6, r=6, center=true);
			translate([0,0,9+6+0.5]) cylinder(h=1, r=8, center=true);
		}//u
		union(){
			translate([0,0,8]) cylinder(h=16.1, r=2.5, center=true);
		}//u
	}//d
}//m

//608zz without washerz
module roller(){
	color([0,0,0.8])
	difference(){
		union(){
			cylinder(r=11, h=7, center=true);
			//translate([0,0,7/2+0.5]) cylinder(r=13, h=1, center=true);
			//translate([0,0,-7/2-0.5]) cylinder(r=13, h=1, center=true);
		}//u
		union(){
			cylinder(r=4, h=9.1, center=true);
		}//u
	}//d
}//m

//nema17 holder cnc-tech
module motor_holder(){
	color([1,0,0])
	difference(){
		union(){
			translate([-65/2,0,0]) cube([65,56,5]);
			translate([-65/2, 0, -45]) cube([65,5,45]);
		}//u
		union(){
			translate([0, 36, -0.1]) {
				cylinder(r=27/2, h=5.2);
				translate([-31/2,-31/2,0]) cylinder(r=1.75, h=5.2);
				translate([-31/2,31/2,0]) cylinder(r=1.75, h=5.2);
				translate([31/2,-31/2,0]) cylinder(r=1.75, h=5.2);
				translate([31/2,31/2,0]) cylinder(r=1.75, h=5.2);
			}//t

			translate([-65/2+7.5, 2.5, -45+7]){
				rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);
				translate([10,0,0]) rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);
				translate([40,0,0]) rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);
				translate([50,0,0]) rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);

				translate([0,0,25]){
					rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);
					translate([10,0,0]) rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);
					translate([40,0,0]) rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);
					translate([50,0,0]) rotate([90,0,0]) cylinder(r=2.5, h=5.1, center=true);
				}//t
			}//t
		}//u
	}//d
}//m

//motor_holder();
//motor_holder2();

// под подшипники

module 608washer_2dot5mm(){
	difference(){
		union(){
			translate([0,0,-0.25]) cylinder(h=2, r=13, center=true);
			translate([0,0,1]) cylinder(h=0.5, r=6, center=true);
		}//u

		cylinder(h=2.6, r=4.1, center=true);
	}//d
}//m

module 608washer_6mm(){
	difference(){
		union(){
			translate([0,0,-0.25]) cylinder(h=5.5, r=13, center=true);
			translate([0,0,3-0.25]) cylinder(h=0.5, r=6, center=true);
		}//u

		cylinder(h=6.1, r=4.1, center=true);
	}//d
}

// зубы под ремень передние
module gt2teeth(){
	color([0.5,0,0]){ 
			for(xpos = [0 : 2 : 12]){
				translate([xpos, -1,3]) cube([1,1,8]); 
			}//f
			translate([0, -5, 3]) cube([13,3,8]);
			translate([0,-5,0]) cube([13,5,3]);
	}//c
}//m

// зубы под ремень задние
module gt2teeth_back(){
	color([0.5,0,0]) translate([13, -7, 0]) rotate([0,0,180])  { 
			for(xpos = [0 : 2 : 12]){
				translate([xpos, -4,3]) cube([1,1,8]); 
			}//f
			translate([0, -7, 3]) cube([13,3,8]);
			translate([0, -2, 3]) cube([13,2,8]);
			translate([0,-7,0]) cube([13,7,3]);
	}//c

		//translate([13,-7,0]) rotate([-90,0,90]) linear_extrude(height=13) polygon([[0,0],[7,0],[0,3]]);
}//m

//gt2teeth_back();

// e3dv6+volcano
module volcano(){
	translate([0,0,1.85]) cylinder(h=3.7, r=8, center=true);
	translate([0,0,-3]) cylinder(h=6, r=6, center=true);
	translate([0,0,-7.5]) cylinder(h=3, r=8, center=true);
	translate([0,0,-11]) cylinder(h=4, r=4, center=true);
	translate([0,0,-26]) cylinder(h=26, r=11.15, center=true);
	translate([0,0,-40.25]) cylinder(h=2.5, r=2, center=true);
	translate([-4.5,-4.5,-61.5]) cube([11.5,20,20]);
	translate([0,0,-63]) cylinder(h=3, r=4, center=true);
	translate([0,0,-65.5]) cylinder(h=2, r1=1, r2=2, center=true);
}

// 40mm cooler
module 40mm_cooler(){
	color([0.3,0.3,0.3]){
	difference(){
		union(){
			cube([40,40,10], center=true);
		}//u

		union(){
			translate([-16, -16, 0]) cylinder(r=1.75, h=10.1, center=true);
			translate([-16, 16, 0]) cylinder(r=1.75, h=10.1, center=true);
			translate([16, -16, 0]) cylinder(r=1.75, h=10.1, center=true);
			translate([16, 16, 0]) cylinder(r=1.75, h=10.1, center=true);

			cylinder(r=19, h=10.1, center=true);
		}//u
	}//d

	cylinder(r=10, h=10, center=true);
	translate([0,0,-5])
	for(angle = [0 : 40 : 360]) {
		rotate([45,0,angle]) cube([17, 1, 10]);
	}//f
	}//c
}//m

// 40 mm blower
module 40mm_blower(){
	color([0.3,0.3,0.3]){
	difference(){
		union(){
			hull(){
				cylinder(r=20, h=20);
				translate([0,-20,0]) cube([20,30, 20]);		
			}
			
			//ухи
			hull(){
				translate([-17.5,-17.5,0]) cylinder(r=2.5, h=15);
				translate([-12, -12, 0]) cylinder(r=5, h=15);
			}
			
			hull(){
				translate([-17.5,17.5,0]) cylinder(r=2.5, h=15);
				translate([-12, 12, 0]) cylinder(r=5, h=15);
			}			

			hull(){
				translate([17.5,17.5,0]) cylinder(r=2.5, h=15);
				translate([12, 12, 0]) cylinder(r=5, h=15);
			}
		}//u
		union(){
			translate([0,0,2]) cylinder(r=18, h=16); //нутро
			translate([0,0,17.9]) cylinder(r=15, h=2.2);
			translate([0, -18, 2]) cube([20.1, 26, 16]);

			translate([17.5,17.5,-0.1]) cylinder(r=1.5, h=15.2); //крепежные
			translate([-17.5,17.5,-0.1]) cylinder(r=1.5, h=15.2);
			translate([-17.5,-17.5,-0.1]) cylinder(r=1.5, h=15.2);
		}//u
	}//d
	
	//крыльчатка
	translate([0,0,2]) cylinder(r=13, h=15);
	for(angle = [0 : 10 : 180]) translate([0,0,9.5]) rotate([0,0,angle]) cube([34, 1, 15], center=true); 	
		
	}//c
}//m

//SH12 держатель вала
module sh12(){
	color([0.9,0.9,0.9])
	difference(){
		union(){
			translate([-10,0,0]) cube([20, 37.5, 14]);
			translate([-21,0,0]) cube([42, 6, 14]);
		}//u
		union(){
			translate([0, 23, -0.1]) cylinder(r=6, h=14.2);
			translate([-0.5, 29-0.1, -0.1]) cube([1, 37.5-29+0.2, 14.2]);

			translate([-16, -0.1, 7]) rotate([-90,0,0]) cylinder(r=5.5/2, h=6.2);
			translate([16, -0.1, 7]) rotate([-90,0,0]) cylinder(r=5.5/2, h=6.2);
		}//u
	}//d
}//m

//sh12();

//SH16 держатель вала - он же держатель E3D!
module sh16(){
	color([0.9,0.9,0.9])
	difference(){
		union(){
			translate([-12.5,0,0]) cube([25, 44, 16]);
			translate([-24,0,0]) cube([48, 6, 16]);
		}//u
		union(){
			translate([0, 27, -0.1]) cylinder(r=8, h=16.2);
			translate([-0.5, 35-0.1, -0.1]) cube([1, 10, 16.2]);

			translate([-19, -0.1, 8]) rotate([-90,0,0]) cylinder(r=5.5/2, h=6.2);
			translate([19, -0.1, 8]) rotate([-90,0,0]) cylinder(r=5.5/2, h=6.2);

			translate([0,39.5,8]) rotate([0,90,0]) cylinder(r=2.2, h=25.1, center=true);
		}//u
	}//d
}//m

//sh16();

// муфта
module coupling(){
	color([1,1,1])
	difference(){
		union(){
			translate([0,0,-12.5]) cylinder(r=10, h=25);
		}//m
		union(){
			translate([0,0, -12.6]) cylinder(r=2.5, h=12.7);
			cylinder(r=4, h=12.7);
		}//m
	}//d
}//m
		
//coupling();

// воздуховод бловера
module blower_duct(){
	color([0,0.9,0]) difference(){
		union(){
			rotate([0,90,0]) cylinder(r=10, h=30, center=true);
			translate([-15, -10, 0]) cube ([30, 20, 21.5]);
			translate([-15, 0, -10]) cube([30, 21.5, 12]);
			translate([0,20,-3]) rotate([0,90,0]) cylinder(r=5, h=30, center=true);

			
		}//u
		union(){
            translate([0,20,-12]) rotate([0,90,0]) cylinder(r=6, h=30.1, center=true); //срез сопла
            //scale([2,1,1])
            {
            translate([0, 0, 12.1]) cube([26, 16, 19.1], center=true); //верх
            translate([0, 12, -4]) rotate([-25,0,0]) cube([26, 41.5, 5], center=true); //уклон
            translate([0, 5, 3]) cube([26, 6,9], center=true); //срезать уголок
            }
            
            translate([0, 20.5, -0.1]) rotate([-25,0,0]) cube([30.1, 20.5, 5], center=true); //верх снаружи
            translate([0, 0, -8]) rotate([-25,0,0]) cube([30.1, 30, 7], center=true); //низ снаружи
            
		}//u
	}//d
}//m

//lm12luu
module lm12luu(){
	color([0.5,0.5,0.5])
	difference(){
		cylinder(r=21/2, h=57, center=true);
		cylinder(r=12/2, h=57.1, center=true);
	}//d
}//m

// держатель подшипника Z
module z_bearing(){
	color([0.8,0.8,0.8])
	difference(){
		union(){
			cylinder(h=6, r=21); //фланец
			translate([0,0,-51]) cylinder(r=21/2+2, h=51);
		
		}//u
		union(){
			//крепеж фланца
			translate([-16,0,-0.1]) cylinder(r=2, h=6.2);
			translate([0,-16,-0.1]) cylinder(r=2, h=6.2);
			translate([16,0,-0.1]) cylinder(r=2, h=6.2);
			translate([0,16,-0.1]) cylinder(r=2, h=6.2);
			
			//под подшипник
			translate([0,0,-51.1]) cylinder(r=21/2+0.2, h=57.2);
			
		}//u
	}//d
	translate([0,0,-22.5]) lm12luu();
}//m

//z_bearing();

//-------------XY---------------
module xy(){
difference(){
		union(){
			translate([0,0,-35]) cube([33,45.4,38]); //основной кубикъ
			translate([-10,0,-8]) cube([10,45.4,11]); //влево
			translate([23,12.5,0]) cube([10,20.5,30]); //вверх
			translate([0,12.5,21]) cube([33, 20.5,10]); //крышка
		}//u
		union(){
			translate([-10.1, 15.1, -23.1]) cube([50,15.2,15.2]); //под профиль
			translate([-10.1, 16.6, -8.1]) cube([50, 12.2, 8.2]); //под рельсу

			translate([-0.1, 45.4/2, -35 + 27/2]){ //отверстия крепления к Y-каретке
				translate([0,-10,-10]) rotate([0,90,0]) cylinder(r=2, h=40);
				translate([0,10,-10]) rotate([0,90,0]) cylinder(r=2, h=40);
				translate([0,-10,10]) rotate([0,90,0]) cylinder(r=2, h=40);
				translate([0,10,10]) rotate([0,90,0]) cylinder(r=2, h=40);
			}

			translate([10,22.7,0]) cylinder(r=4.2, h=50); // под ось

			translate([17, -0.1, -15]) rotate([-90,0,0]) cylinder(r=1.7, h=50); // фиксировать профиль
		}//u
	}//d
}//m

//xy();

// задний держатель
module back_holder(){
	difference(){
		union(){
			cube([50,20,14.5]); //основа
			translate([28,0,14.5]) cube([10,20,28]); //вверх
			translate([5,0,32.5]) cube([33,20,10]); //крышка

			translate([0,-10,-20]) cube([38,10,34.5]);//обхват
			translate([0,20,-20]) cube([38,10,34.5]);
		}//u
		union(){
			translate([25, -10.1, -10]) rotate([-90,0,0]) cylinder(r=2.2, h=40.2); //боковые
			translate([44, 10, -0.1]) cylinder(r=2.2, h=15); //верхнее
			translate([15, 10, -0.1]) cylinder(r=4.2, h=50); //под ось

			translate([9, -10.1, -10]) rotate([-90,0,0]) cylinder(r=2.2, h=12); //бокоуголковое
		}//u
	}//d

	translate([-8,0,-20]) rotate([0,0,-90]) corner(); //уголок сюда

}//m

//back_holder();

module head_base(){
difference(){
		union(){
			color([0.5,0,0.5]) {
				translate([(45.4-46)/2, 0, 0]) cuberv([46,24.5,16]); //основа
				translate([(45.4-30)/2, 24.5-3, 0]) cuberv([30,3+3,16]); //основа2
				translate([-14.3-2,2.5,0]) cuberv([22+2,22,16]); //лев
				translate([(45.4-30)/2+30,2.5,0]) cuberv([22+2,22,16]); //прав
				
				translate([(45.4-30)/2+39-1.3,2.5,-4.5]) cube([14.3,22,4.5]); //прав-низ

				translate([-14.3,2.5,-4.5]) cube([14.3,22,4.5]); //лев-низ
			
			}
			translate([-14.3, 2.55,4.5]) gt2teeth(); //передний левый крепеж - верхний ремень
			translate([46.7, 2.55,-4.5]) gt2teeth(); //передний правый крепеж - нижний ремень

			translate([-14.3, 29.5, -4.5]) gt2teeth_back(); //задний левый крепеж - нижний ремень
			translate([46.7, 29.5, 4.5]) gt2teeth_back(); //задний правый крепеж - верхний ремень

		}//u
		union(){
			translate([12.7,3.5,10]){ //крепление к каретке
				cylinder(r=2, h=20.1, center=true);
				translate([20,0,0]) cylinder(r=2, h=20.1, center=true);
				translate([0,20,0]) cylinder(r=2, h=20.1, center=true);
				translate([20,20,0]) cylinder(r=2, h=20.1, center=true);
			}
			// крепление держателя хотэнда к карррретке
			translate([3.6, 12, 8]) rotate([-90,0,0]) cylinder(r=2, h=33, center=true);
			translate([3.6+38, 12, 8]) rotate([-90,0,0]) cylinder(r=2, h=33, center=true);

		}//u
	}//d
}//m


//head_base();

module head(){
	difference(){
		union(){
			head_base();
			translate([22.7,0,0]) rotate([0,0,180]) sh16();
			translate([22.7,-27,12.5]) color([0.8,0.8,0.7]) volcano();
		}//u
		union(){
		
		}//u
	}//d
}
//head();

module roller_washer(){
    difference(){
        union(){
            cylinder(r=12.5, h=0.6);
            translate([0,0,0.6]) cylinder(r=6, h=0.4);
        }
        translate([0,0,-0.1]) cylinder(r=4.2, h=1.2);
    }
}

// оптический концевик
module endstop(){
	difference(){
		union(){
			color([1,0,0]) cube([33,10,1]);
			color([0.2,0.2,0.2]){
			translate([9,2,1]) cube([24,6,3]);
			translate([15,2,4]) cube([4.5,6,8]);
			translate([22.5,2,4]) cube([4.5,6,8]);
			}

			color([0.9,0.9,0.9]) translate([1,1,-8]) cube([4,8,8]);
		}
		union(){
			translate([11.5,5,-0.1]) cylinder(r=1.5, h=4.2);
			translate([11.5+19,5,-0.1]) cylinder(r=1.5, h=4.2);
		}
	}
}
		
//endstop();

module endstop_plank(){
	cube([1,9.3,10]);
	translate([-2,6,0]) cube([5,3.3,10]);
}

module endstop_holder(){
	difference(){
		union(){
			cube([27,8,8]);
			translate([1,-2,0]) cube([6,2,8]);
			translate([20,-2,0]) cube([6,2,8]);
		}
		union(){
			translate([1,2,2]) cube([6,4,6.1]);
			translate([20,2,2]) cube([6,4,6.1]);

			translate([4,-2.1,5]) rotate([-90,0,0]) cylinder(r=1.7, h=10.2);
			translate([23,-2.1,5]) rotate([-90,0,0]) cylinder(r=1.7, h=10.2);
		}
	}
}

//endstop_holder();