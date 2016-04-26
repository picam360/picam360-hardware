
module round_corner(r1=10,r2=20,t1=0,t2=45,debug=false)
{
	if(debug)
	{
		color([1,0,0])
   			linear_extrude(height = 5, twist = 0, slices = 0)
		    	intersection()
		    	{
		        	polygon(points=[[0,0],[r2*2*cos(t1),r2*2*sin(t1)],[r2*2*cos(t2),r2*2*sin(t2)]]);
		        	circle(r=r2);
		        }
		color([0,0,1])
   			linear_extrude(height = 5, twist = 0, slices = 0)
        		circle(r=r1);
	}
    difference()
    {
    	intersection()
    	{
        	polygon(points=[[0,0],[r2*2*cos(t1),r2*2*sin(t1)],[r2*2*cos(t2),r2*2*sin(t2)]]);
        	circle(r=r2);
        }
        circle(r=r1);
    }
}

round_corner();