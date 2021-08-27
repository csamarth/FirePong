extends Node2D

export(PackedScene) var Game
export(PackedScene) var Options
enum LANG {en, es, hi}
export(LANG) var locale

#For now this is a global, will fix it because it really shouldn't be a global.
#Ideally this should be loaded from a configuration file, maybe
var story_text = "This is the story about FirePong..."

func center_menu():
	$MainMenuContainer.margin_left = get_viewport_rect().size.x/2
	$MainMenuContainer.margin_top = get_viewport_rect().size.y/2 - $MainMenuContainer/MainItems.rect_size.y

func create_text_animation(node_path, text, delimeter = " "):
	var animation = Animation.new()
	var track_index = animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track_index, node_path)
	var current_transition = 0.0
	var current_text = ""
	print("story_text:"+ text)
	for token in text.split(delimeter):
		current_text = current_text + token + delimeter
		print(current_text)
		animation.track_insert_key(track_index, current_transition, current_text)
		current_transition = current_transition + 0.5
		animation.length = animation.length + 0.5 
	
	return animation
	
func create_animation_player():
	var player =  AnimationPlayer.new()
	var animation = create_text_animation("Story:text", story_text)
	player.add_animation("Story", animation)
	return player
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_menu()
	var anim_player = create_animation_player()
	anim_player.current_animation = "Story"
	add_child(anim_player)

func start_game():
	add_child(Game.instance())
	$MainMenuContainer.queue_free()

func init_menu():
	TranslationServer.set_locale(LANG.keys()[LANG.en])
	center_menu()
	get_tree().get_root().connect("size_changed", self ,"center_menu")
	update_menu_items()
	init_options_menu()
	
func init_options_menu():
	var options_menu_instance = Options.instance()
	options_menu_instance.init_lang_options(LANG.keys())
	options_menu_instance.visible = false
	$MainMenuContainer/MainItems.add_child(options_menu_instance)
	options_menu_instance.connect("back_to_menu", self, "back_to_menu") 
	options_menu_instance.connect("lang_option_update", self, "update_lang") 
	
func update_menu_items():
	$MainMenuContainer/MainItems/Start.set_text(tr("START"))
	$MainMenuContainer/MainItems/Options.set_text(tr("OPTIONS"))
	$MainMenuContainer/MainItems/Exit.set_text(tr("EXIT"))

func hide_menu_items():
	$MainMenuContainer/MainItems/Start.visible = false
	$MainMenuContainer/MainItems/Options.visible = false
	$MainMenuContainer/MainItems/Exit.visible = false

func show_menu_items():
	update_menu_items()
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

func update_lang(locale):
	TranslationServer.set_locale(locale )
	
