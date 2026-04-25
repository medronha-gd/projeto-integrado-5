extends Control
class_name Briefing

signal closed_briefing
signal ended_day

var briefing_name: String 
var texto: ConteudoTextual
var imagem: CompressedTexture2D

@export var dados: Array[DadosBriefing]
var dado_atual: DadosBriefing

@export var notification_module: NotificationModule



func _ready() -> void:
	%TabContainer.current_tab = 0
	%TabContainer.tab_clicked.connect(change_sound_effect)
	%TabContainer.tab_changed.connect(change_sound_effect)
	_atualizar_dado(0)
	self.hide()
	
	if notification_module != null:
		notification_module.opened_notification.connect(open_briefing)
		
	for child: BaseButton in %ButtonContainer.get_children():
		if child is BaseButton:
			child.pressed.connect(on_pressed_button.bind(child))

func _atualizar_dado(index: int) -> void:
	dado_atual = dados[index]
	briefing_name = dado_atual.briefing_name
	texto = dado_atual.texto
	imagem = dado_atual.imagem
	
	if imagem != null:
		%ImagemDoBriefing.texture = imagem
	if texto != null:
		%TextoBriefing.text = texto.textual_value

func open_briefing() -> void:
	self.show()
	%TabContainer.current_tab = 0

func on_pressed_button(_button: Button) -> void:
	%ClickEffect.play()
	var button_name: String = _button.name
	
	ChoiceManager.save_choice(briefing_name, button_name)
	
	self.hide()
	GlobalReference.is_working = false
	closed_briefing.emit()
	
	if ChoiceManager.counter == 3:
		ended_day.emit()
		return
	
	if ChoiceManager.counter < dados.size():
		_atualizar_dado(ChoiceManager.counter)
		
	if notification_module != null:
		notification_module.aparece()

func change_sound_effect(_tab: int) -> void:
	%ChangeEffect.play()
