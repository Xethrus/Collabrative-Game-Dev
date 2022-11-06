extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 200
var velocity = Vector2()
var health = 100
var walkingleft = false;
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
	
	velocity = velocity.clamped(speed)
	
	
	move_and_slide(velocity)
	# look_at(get_global_mouse_position())
	update_sprite();

func update_sprite():
	var animator = get_node("christopher_animations")
	
	var facingleft = false;
	var angle = rad2deg($christopher_animations.global_position.angle_to_point(get_global_mouse_position()));
	if abs(angle) < 90: facingleft = true;
	
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		walkingleft = true;
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):	
		walkingleft = false;
	
	if !facingleft: animator.play("w_right", (facingleft != walkingleft)); else: animator.play("w_left", (facingleft != walkingleft));
	
	# if walkingleft: print_debug("going left"); else: print_debug("going right")
	# if animator.flip_h: print_debug("facing left"); else: print_debug("facing right")
	# print_debug(angle);
	
	
	# TODO: finish this with updating walking variable and updating animations
