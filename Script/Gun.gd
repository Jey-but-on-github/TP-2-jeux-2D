extends Node2D

var bullet = preload("res://Scene/Player/Bullet.tscn")

func get_input():
	if Input.is_action_pressed("fire"):
		print("bang")
		shoot()

func shoot():
	var b = bullet.instance()
	b.start(rotation, $Position.global_position)
	get_parent().add_child(b)
