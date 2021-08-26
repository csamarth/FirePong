extends Actor

func _physics_process(_delta):
	var direction := Vector2( 
		0.0,	#x-axis
		Input.get_action_strength("ui_down") -Input.get_action_strength("ui_up") 	#y-axis
	);
	_velocity = speed * direction;

