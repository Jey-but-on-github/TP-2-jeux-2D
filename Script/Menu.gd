extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Quitter_pressed():
	get_tree().quit()


func _on_Jouer_pressed():
	Global.goto_scene("res://Scene/Maps/Lvl1.tscn")


func _on_replay_pressed():
	pass # Replace with function body.
