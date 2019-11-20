extends Node
signal sound_stoppped

func _ready():
	pass


func _on_Button_pressed():
	
	emit_signal("sound_stoppped")
