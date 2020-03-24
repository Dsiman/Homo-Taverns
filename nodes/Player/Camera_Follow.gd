extends Camera


# Declare member variables here. Examples:
export var distance = -5.0
export var height = 5

var pos = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_as_toplevel(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var target = get_parent().get_global_transform().origin
	
	pos.x = target.x 
	pos.y = target.y + height
	pos.z = target.z + distance
	
	var up = Vector3(0,1,0)
	
	look_at_from_position(pos, target, up)
