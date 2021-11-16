extends KinematicBody2D

export (int) var speed = 300;
var velocity = Vector2();
var bullet = preload("res://Scene/Player/Bullet.tscn")
var can_shoot = true
var is_gun = true
var dead = false

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
	if Input.is_action_just_pressed("switch"):
		switch()
	velocity = velocity.normalized() * speed

func shoot():
	if(can_shoot == true && is_gun == true):
		print("weapon fired!")
		var b = bullet.instance()
		b.start($Muzzle.global_position, rotation)
		$FireSFX.play()
		get_parent().add_child(b)
		can_shoot = false
		$ShootCooldown.start()

func _on_ShootCooldown_timeout():
	can_shoot = true

func switch():
	#switching to the flashlight
	if(is_gun == true): 
		is_gun = false
		$Gun/GunSprite.set_region(true)
		$FlashSFX.play()
	#switching back to the gun
	else:
		is_gun = true
		$Gun/GunSprite.set_region(false)
		$GunSFX.play()


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)

func hit():
	$PlayerDeathSFX.play()
	remove_child($Sprite)
	remove_child($Collision)
	remove_child($Gun)
	dead = true
	$GameoverDelay.start()

func _on_GameoverDelay_timeout():
	get_tree().change_scene("res://Scene/GameOver.tscn")
