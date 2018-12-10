extends Area2D
signal hit
# export faz com que a varivel esteja disponvel no Inspertor
export (int) var speed
var screensize

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	screensize = get_viewport_rect().size
	hide()
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play();
		# Isso e a mesma coisa de get_node("AnimatedSprite").play()
	else:
		$AnimatedSprite.stop()
	
	# Atualizar a posiçao do jogador
	position += velocity * delta
	# clamp restringe que um determinado valor esteja em um intervalo
	# Evitar que o jogador sai da tela
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	# Selecionando animacoes
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0
	pass


func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.disabled = true
	pass # replace with function body

# Usada para reiniciar a posiçao do jogador
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
	
	
	
	
	