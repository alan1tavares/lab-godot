extends KinematicBody2D

const SPEED = 60;
const GRAVIDADE = 10;
const PULO_FORCA = -250;
const CHAO = Vector2(0, -1);

const NAO_ESPELHAR = Vector2(1, 1);
const ESPELHAR = Vector2(-1, 1);

var velocidade = Vector2();

var podePular = false;

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocidade.x = SPEED;
		$AnimationPlayer.play("run");
		$Sprite.scale = NAO_ESPELHAR;
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -SPEED;
		$AnimationPlayer.play("run");
		$Sprite.scale = ESPELHAR;
	else:
		velocidade.x = 0;
		if is_on_floor():
			$AnimationPlayer.play("idle");
		
	podePular = Input.is_action_pressed("ui_up") and is_on_floor();
	
	if podePular:
		velocidade.y = PULO_FORCA;
		
	velocidade.y += GRAVIDADE;
	
	if not(is_on_floor()): 
		if velocidade.y < 0:
			$AnimationPlayer.play("jump");
		else:
			$AnimationPlayer.play("fall");
	
	velocidade = move_and_slide(velocidade, CHAO);