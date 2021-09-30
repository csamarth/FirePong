extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var backgroundMusic : AudioStream = load("res://src/Sound/Sounds_GameBackground.mp3")
export var repeatBackgroundMusic : bool = true
export var endScene : String

export var music : Dictionary = {
	"gameEnd" : load("res://src/Sound/Sounds_GameEnd.wav"),
	"ballCollide" : load("res://src/Sound/Sounds_GameOnHit.wav"),
	"onHover" : load("res://src/Sound/OnHover.wav"),
	"onSelect" : load("res://src/Sound/OnSelect.wav")
}

func play_Background_Music():
	$AudioStreamPlayer.stream = backgroundMusic
	$AudioStreamPlayer.play()
	
func _on_AudioStreamPlayer_finished():
	if(repeatBackgroundMusic):
		$AudioStreamPlayer.play()

func play_music(musicKey):
	if(music.has(musicKey)):
		$AudioStreamPlayer2.stream = music[musicKey]
		$AudioStreamPlayer2.play()
		
