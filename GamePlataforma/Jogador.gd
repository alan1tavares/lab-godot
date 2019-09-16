extends KinematicBody2D

const SPEED = 60;
const GRAVIDADE = 10;
const PULO_FORCA = -250;
const CHAO = Vector2(0, -1);

var velocidade = Vector2();

var podePular = false;

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocidade.x = SPEED;
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -SPEED;
	else:
		velocidade.x = 0;
		
	podePular = Input.is_action_pressed("ui_up") and is_on_floor();
	
	if podePular:
		velocidade.y = PULO_FORCA;
		
	velocidade.y += GRAVIDADE;
		
	velocidade = move_and_slide(velocidade, CHAO);