extends KinematicBody2D
class_name Actor


export var speed := Vector2(300.0,1000.0); #800 is x-axis speed, 1000 is y-axis speed	
export var gravity := 0.0;	#controls how fast the paddle falls down
export var _velocity := Vector2.ZERO;

#If called in any Node, it will be used in every frame of the game
func _physics_process(delta):
	_velocity.y +=  gravity * delta;
	#var velocity := Vector2(300,0) #moves 300px per sec on x axis and 0 on y
	#if velocity.y > speed.y:
		#velocity.y = speed.y;
	_velocity = move_and_slide(_velocity); # ctrl+click to see documentation
