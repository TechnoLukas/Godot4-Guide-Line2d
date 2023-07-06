extends Control

func _ready():
	# On left side
	for i in range(3):
		var line = Line2D.new() #creating new line2d
		line.width=randf_range(5,10)
		line.default_color=Color(randf_range(0,1),randf_range(0,1),randf_range(0,1))
		line.add_point(Vector2(randf_range(30,300),randf_range(30,size.y-30))) #creating one point in random place in specific range
		line.add_point(Vector2(randf_range(30,300),randf_range(30,size.y-30)))  #creating another point in random place in specific range
		add_child(line) #instanciating line
	
	# On right side
	for i in range(3):
		var line = Line2D.new() #creating new line2d
		line.width=randf_range(5,10)
		line.default_color=Color(randf_range(0,1),randf_range(0,1),randf_range(0,1))
		line.add_point(Vector2(randf_range(850,size.x-30),randf_range(30,size.y-30))) #creating one point in random place in specific range
		line.add_point(Vector2(randf_range(850,size.x-30),randf_range(30,size.y-30))) #creating another point in random place in specific range
		add_child(line) #instanciating line

