extends ColorRect

var graph #stores line2d object
var gridlist=[] #stores line2d objects for grid to be resizable

var xs=50 #x step
var angle=0 #angle for sin function

func _ready(): #instancing first time graph line
	graph = Line2D.new()
	add_child(graph)


func _process(delta):
	gridlist = draw_grid(15,15,Color(0.1,0.2,0.1),gridlist) #updating grid so it would scale when window scales
	graph=draw_graph(graph,xs,Color(0,1,0),9) #drawing/updating main graph


func draw_graph(grh,step,col,width):
	if is_instance_valid(grh): #cheking if it is possible to delete instance to redraw it
		grh.queue_free() 
	grh = Line2D.new() #creating new line2d
	grh.width=width
	grh.default_color=col
	for i in range(step+1):
		grh.add_point(Vector2(size.x/step*i,size.y/2+sin(angle)*size.y/3)) 
		
		angle+=0.5
	add_child(grh) #instanciating line
	
	return grh


func draw_grid(yn,xn,col,list=[]):
	if list!=[]: 
		for item in list: #removing everline in grid to redraw it.
			item.queue_free()
	
	var ystep = size.y/yn
	var xstep = size.x/xn
	var linelist=[]
	
	for i in range (yn+1):
		var line = Line2D.new() #creating new line2d
		line.width=2
		line.default_color=col
		line.add_point(Vector2(0,ystep*i))
		line.add_point(Vector2(size.x,ystep*i))
		linelist.append(line)
		add_child(line) #instanciating line
		
	for i in range (xn+1):
		var line = Line2D.new() #creating new line2d
		line.width=2
		line.default_color=col
		line.add_point(Vector2(xstep*i,0))
		line.add_point(Vector2(xstep*i,size.y))
		linelist.append(line)
		add_child(line) #instanciating line
		
	return linelist
