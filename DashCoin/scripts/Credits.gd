extends CanvasLayer

func _ready():
	pass


func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Label2_pressed():
	get_tree().change_scene("res://scenes/Special.tscn")
