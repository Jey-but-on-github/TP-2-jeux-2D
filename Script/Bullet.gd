extends KinematicBody2D

export var speed = 500
var velocity = Vector2()

func start(pos, rot):
	position = pos
	rotation = rot
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if(collision):
		if(collision.collider.has_method("hit")):
			print("Object hit!")
			collision.collider.hit()
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #delete stuff

func hit():
	pass
