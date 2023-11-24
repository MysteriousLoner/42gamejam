extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_StartButton_pressed():
	get_tree().change_scene("")
	
func _on_OptionsButton_pressed():
	var options = load("res://Options/input.tscn").instance()
	get_tree().current_scene.add_child(options)
	
func _on_QuitButton_pressed():
	get_tree().quit()
