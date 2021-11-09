extends KinematicBody2D

export (int) var speed = 300;
var velocity = Vector2();
var bullet = preload("res://Scene/Player/Bullet.tscn")
var can_shoot = true

func get_input():
	#movement input#
	velocity = Vector2()
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_just_pressed("fire"):
		shoot()
	velocity = velocity.normalized() * speed

func shoot():
	if(can_shoot == true):
		var b = bullet.instance()
		b.start($Muzzle.global_position, rotation)
		get_parent().add_child(b)
		can_shoot = false
		$ShootCooldown.start()

func _on_ShootCooldown_timeout():
	can_shoot = true


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
