extends Control
class_name Briefing

signal closed_briefing
signal ended_day

var briefing_name: String 
var texto: ConteudoTextual
var imagem: CompressedTexture2D

@export var dados: DadosBriefing

@export var notification_module: NotificationModule

func _ready() -> void:
	%TabContainer.current_tab = 0
	
	briefing_name = dados.briefing_name
	texto = dados.texto
	imagem = dados.imagem
	
	self.hide()

	if imagem != null:
		%ImagemDoBriefing.texture = imagem
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
	var button_name: String = _button.name
	
	ChoiceManager.save_choice(briefing_name, button_name)
	
	self.hide()
	GlobalReference.is_working = false
	
	closed_briefing.emit()
	
	if ChoiceManager.counter < 3:
		if notification_module != null:
			notification_module.aparece()
			
	if ChoiceManager.counter == 3:
		ended_day.emit()
