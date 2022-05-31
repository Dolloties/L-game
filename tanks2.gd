extends KinematicBody2D
export (int) var speedforwards = 1000
export (int) var speedbackwards = 500
export (float) var rotation_speed = 5
const bulletPath = preload('res://tanks/Bullet.tscn')

var velocity = Vector2()
var rotation_dir = 0
var bulletcount = 5
onready var cooldowntimer := $cooldown
onready var bulletregen := $bulletregen
func get_input():
	rotation_dir = 0
	velocity = Vector2()
		
	

	
	if Input.is_action_pressed("right2"): 
		rotation_dir += 1
	if Input.is_action_pressed("left2"):
		rotation_dir -= 1
	if Input.is_action_pressed("up2"):
		velocity = Vector2(speedforwards,0).rotated(rotation)
	if Input.is_action_pressed("down2"):
		velocity = Vector2(-speedbackwards, 0).rotated(rotation)
	
	
	 
	
	
	if Input.is_action_pressed("turret_right2"):
		$turret1.rotation += (PI * 0.01)
	if Input.is_action_pressed("turret_left2"):
	
		$turret1.rotation -= (PI * 0.01)

		
	
	
		
		
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)
	
	$Label.text = str(bulletcount)
	
		
	



	
	
	
func _process(_delta):
	
	if Input.is_action_just_pressed("spacebar2") and cooldowntimer.is_stopped() and bulletcount > 0:
	
		 
		
		shoot()
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


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
