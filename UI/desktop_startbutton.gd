extends Control

@export var start_buttons: StartMenuModule



func pressed_btn(_button: Button):
	match _button.name:
		"Restart":
			get_tree().reload_current_scene()
		"Quit":
			get_tree().quit()


func _on_iniciar_button_pressed() -> void:
	if start_buttons != null:
		match start_buttons.visible:
			false:
				start_buttons.visible = true
			true:
				start_buttons.visible = false
