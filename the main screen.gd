extends Control
const preloadd = preload("res://monkey.tscn")
func _process(_delta):
	pass
	
	
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_the_game_pressed():
	print("done")
	get_tree().change_scene("res://monkey.gd")
# Replace with function body.
