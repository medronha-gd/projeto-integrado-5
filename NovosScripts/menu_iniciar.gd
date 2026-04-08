extends Control


func _ready() -> void:
	for child: Button in %ButtonHolder.get_children():
		child.pressed.connect(pressed_btn.bind(child))
	
	%PainelMenu.visible = false


func pressed_btn(_button: Button):
	match _button.name:
		"Quit":
			get_tree().quit()
		"Restart":
			get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	print("balls")
	if %PainelMenu.visible:
		%PainelMenu.visible = false
	else:
		%PainelMenu.visible = true
