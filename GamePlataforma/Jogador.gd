extends KinematicBody2D

var velocidade = Vector2();


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocidade.x = 30;
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -30;
	else:
		velocidade.x = 0;
		
	move_and_slide(velocidade);