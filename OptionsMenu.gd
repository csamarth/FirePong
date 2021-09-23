extends Node

signal mute_option_update
signal lang_option_update(lang)
signal back_to_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new()
	var err = config.load("src/settings.cfg")
	if err == OK:
		print("loaded config!")
		print("locale on config-->" + str(config.get_value("global","locale")))
	else:
		print("There was an error loading config..")
		
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
	var config = ConfigFile.new()
	#Consider using the "user://settings.cfg" path since I don't think
	# we'll have access this path once the game is packaged...
	var err = config.load("src/settings.cfg")
	if err == OK:
		print("loaded config!")
		print("Writing to config...")
		config.set_value("global", "locale", $LanguageContainer/LangOptions.get_item_text(index))
		config.save("src/settings.cfg")
	else:
		print("There was an error loading config..")
		
	emit_signal("lang_option_update", $LanguageContainer/LangOptions.get_item_text(index))
	update_lang()
	
