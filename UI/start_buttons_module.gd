extends Panel
class_name StartMenuModule

@onready var button_holder: VBoxContainer = $ButtonHolder

func _ready() -> void:
	for child: Button in button_holder.get_children():
		child.pressed.connect(pressed_btn.bind(child))
	self.visible = false


func pressed_btn(_button: Button):
	match _button.name:
		"Restart":
			get_tree().reload_current_scene()
		"Quit":
			get_tree().quit()
	
