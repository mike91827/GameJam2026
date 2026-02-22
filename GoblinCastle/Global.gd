extends Node
var timer: float = 0.0
var interval: float = 1.0
var loop = 1
var goingToDie=false
var fakeDeath = false
var GTDCounter = -1;
#staff,dagger,shield
var hasTreasures = [false,false,false]
var treasureTextures = [preload("res://assets/sprites/sprite_firestaff.png"),preload("res://assets/sprites/sprite_dagger.png"),preload("res://assets/sprites/sprite_shield.png")]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if goingToDie||fakeDeath:
		timer+=delta
		if timer >= interval:
			timer -= interval
			GTDCounter-=1
			
	if goingToDie && GTDCounter<=0:
		get_tree().change_scene_to_file("res://DeathScene/DeathScene.tscn")

	if hasTreasures.all(func(element): return element):
		hasTreasures = [false,false,false]
		get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
	
