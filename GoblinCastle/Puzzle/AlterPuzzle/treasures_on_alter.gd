extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Global.hasTreasures[0]):
		$Mage.visible = true
	if (Global.hasTreasures[1]):
		$Dagger.visible = true
	if (Global.hasTreasures[2]):
		$Shield.visible = true


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("FireStaff"):
		area.get_parent().queue_free()
		Global.hasTreasures[0]= true
	if area.is_in_group("Dagger"):
		area.get_parent().queue_free()
		Global.hasTreasures[1]= true
	if area.is_in_group("Shield"):
		area.get_parent().queue_free()
		Global.hasTreasures[2]= true
		
