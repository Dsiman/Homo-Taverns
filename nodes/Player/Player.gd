extends KinematicBody


var gravity = -9
var velocity = Vector3()
var camera
var anim_player
var character
var equiped = "Hands"

const SPEED = 10
const ACCELERATION = 10
const DE_ACCELERATION = 20

#######################################################################################################
# Called when the node enters the scene tree for the first time.
func _ready():
	character = get_node(".")
#######################################################################################################
func _process(d):
		#Interaction With Objects
		
	if $InteractionRay.is_colliding():
		var x = $InteractionRay.get_collider()
		if x.has_method("interact"):
			$InteractionText.set_text("[E]  Test: " + x.get_name())
		elif not x.get("tooltip") == null:
			var tooltip = x.get("tooltip")
			$InteractionText.set_text(tooltip)	
		else:
			$InteractionText.set_text("")
	else:
		$InteractionText.set_text("")
			
#######################################################################################################
func _physics_process(delta):
# Player and camera movement
	camera = get_node("CameraTarget/Camera").get_global_transform()
	var dir = Vector3()

	var is_moving = false
		
	if(Input.is_action_pressed("move_up")):
		dir += Vector3(0,0,1)
		is_moving = true
	if(Input.is_action_pressed("move_down")):
		dir += Vector3(0,0,-1)
		is_moving = true
	if(Input.is_action_pressed("move_left")):
		dir += Vector3(1,0,0)
		is_moving = true
	if(Input.is_action_pressed("move_right")):
		dir += Vector3(-1,0,0)
		is_moving = true
	
	dir.y = 0
	dir = dir.normalized()
	
	velocity.y += delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		
		var char_rot = character.get_rotation()
		char_rot.y = angle
		character.set_rotation(char_rot)
#######################################################################################################
func _input(event):

	if Input.is_action_just_pressed("Menu"):
		print("Open Menu")
			
	if Input.is_action_just_pressed("Inv"):
		print("Open Inventory")
	# If already carries an object - release it, otherwise (if ray is colliding) pick an object up
	if Input.is_action_just_pressed("interact"):
		if $InteractionRay.is_colliding():
			var x = $InteractionRay.get_collider()
			if x.has_method("interact"):
				x.interact(self, equiped)
			elif x.has_method("pick_up"):
				print("")
			else:
				print("Interatable but has no method")
