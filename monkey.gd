extends Node

onready var viewport1 = $HBoxContainer/ViewportContainer1/Viewport1
onready var viewport2 = $HBoxContainer/ViewportContainer2/Viewport2

onready var camera1 = $HBoxContainer/ViewportContainer1/Viewport1/Camera2D
onready var camera2 = $HBoxContainer/ViewportContainer2/Viewport2/Camera2D

onready var world = $HBoxContainer/ViewportContainer1/Viewport1/main


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	viewport2.world_2d = viewport1.world_2d
	
	camera2.target = world.get_node("tank")
	camera1.target = world.get_node("tank2")# Replace with function body.
	
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
