extends KinematicBody2D

var cible = null
var chasing = false
const vitesse = 100
export var vie = 1


func _physics_process(delta):
	if cible:
		var velocite = global_position.direction_to(cible.global_position)
		var collision = move_and_collide(velocite * vitesse * delta)
		if collision :
			collision.collider.hit()

func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		if(chasing == false):
			print("Zombie aggro'd to " + body.name)
			cible = body
			chasing = true
	
func hit():
	vie -= 1
	if vie == 0:
		queue_free()
