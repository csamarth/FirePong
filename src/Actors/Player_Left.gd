extends KinematicBody2D

func _physics_process(_delta) -> void:
	var velocity = get_parent().velocity
	var speed = get_parent().speed
	var direction := Vector2( 
		0.0,	#x-axis
		Input.get_action_strength("ui_down") -Input.get_action_strength("ui_up") 	#y-axis
	);
	velocity = speed * direction;
	velocity = move_and_slide(velocity);
