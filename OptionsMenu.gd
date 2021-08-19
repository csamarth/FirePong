extends Node

signal mute_option_update
signal lang_option_update(lang)
signal back_to_menu


# Called when the node enters the scene tree for the first time.
func _ready():
	update_lang()

func init_lang_options(locales):
	for locale in locales:
		$LanguageContainer/LangOptions.add_item(locale)

func _on_Button_pressed():
	emit_signal("back_to_menu")

func update_lang():
	$LanguageContainer/LangOptionsLabel.set('text', tr("OPTIONS"))
	$BackToMenu.set('text', tr("BTM"))

func _on_LangOptions_item_selected(index):
	emit_signal("lang_option_update", $LanguageContainer/LangOptions.get_item_text(index))
	update_lang()
	
