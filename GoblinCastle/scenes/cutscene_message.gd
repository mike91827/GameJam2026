extends Label3D

@export_multiline var cutscene_message: PackedStringArray = ["Thank you!!!", "You summoned me!!", "THANKS FOR PLAYING", "NOW\nYOU'VE\nSUMMONED", "GOBLIN MODE"]
@export var timer_interval = 0.3

@onready var ThankYouMessage = $"../ThankYou"

var timer = 0
var cur_message = 0
var cur_letter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(self.text)
	self.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer >= timer_interval:
		timer = 0
		
		if cur_message < cutscene_message.size() && cur_letter < cutscene_message[cur_message].length():
			self.text += cutscene_message[cur_message][cur_letter]
			cur_letter += 1
		else: 
			cur_letter = 0
			if cur_message < cutscene_message.size():
				self.text = ""
				cur_message += 1
			else:
				ThankYouMessage.visible = true
