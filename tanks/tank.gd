extends KinematicBody2D


signal health_updated(health)
signal killed()
export (int) var speedforwards = 400
export (int) var speedbackwards = 200
export (float) var rotation_speed = 2
const bulletPath = preload("res://tanks/bullet.tscn")

var velocity = Vector2()
var rotation_dir = 0
var bulletcount = 5
onready var cooldowntimer := $cooldown
onready var bulletregen := $bulletregen
export (float) var max_health = 100
onready var health = max_health setget _set_health




func get_input():
	rotation_dir = 0
	velocity = Vector2()
		
	

	
	if Input.is_action_pressed("right"): 
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("up"):
		velocity = Vector2(speedforwards,0).rotated(rotation)
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speedbackwards, 0).rotated(rotation)
	
	
	 
	
	
	if Input.is_action_pressed("turret_right"):
		$turret1.rotation += (PI * 0.01)
	if Input.is_action_pressed("turret_left"):
	
		$turret1.rotation -= (PI * 0.01)

		
	
	
		
		
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	$Label.text = str(bulletcount)
	

	

	
	
	
func _process(_delta):
	
	if Input.is_action_just_pressed("spacebar") and cooldowntimer.is_stopped() and bulletcount > 0 and  $turret1/RayCast2D.is_colliding():
		
	
		shoot()
		var collider = $turret1/RayCast2D.get_collider()
		print("boom")
		 
		$audio.play()
		cooldowntimer.start()
		bulletcount = bulletcount - 1
	if bulletcount < 5 and bulletregen.is_stopped():
			bulletcount = bulletcount + 1
			bulletregen.start()
	
	
		
		
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func shoot ():
	var bullet = bulletPath.instance()
	
	get_parent().add_child(bullet)
	
	#var vector = $turret/aim/aim2.position + Vector2(0,-300).rotated($turret.rotation)
	var vectorr = $turret1/aim/aim2.global_position - $turret1.global_position
	
	
	var vector = vectorr#.rotated(position.rotated(rotation_dir).angle() + $turret.rotation) 
	bullet.vector = vector
	bullet.position = $turret1/aim.global_position
func damage(amount):
	_set_health(health - amount)
	
	


func kill():
	pass
	
func _set_health(value):
	var prev_health = health
	health = clamp(value,0, max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()
			emit_signal("killed")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_RigidBody2D_body_entered(body):
	#if body.is_not_in_group("bullet"):
		#health = health - 50
		#print(health)
		 # Replace with function body.


 # Replace with function body.
