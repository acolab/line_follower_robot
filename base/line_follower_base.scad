
thickness = 1;

big_radius= 190 / 2;
screw_radius_1 = 4/2;
wire_hole_radius = 8;

wheel_diameter = 70;
wheel_width = 25+4;

motor_slot_width = 3;
motor_slot_length = 12;
motor_width = 20;
motor_screw_to_axis = 19;

caster_width = 35;
caster_length = 39;

ir_dist_between_holes = 12;

h_bridge_hole_dist = 38;

battery_pack_hole_dist = 22;

projection()
intersection(){
difference(){
cylinder(h = thickness/2, r1 = big_radius, r2 = big_radius, center =true, $fn=50);
union(){
    
    // wheel slots
    translate([0,big_radius-wheel_width/2,0]) 
    cube(size = [wheel_diameter,wheel_width,thickness], center = true);
    
    translate([0,-big_radius+wheel_width/2,0]) 
    cube(size = [wheel_diameter,wheel_width,thickness], center = true);
    
    
    // motors slots
    y_motor_slot = big_radius-wheel_width-motor_slot_width/2;
    
    translate([-motor_screw_to_axis,y_motor_slot,0]) 
    cube(size = [motor_slot_length,motor_slot_width,thickness], center = true);
    
    translate([-motor_screw_to_axis,y_motor_slot-motor_slot_width-motor_width,0]) 
    cube(size = [motor_slot_length,motor_slot_width,thickness], center = true);
    
    translate([-motor_screw_to_axis,-y_motor_slot,0]) 
    cube(size = [motor_slot_length,motor_slot_width,thickness], center = true);
    
    translate([-motor_screw_to_axis,-(y_motor_slot-motor_slot_width-motor_width),0]) 
    cube(size = [motor_slot_length,motor_slot_width,thickness], center = true);
    
    //caster
    caster_offset = 10;
    caster_center = [-big_radius+caster_width/2+caster_offset,0,0];
    translate(caster_center)
    translate([0,caster_length/2,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(caster_center)
    translate([0,-caster_length/2,0])  
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    
    //IR
    ir_rotation= -12;
    ir_dy = 18/2;
    ir_center = [-big_radius+6,0,0];
    
    translate(ir_center)
    rotate(ir_rotation, [0,0,1])
    translate([0, ir_dy,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(ir_center)
    rotate(ir_rotation, [0,0,1])
    translate([0, ir_dist_between_holes + ir_dy,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(ir_center)
    rotate(-ir_rotation, [0,0,1])
    translate([0, -ir_dy,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(ir_center)
    rotate(-ir_rotation, [0,0,1])
    translate([0, -ir_dist_between_holes -ir_dy,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
  /*  translate(ir_center)
    rotate(-ir_rotation, [0,0,1])
    translate([0, -ir_dist_between_holes -ir_dy,0])
    cube(size = [10,42,thickness], center = true);*/    

    //arduino
    arduino_center = [71,-2, 0];
    arduino_rotation = 180;
    
    translate(arduino_center)
    rotate(arduino_rotation, [0,0,1])
    translate([0, 0,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(arduino_center)
    rotate(arduino_rotation, [0,0,1])
    translate([50.8, -15.2,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(arduino_center)
    rotate(arduino_rotation, [0,0,1])
    translate([50.8, -43.1,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(arduino_center)
    rotate(arduino_rotation, [0,0,1])
    translate([-1.3, -48.2,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
   
    
    //H bridge
    
   // h_bridge_center = [52, -40, 0];
   h_bridge_center = [50, -34, 0];

   // h_bridge_rotation = -35;
    
    translate(h_bridge_center)
    rotate(h_bridge_rotation, [0,0,1])
    translate([h_bridge_hole_dist/2, h_bridge_hole_dist/2,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(h_bridge_center)
    rotate(h_bridge_rotation, [0,0,1])
    translate([h_bridge_hole_dist/2, -h_bridge_hole_dist/2,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(h_bridge_center)
    rotate(h_bridge_rotation, [0,0,1])
    translate([-h_bridge_hole_dist/2, -h_bridge_hole_dist/2,0])  
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(h_bridge_center)
    rotate(h_bridge_rotation, [0,0,1])
    translate([-h_bridge_hole_dist/2, h_bridge_hole_dist/2,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
   //battery pack
    
    battery_pack_center = [-43, battery_pack_hole_dist/2 +2, 0];
    battery_roation = 90;
    
    translate(battery_pack_center)
    rotate(battery_roation , [0,0,1])
    translate([ battery_pack_hole_dist/2,0,0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    translate(battery_pack_center)
    rotate(battery_roation , [0,0,1])
    translate([ -battery_pack_hole_dist/2,0, 0]) 
    cylinder(h = thickness, r1 = screw_radius_1, r2 = screw_radius_1, center =true);
    
    //interrupteur
    interrupteur_width = 8.5;
    interrupteur_length = 13;
    //interrupteur_center = [25-big_radius, -37, 0];
    
    interrupteur_center = [big_radius-13, -18, 0];
    
    translate(interrupteur_center) 
    cube(size = [interrupteur_width,interrupteur_length,thickness], center = true);
    
    // hole for interrupteur  cables
    translate(interrupteur_center) 
    //translate([-5, -19, 0])
    translate([-35, -50, 0])
    rotate(-20 , [0,0,1])
    cylinder(h = thickness, r1 = 5, r2 = 5, center =true);

    
    //hole for wires
    translate([ 0,0, 0]) 
    cylinder(h = thickness, r1 = wire_hole_radius, r2 = wire_hole_radius, center =true);
    
    translate([5, -30, 0]) 
    cube(size = [10,12,thickness], center = true);
    
    translate([5, 30, 0]) 
    cube(size = [10,12,thickness], center = true);
    
    
    //hole for the battery connector
    //    translate([50-big_radius, -30, 0]) 
    //cube(size = [10,15,thickness], center = true);
    
    
  /*  translate([ -50,-40, 0]) 
    cylinder(h = thickness, r1 = wire_hole_radius, r2 = wire_hole_radius, center =true);
    
    translate([ -50,40, 0]) 
    cylinder(h = thickness, r1 = wire_hole_radius, r2 = wire_hole_radius, center =true);*/
    
  
   translate([-60, -50 ,0])
   rotate(90 , [0,0,1])
   scale([0.2,0.2,0.5])
   import("ACoLab_5mm.stl", convexity=10);
   //import("acolab.svg");
    
    
}

}

//make the base thinner
cube(size = [2*big_radius+10,2*big_radius-30,thickness], center = true);

}
