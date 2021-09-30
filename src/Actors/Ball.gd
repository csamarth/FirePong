extends KinematicBody2D



var vel = Vector2.ZERO
var direction_x = 1.0
var direction_y = 1.0
var speed

# Called when the node enters the scene tree for the first time.
#func _ready():
#	speed = get_parent().speed

func _physics_process(_delta) -> void:
	speed = get_parent().speed
	vel.y = direction_y * speed.y
	vel.x = direction_x * speed.x
	vel = move_and_slide(vel, Vector2.UP)
	if is_on_floor() or is_on_ceiling():
		direction_y *= -1
		get_node("../../SoundManager").play_music("ballCollide")
	if is_on_wall():
		direction_x *= -1
