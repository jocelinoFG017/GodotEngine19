extends CanvasLayer

signal start_game
signal pause_game
signal continue_game


func _ready():
	$BackButton.hide()
	$PauseButton.hide()
	$Cactus.hide()


func update_score(value):
	$MarginContainer/ScoreLabel.text = str(value)

func update_timer(value):
	$MarginContainer/TimeLabel.text = str(value)

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func _on_MessageTimer_timeout():
	$MessageLabel.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	$CreditsButton.hide()
	$Exitbutton.hide()
	$CharacterButton.hide()
	$MessageLabel.hide()
	$SettingsButton.hide()
	$SettingsButton.hide()
	$BackButton.show()
	$PauseButton.show()
	$Cactus.show()
	emit_signal("start_game")


func _on_PauseButton_pressed():
	$PauseButton.hide()
	$ContinueButton.show()
	emit_signal("pause_game")

func _on_ContinueButton_pressed():
	$ContinueButton.hide()
	$PauseButton.show()
	emit_signal("continue_game")
	

func show_game_over():
	show_message("Game over")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$CreditsButton.show()
	$Exitbutton.show()
	$CharacterButton.show()
	$SettingsButton.show()
	$MessageLabel.text = "Coin Dash"
	$MessageLabel.show()


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")


func _on_Exitbutton_pressed():
	get_tree().quit()


func _on_CharacterButton_pressed():
	get_tree().change_scene("res://Character.tscn")



func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_SettingsButton_pressed():
	get_tree().change_scene("res://scenes/Configuration.tscn")
