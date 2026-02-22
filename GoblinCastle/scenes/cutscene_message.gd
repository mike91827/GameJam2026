extends Label3D

@export_multiline var cutscene_message: PackedStringArray = ["Thank you!!!", "You summoned me!!", "THANKS FOR PLAYING", "NOW\nYOU'VE\nSUMMONED", "GOBLIN MODE"]
@export var timer_interval = 0.3
@export var message_gap = 3

@onready var ThankYouMessage = $"../ThankYou"
@onready var PlayAgainButton = $"../PlayAgain"

var timer = 0
var message_timer = 0
var cur_message = 0
var cur_letter = 0
var message_done = false

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
				if not message_done:
					self.text = "GOBLIN MODE"
				message_done = true
	
	if message_done:
		message_timer += delta
		if message_timer >= message_gap and not ThankYouMessage.visible:
			message_timer = 0
			self.text = ""
			ThankYouMessage.visible = true
		if ThankYouMessage.visible and message_timer >= message_gap:
			PlayAgainButton.visible = true
