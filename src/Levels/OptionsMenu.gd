extends Node

signal mute_option_update
signal lang_option_update(lang)
signal back_to_menu

var SETTINGS_PATH = "user://settings.cfg"

# Called when the node enters the scene tree for the first time.
func _ready():
	var config = ConfigFile.new()
	var file = File.new()
	file.open(SETTINGS_PATH, File.WRITE)
	file.close()
	var err = config.load(SETTINGS_PATH)
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
	#Consider using the SETTINGS_PATH path since I don't think
	# we'll have access this path once the game is packaged...
	var err = config.load(SETTINGS_PATH)
	if err == OK:
		print("loaded config!")
		print("Writing to config...")
		config.set_value("global", "locale", $LanguageContainer/LangOptions.get_item_text(index))
		config.save(SETTINGS_PATH)
	else:
		print("There was an error loading config..")
		
	emit_signal("lang_option_update", $LanguageContainer/LangOptions.get_item_text(index))
	update_lang()
	
