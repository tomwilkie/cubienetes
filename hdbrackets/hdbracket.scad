
// all in mm
cubieboard_pitch = 53;
ssd_pitch        = 76.2;
material         = 1;
hole_diameter    = 3;
standoff_height  = 35;
u                = 10;
$fn              = 50;
height           = (2 * material) + hole_diameter;

difference() {
	union() {
		translate(v = [-height/2, -ssd_pitch/2, 0]) {
			cube([height/2, ssd_pitch, height]);
		}
	
		translate(v = [0, -cubieboard_pitch/2, -standoff_height/2]) {
			cylinder(h=standoff_height, r=height/2);
		}
	
		translate(v = [0, cubieboard_pitch/2, -standoff_height/2]) {
			cylinder(h=standoff_height, r=height/2);
		}

		translate(v = [-height/2, -ssd_pitch/2, height/2]) {
			rotate(a = [0, 90, 0]) { 		
				cylinder(h=height/2, r=height/2);
			}
		}

		translate(v = [-height/2, ssd_pitch/2, height/2]) {
			rotate(a = [0, 90, 0]) { 		
				cylinder(h=height/2, r=height/2);
			}
		}
	}

	translate(v = [0, -cubieboard_pitch/2, -(standoff_height+u)/2]) {
		cylinder(h=standoff_height+u, r=hole_diameter/2);
	}

	translate(v = [0, cubieboard_pitch/2, -(standoff_height+u)/2]) {
		cylinder(h=standoff_height+u, r=hole_diameter/2);
	}

	translate(v = [-(height+u)/2, -ssd_pitch/2, height/2]) {
		rotate(a = [0, 90, 0]) { 		
			cylinder(h=height+u/2, r=hole_diameter/2);
		}
	}

	translate(v = [-(height+u)/2, ssd_pitch/2, height/2]) {
		rotate(a = [0, 90, 0]) { 		
			cylinder(h=height+u/2, r=hole_diameter/2);
		}
	}
}