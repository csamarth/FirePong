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
	init_options_menu()
	
func init_options_menu():
	var options_menu_instance = Options.instance()
	options_menu_instance.init_lang_options(LANG.keys())
	options_menu_instance.visible = false
	$MainMenuContainer/MainItems.add_child(options_menu_instance)
	options_menu_instance.connect("back_to_menu", self, "back_to_menu") 
	
func add_menu_items():
	$MainMenuContainer/MainItems/Start.set_text(tr("START"))
	$MainMenuContainer/MainItems/Options.set_text(tr("OPTIONS"))
	$MainMenuContainer/MainItems/Exit.set_text(tr("EXIT"))

func hide_menu_items():
	$MainMenuContainer/MainItems/Start.visible = false
	$MainMenuContainer/MainItems/Options.visible = false
	$MainMenuContainer/MainItems/Exit.visible = false

func show_menu_items():
	$MainMenuContainer/MainItems/Start.visible = true
	$MainMenuContainer/MainItems/Options.visible = true
	$MainMenuContainer/MainItems/Exit.visible = true 

func back_to_menu():
	hide_options_menu()
	show_menu_items()

func hide_options_menu():
	$MainMenuContainer/MainItems.get_node("OptionsMenu").visible = false
	
func show_options_menu():
	$MainMenuContainer/MainItems.get_node("OptionsMenu").visible = true

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
	hide_menu_items()
	show_options_menu()
