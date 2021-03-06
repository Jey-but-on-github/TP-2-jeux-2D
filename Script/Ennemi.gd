extends KinematicBody2D

var cible = null
var chasing = false
const vitesse = 100
export var vie = 1
var rng = randi()%3 + 1


func _physics_process(delta):
	if cible:
		var velocite = global_position.direction_to(cible.global_position)
		var collision = move_and_collide(velocite * vitesse * delta)
		if collision :
			collision.collider.hit()

func _on_Area2D_body_entered(body):
	print(body)
	if(body.name == "Player"):
		if(chasing == false):
			if(rng == 1): 
				$ZombieSFX1.play()
			if(rng == 2):
				$ZombieSFX2.play()
			if(rng == 3):
				$ZombieSFX3.play()
			print("Zombie aggro'd to " + body.name)
			print(rng)
			cible = body
			chasing = true
	
func hit():
	if vie > 1:
		$ZombieHurtSFX.play()
		vie -= 1
	else:
		$ZombieDeathSFX.play()
		remove_child($Sprite)
		remove_child($CollisionShape2D)
		remove_child($Area2D)
