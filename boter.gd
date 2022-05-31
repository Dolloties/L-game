extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var person = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var button_left = $links_boven
	
	button_left.connect("pressed", self, "_button_left_pressed")
	

func _button_left_pressed():
	
	if person != 0 or person != 2 or person != 4 or person == 6 or person != 8:
		$links_boven.text = str("x")
		person = person + 1
	if person != 1 or person != 3 or person != 5 or person != 7 or person != 9:
		$links_boven.text = str("0")
		person = person + 1
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
