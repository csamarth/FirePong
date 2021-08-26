extends Node2D

export(PackedScene) var Game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var select_sound = load("res://Sounds/OnSelect.wav")
var hover_sound = load("res://Sounds/OnHover.wav")

func center_menu():
	$MarginContainer.margin_left = get_viewport_rect().size.x/2
	$MarginContainer.margin_top = get_viewport_rect().size.y/2 - $MarginContainer/GridContainer.rect_size.y

# Called when the node enters the scene tree for the first time.
func _ready():
	center_menu()
	get_tree().get_root().connect("size_changed", self ,"center_menu")


func start_game():
#	Start game
	add_child(Game.instance())
	$MarginContainer.queue_free()
	
func play_Sound(event):
	match(event):
		"onSelect":
			$AudioStreamPlayer.stream = select_sound
		"onHover":
			$AudioStreamPlayer.stream = hover_sound
	$AudioStreamPlayer.play()

func exit_game():
#	Exit game
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	play_Sound("onSelect")
	start_game()
	
func _on_Item_hover():
	play_Sound("onHover")

func _on_Options_pressed():
	play_Sound("onSelect")
	
func _on_Exit_pressed():
	play_Sound("onSelect")
