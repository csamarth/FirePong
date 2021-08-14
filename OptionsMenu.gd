extends Node

signal mute_option_update
signal lang_option_update
signal back_to_menu

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init_lang_options(locales):
	for locale in locales:
		$LanguageContainer/LangOptions.add_item(locale)
		pass
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	emit_signal("back_to_menu")
