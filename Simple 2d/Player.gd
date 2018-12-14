extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 10
const JUMP_HEIGHT = -200
const SPEED = 100

var motion = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("right")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("right")
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		$AnimatedSprite.play("jump")
	
	motion = move_and_slide(motion, UP)