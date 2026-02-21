extends StaticBody3D

signal button_pressed(id)

@export var id = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func emit_button_press():
	button_pressed.emit(id)
