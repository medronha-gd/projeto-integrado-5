extends Control

@export var texto: ConteudoTextual

func _ready() -> void:
	%TabContainer.current_tab = 0
	

	if texto != null:
		%TextoBriefing.text = texto.textual_value
	
	for child: Button in %ButtonContainer.get_children():
		if child is BaseButton:
			child.pressed.connect(on_pressed_button.bind(child))


func on_pressed_button(_button: Button) -> void:
	match _button.name:
		"Escolha01":
			print("O botão 1 foi tocado..")
		"Escolha02":
			print("O botão 2 foi tocado..")
		"Escolha03":
			print("O botão 3 foi tocado..")
