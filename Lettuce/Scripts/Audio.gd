extends AudioStreamPlayer

const level_music=preload("res://Musica/loop.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db =volume
	play()
	
func play_music():
	_play_music(level_music)
	
func _on_finished():
	self.play() # Replace with function body.
