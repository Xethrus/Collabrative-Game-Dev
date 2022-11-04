extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 200
var velocity = Vector2()
var health = 100
var facing = "right"
var walking = "right"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed	
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	
	move_and_slide(velocity)
	# look_at(get_global_mouse_position())

func _fixed_process(delta):
	update_sprite();

func update_sprite():

	var angle = rad2deg(get_floor_velocity().angle());
	if angle < 0: angle += 360;
	
	if 0 < angle < 180: facing = "right"; 
	else: facing = "left";
	
	# TODO: finish this with updating walking variable and updating animations
