
// all in mm
cubieboard_pitch = 53;
ssd_pitch        = 76.6;
ssd_height       = 8;
material         = 1;
hole_diameter    = 3.4;
standoff_height  = 30 + ssd_height + 10;
u                = 10;
$fn              = 50;
height           = (2 * material) + hole_diameter;

difference() {
	union() {
		translate(v = [
			-height/2-hole_diameter/2, 
			-ssd_pitch/2, 
			-ssd_height/2,
		]) {
			cube([height, ssd_pitch, ssd_height]);
		}
	
		translate(v = [
			0, 
			-cubieboard_pitch/2, 
			-30-(ssd_height/2),
		]) {
			cylinder(h=standoff_height, r=height/2);
		}
	
		translate(v = [
			0, 
			cubieboard_pitch/2, 
			-30-(ssd_height/2),
		]) {
			cylinder(h=standoff_height, r=height/2);
		}

		translate(v = [
			-height/2-hole_diameter/2, 
			-ssd_pitch/2, 
			0,
		]) {
			rotate(a = [0, 90, 0]) { 		
				cylinder(h=height, r=ssd_height/2);
			}
		}

		translate(v = [
			-height/2-hole_diameter/2, 
			ssd_pitch/2, 
			0,
		]) {
			rotate(a = [0, 90, 0]) { 		
				cylinder(h=height, r=ssd_height/2);
			}
		}
	}

	union() {
		translate(v = [
			0, 
			-cubieboard_pitch/2, 
			-30-(ssd_height+u)/2,
		]) {
			cylinder(h=standoff_height+u, r=hole_diameter/2);
		}

		translate(v = [
			0, 	
			cubieboard_pitch/2, 
			-30-(ssd_height+u)/2,
		]) {
			cylinder(h=standoff_height+u, r=hole_diameter/2);
		}


		translate(v = [
			-height/2-hole_diameter/2, 
			-ssd_pitch/2, 
			0,
		]) {
			rotate(a = [0, 90, 0]) { 		
				cylinder(h=height+u/2, r=hole_diameter/2);
			}
		}

		translate(v = [
			-height/2-hole_diameter/2, 
			ssd_pitch/2, 
			0,
		]) {
			rotate(a = [0, 90, 0]) { 		
				cylinder(h=height+u/2, r=hole_diameter/2);
			}
		}

		translate(v = [
			-height-hole_diameter/2+0.1,
			(-ssd_pitch-u)/2, 
			-(ssd_height+0.1)/2,
		]) {
			cube([height, ssd_pitch+u, ssd_height+0.1]);
		}
	}
}