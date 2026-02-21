extends Area3D

@export var message = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	var sign = body.get_node("./SignMessage")
	sign.text = message
	sign.visible = true


func _on_body_exited(body: Node3D) -> void:
	var sign = body.get_node("./SignMessage")
	sign.text = ""
	sign.visible = false
