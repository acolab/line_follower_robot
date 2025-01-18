


//projection()
intersection(){
 union(){
    // translate([0,0, thickness/4]) 
      cube(size = [27, 10, 2]);//, center = true);
     translate([-5,-2.5, 0]) 
     cube(size = [5, 15, 2]);//, center = true);
        
        
    }
     union(){
         translate([-5,-2.5, 0]) 
         cylinder(h = 5, r1 = 2, r2 = 2, center =true, $fn=50);
     }
}