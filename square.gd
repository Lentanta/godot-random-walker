extends Node2D

@export var SQRT_SiZE = 30
@export var square_pos = Vector2(320, 320)

@export var color:Color = Color.WHITE
var path : Array[Vector2] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rnd_num = randi_range(1, 4)
	var viewport_size = get_viewport().get_visible_rect().size
	var width = viewport_size.x
	var height = viewport_size.y
	
	if (rnd_num == 1 && square_pos.y - SQRT_SiZE > 0):
		square_pos.y -= SQRT_SiZE
	elif (rnd_num == 2 && square_pos.x + SQRT_SiZE < width):
		square_pos.x += SQRT_SiZE 
	elif (rnd_num == 3 && square_pos.y + SQRT_SiZE < height):
		square_pos.y += SQRT_SiZE 
	elif (rnd_num == 4 && square_pos.x - SQRT_SiZE  > 0):
		square_pos.x -= SQRT_SiZE
		
	path.append(square_pos)
	if path.size() > 1000:
		#path.pop_front()
		path = []
		
	queue_redraw()

func _draw() -> void:
	for p in path:
		var square_size = Vector2(SQRT_SiZE, SQRT_SiZE)
		draw_rect(Rect2(p, square_size), color)
