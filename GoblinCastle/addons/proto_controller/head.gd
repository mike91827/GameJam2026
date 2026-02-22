extends Node3D
@onready var raycast = $Camera3D/RayCast3D
@onready var hand  = $Hand
@onready var objectInHand = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../Label3D".visible = false
	var object = raycast.get_collider()
	if raycast.is_colliding():	
		if object.is_in_group("Pickable") && object.visible:
			$"../Label3D".visible = true
			if Input.is_action_pressed("Interact"):
				objectInHand = object
		if object.is_in_group("Button"):
			if Input.is_action_just_pressed("Interact"):
				object.emit_button_press()
	#	if  object.is_in_group("BadFireplace"):
		#	$"../Label3D".visible = true
	if objectInHand != null:
		objectInHand.global_position = hand.global_position
		objectInHand.global_rotation = hand.global_rotation
		objectInHand.collision_layer =2
		# objectInHand.linear_velocity = Vector3(0.1,3,0.1)
	
	if Input.is_action_just_pressed("Release"):
		objectInHand = null
		
	if Global.goingToDie||Global.fakeDeath:
		$"../GoingToDie".visible = true
		$"../GoingToDie".text = str(Global.GTDCounter) +"!"
	else:
		$"../GoingToDie".visible = false
	
	if Global.fakeDeath && Global.GTDCounter <= 0:
		$"../GoingToDie".visible = false
		get_parent().puzzle_manager.fireplace_puzzle_solved.emit()
		$"../AudioStreamPlayer3D".play()


	
