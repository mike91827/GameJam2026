extends AudioStreamPlayer

## Are we affected by gravity?
@export var intro_audio : AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.stream = load("res://assets/audio/Goblin Castle Loop V5.ogg")
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.volume_db = 5.0
	$AudioStreamPlayer.pitch_scale = 1.0
	$AudioStreamPlayer.finished
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finished() -> void:
	pass # Replace with function body.
