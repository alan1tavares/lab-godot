extends CanvasLayer

signal start_game

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func show_message(text):
	$MessageLabel.text = text
	$ScoreLabel.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Desvie dos Bichos!"
	$MessageLabel.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$MessageLabel.hide()
	pass # replace with function body

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	pass # replace with function body
