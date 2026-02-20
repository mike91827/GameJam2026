extends Node3D
@onready var raycast = $Camera3D/RayCast3D
@onready var hand  = $Hand
@onready var objectInHand = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var object = raycast.get_collider()
	if raycast.is_colliding():		
		if object.is_in_group("Pickable"):
			if Input.is_action_pressed("Interact"):
				objectInHand = object
				#object.global_position = hand.global_position
				#object.global_rotation = hand.global_rotation
				#object.collision_layer =2
				#object.linear_velocity = Vector3(0.1,3,0.1)
	if objectInHand != null:
		objectInHand.global_position = hand.global_position
		objectInHand.global_rotation = hand.global_rotation
		objectInHand.collision_layer =2
		objectInHand.linear_velocity = Vector3(0.1,3,0.1)
	
	if Input.is_action_just_pressed("Release"):
		objectInHand = null
