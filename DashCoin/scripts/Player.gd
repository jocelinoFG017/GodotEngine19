extends Area2D

signal pickup
signal hurt
signal color

#var blu = Color(0,0,1)
# definindo que a  variavel blue  recebe a sprite + a sua cor que
#nesse caso vai ser azul
#onready var blue = $AnimatedSprite.set_modulate(blu)# blue
#onready  var red = $AnimatedSprite.set_modulate(Color(1,0,0))# blue


export ( int ) var speed


var velocity
var screensize = Vector2(480,720)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0 :
		velocity = velocity.normalized() * speed


func _process(delta):
	get_input()
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if velocity.length() > 0:
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = "idle"


func start(pos):
	set_process(true)
	position = pos
	$AnimatedSprite.animation = "idle"

func die():
	$AnimatedSprite.animation = "hurt"
	set_process(false)

func paused():
	$AnimatedSprite.animation = "idle"
	set_process(false)
func continues():
	set_process(true)

func _on_Player_area_entered(area):
	if area.is_in_group("coins"):
		area.pickup()
		emit_signal("pickup", "coin")
	if area.is_in_group("powerups"):
		area.pickup()
		emit_signal("pickup", "powerup")
	if area.is_in_group("obstacles"):
		emit_signal("hurt")
		die()

func _on_PlayerTwo_pressed():
	print("changed to blue")
	color_change()
	#$AnimatedSprite.set_modulate(Color(0,0,1))
	#$AnimatedSprite.set_modulate(Color(0, 0, 1))#blue

func color_change():
	$AnimatedSprited.set_modulate(Color(0,0,1))
	
#func _on_PlayerOne_pressed():
#	print("changed to green")
#	#$AnimatedSprite.set_modulate(Color(0, 1, 0))#green



func _on_Player_color():
	pass # Replace with function body.
