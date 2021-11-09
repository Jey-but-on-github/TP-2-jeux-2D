extends KinematicBody2D

var cible = null
const vitesse = 100
export var vie = 1


func _physics_process(delta):
	if cible:
		var velocite = global_position.direction_to(cible.global_position)
		var collision = move_and_collide(velocite * vitesse * delta)
		if collision :
			collision.collider.hit()
			

func _on_Area2D_body_entered(body):
	print(body.name)
	cible = body
	
func hit():
	vie -= 1
	if vie == 0:
		queue_free()


