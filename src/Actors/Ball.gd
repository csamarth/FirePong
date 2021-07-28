extends Actor



var vel = Vector2.ZERO
var direction_x = 1.0
var direction_y = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta) -> void:
	vel.y = direction_y * 100
	vel.x = direction_x * 100
	vel = move_and_slide(vel, Vector2.UP)
	if is_on_floor() or is_on_ceiling():
		print("floor");
		direction_y *= -1
	if is_on_wall():
		print("wall")
		direction_x *= -1
