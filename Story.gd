extends TextEdit

func load_story():
	var story_file = File.new()
	story_file.open("res://Assets/Story.txt", File.READ)

	var story_content  = story_file.get_as_text()

	return story_content

func create_text_animation(node_path, text, delimeter = " "):
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
	
func create_animation_player():
	var player =  AnimationPlayer.new()
	var animation = create_text_animation("Story:text", "Hello World")
	player.add_animation("Story", animation)
	return player


# Called when the node enters the scene tree for the first time.
func _ready():
#	var anim_player = create_animation_player()
#	anim_player.current_animation = "Story"
	
	load_story()
	
	print()
#	add_child(anim_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
