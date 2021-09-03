extends TextEdit
export(PackedScene) var Game

var anim_player = null
func load_story() -> String:
	var story_content = tr("STORY_BEGIN")
	return story_content

func create_text_animation(node_path, text, delimeter = " ") -> Animation:
	var animation = Animation.new()
	var track_index = animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(track_index, node_path)
	var current_transition = 0.0
	var current_text = ""
	for token in text.split(delimeter):
		current_text = current_text + token + delimeter
		print(current_text)
		animation.track_insert_key(track_index, current_transition, current_text)
		current_transition = current_transition + 0.5
		animation.length = animation.length + 0.5 
	
	return animation
	
func create_animation_player(text_to_animate) -> AnimationPlayer:
	var player :=  AnimationPlayer.new()
	var animation = create_text_animation(".:text", text_to_animate)
	player.add_animation("Story", animation)
	return player

func start_game_story(name):
	get_parent().add_child(Game.instance())
	queue_free()

func _unhandled_input(input: InputEvent):
	fast_forward_story(input)
	
func fast_forward_story(input: InputEvent):
	print('fast_forward')
	if input.is_action("ui_accept"):
		anim_player.advance(10)

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player = create_animation_player(load_story())	
	anim_player.connect("animation_finished", self, "start_game_story")
#	ALWAYS call play. Otherwise the animation API does not send signals properly
	anim_player.play("Story")
	add_child(anim_player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
