extends Node2D

export(PackedScene) var Game
export(PackedScene) var Options
enum LANG {HI, EN, ES}
export(LANG) var locale

func center_menu():
	$MainMenuContainer.margin_left = get_viewport_rect().size.x/2
	$MainMenuContainer.margin_top = get_viewport_rect().size.y/2 - $MainMenuContainer/MainItems.rect_size.y

# Called when the node enters the scene tree for the first time.
func _ready():
	init_menu()

func start_game():
	add_child(Game.instance())
	$MainMenuContainer.queue_free()

func init_menu():
	TranslationServer.set_locale(LANG.keys()[LANG.EN])
	center_menu()
	get_tree().get_root().connect("size_changed", self ,"center_menu")
	add_menu_items()
	add_options()
	
func add_menu_items():
	$MainMenuContainer/MainItems/Start.set_text(tr("START"))
	$MainMenuContainer/MainItems/Options.set_text(tr("OPTIONS"))
	$MainMenuContainer/MainItems/Exit.set_text(tr("EXIT"))

func remove_menu_items():
	$MainMenuContainer/MainItems/Start.queue_free()
	$MainMenuContainer/MainItems/Options.queue_free()
	$MainMenuContainer/MainItems/Exit.queue_free()


func add_options():
	pass
#	FIXME: Has to be re-written since the options is a scene of its own.
#	add_lang_options()
	
func add_lang_options():
	
	#FIXME:Does not work properly at the moment
	for lang in LANG.keys():	
		$MainMenuContainer/MainItems/OptionButton.add_item(lang)

func exit_game():
	get_tree().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	start_game()


func _on_Exit_pressed():
	exit_game()


func _on_Options_pressed():
	remove_menu_items()
	$MainMenuContainer/MainItems.add_child(Options.instance())
