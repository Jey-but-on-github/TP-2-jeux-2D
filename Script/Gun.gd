extends Node2D

var bullet = preload("res://Scene/Player/Bullet.tscn")

func get_input():
	if Input.is_action_pressed("fire"):
		print("fire input")
		shoot()

func shoot():
	print("bullet creation")
	var b = bullet.instance()
	b.start($Position.global_position, rotation)
	get_parent().add_child(b)

func _physics_process(_delta):
	get_input()
