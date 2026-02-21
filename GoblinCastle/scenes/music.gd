extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$intro_player.play()
	$intro_player.finished.connect(_on_intro_finished)

func _on_intro_finished():
	$loop_player.play()
