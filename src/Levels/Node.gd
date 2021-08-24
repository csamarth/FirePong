extends Node


var speed := Vector2(100.0,100.0); 
var gravity := 0.0;	#controls how fast the paddle falls down
var velocity := Vector2.ZERO;
var speed_increase := Vector2(10.0, 10.0);



func _on_Speed_Increase_timeout():
	speed += speed_increase
	print(speed)
