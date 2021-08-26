extends Node2D

var repeatPlay = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()
	


func _on_AudioStreamPlayer_finished():
	if(repeatPlay):
		$AudioStreamPlayer.play()
	else:
		get_tree().change_scene("res://MainMenu.tscn")
	
func end_game():
	repeatPlay = false
	$AudioStreamPlayer.stream = load("res://Sounds/GameEnd.wav")
	$AudioStreamPlayer.play()
	
