extends Control

# Vou pedir ajuda pro Pombo mais tarde, esse código não está escalavel
@export var texto: ConteudoTextual

@export var notification_module: NotificationModule

func _ready() -> void:
	%TabContainer.current_tab = 0
	
	self.hide()


	if texto != null:
		%TextoBriefing.text = texto.textual_value
	
	if notification_module != null:
		notification_module.opened_notification.connect(open_briefing)
		
	for child: BaseButton in %ButtonContainer.get_children():
		if child is BaseButton:
			child.pressed.connect(on_pressed_button.bind(child))

func open_briefing() -> void:
	self.show()

func on_pressed_button(_button: Button) -> void:
	match _button.name: # Verifica pelo nome do botão tocado
		"Escolha01":
			print("O botão 1 foi tocado..")
		"Escolha02":
			print("O botão 2 foi tocado..")
		"Escolha03":
			print("O botão 3 foi tocado..")
	self.hide() # Quando um botão é apertado o briefing some
	GlobalReference.is_working = false
