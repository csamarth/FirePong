#extends "res://src/Actors/Actor.gd"
extends Actor

var vel = Vector2.ZERO
var direction = 1.0


func _physics_process(_delta) -> void:
	vel.y = direction * 100
	vel.x = 0
	vel = move_and_slide(vel, Vector2.UP)
	if is_on_floor():
		direction *= -1
	if is_on_ceiling():
		direction *= -1
