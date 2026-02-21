extends Node3D

@onready var fire_staff = $FireStaff

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_staff.visible = false
	fire_staff.set_process(false)
	print(fire_staff.visible)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_puzzle_manager_fireplace_puzzle_solved() -> void:
	fire_staff.visible = true
	fire_staff.set_process(true)
