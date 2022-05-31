extends KinematicBody2D
var vector
var velocity = Vector2(-1,2)
var speed = 700
const explosion = preload("res://explosion.gd")
# var a = 2
# var b = "text"
signal body_entered()


func _physics_process(delta):
	var collision_info = move_and_collide(vector.normalized() * delta * speed)
	
		
	
	if collision_info != null:
		
		
		
		
		
		
		queue_free() 
	
	
#func explode():
	
	#var explosion_instance = explosion.instance()
	
	#get_parent().add_child(explosion_instance)
	
	#var vector = $turret/aim/aim2.position + Vector2(0,-300).rotated($turret.rotation)
	
	
	
	#tated(position.rotated(rotation_dir).angle() + $turret.rotation) 
	
	#explosion.position = $Sprite.global_position



# Replace with function body.








 


 # Replace with function body.


  # Replace with function body.


		# Replace with function body.


 # Replace with function body.
