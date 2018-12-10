extends Node

export (PackedScene) var Mob
var score

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	pass # replace with function body

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	$HUD.update_score(score)
	$HUD.show_message("Prepare-se")

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	pass # replace with function body


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	pass # replace with function body


func _on_MobTimer_timeout():	
	$MobPath/MobSpawLocation.set_offset(randi())
	
	# Cria uma instancia do mob e adiciona a cena
	var mob = Mob.instance()
	add_child(mob)
	
	var direction = $MobPath/MobSpawLocation.rotation + PI/2
	mob.position = $MobPath/MobSpawLocation.position
	
	direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction
	
	mob.set_linear_velocity(Vector2(rand_range(mob.min_speed, mob.max_speed), 0).rotated(direction))
	pass # replace with function body









