extends Node2D
var triggered_dialogue = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_saw_cave_body_entered(body: Node):
	if body.has_method("player") and triggered_dialogue == false:
		body.freeze_movement(1)
		DialogueManager.show_example_dialogue_balloon(load("res://story/story.dialogue"), "start")
		await DialogueManager.dialogue_ended
		triggered_dialogue = true
	if triggered_dialogue == true:
		body.freeze_movement(0)
	return
