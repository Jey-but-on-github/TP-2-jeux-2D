extends Node2D


export var next_scene = ""

onready var lumiere = $Lumiere


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("hello you")
		if Global.key == true:
			Global.goto_scene(next_scene)
		else:
			pass


func _physics_process(delta):
	if Global.key == true:
		lumiere.enabled = true
	else:
		lumiere.enabled = false
		



