extends Control


func _ready() -> void:
	for child: Button in %ButtonHolder.get_children():
		if child is BaseButton:
			child.pressed.connect(pressed_btn.bind(child))
	%PainelCentral.hide()


func pressed_btn(_button: Button):
	match _button.name:
		"Quit":
			get_tree().quit()
		"Restart":
			get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	%MenuSound.play()
	
	if not %PainelCentral.visible:
		%PainelCentral.show()
	else:
		%PainelCentral.hide()



func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if %PainelCentral.visible:
			if not %PainelCentral.get_global_rect().has_point(get_global_mouse_position()):
				%PainelCentral.visible = false
