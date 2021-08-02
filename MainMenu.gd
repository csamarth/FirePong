extends Node2D

export(PackedScene) var Game
export(String, "hi", "en", "es") var locale

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func center_menu():
	$MarginContainer.margin_left = get_viewport_rect().size.x/2
	$MarginContainer.margin_top = get_viewport_rect().size.y/2 - $MarginContainer/GridContainer.rect_size.y

# Called when the node enters the scene tree for the first time.
func _ready():
#	This is for presenting the locale to users in a user-friendly manner such as
#	"English (United States)".
#	TranslationServer.set_locale(TranslationServer.get_locale_name("hi_IN"))

	TranslationServer.set_locale(locale)
	center_menu()
	get_tree().get_root().connect("size_changed", self ,"center_menu")
	$MarginContainer/GridContainer/Start.set_text(tr("START"))
	$MarginContainer/GridContainer/Options.set_text(tr("OPTIONS"))
	$MarginContainer/GridContainer/Exit.set_text(tr("EXIT"))
	


func start_game():
#	Start game
	add_child(Game.instance())
	$MarginContainer.queue_free()
	


func exit_game():
#	Exit game
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	start_game()
