extends KinematicBody2D

var vector
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	var collision_info = (vector.normalized())
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
