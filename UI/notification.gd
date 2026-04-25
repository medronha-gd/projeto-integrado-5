extends Control
class_name NotificationModule

signal opened_notification

@export var notification_time: float = 1.6

func aparece() -> void:
	if not GlobalReference.is_working:
		var timer: SceneTreeTimer = get_tree().create_timer(notification_time, true)
		await timer.timeout
		# Animação de subir, vai mudar depois pra algo mais bonitinho # Não vai não kkkkkkkkkkkk
		var target_y: float = %NotificationButton.position.y - 20
		var t: PropertyTweener = create_tween().tween_property(%NotificationButton, "position:y",target_y, .3)
		t.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
		#
		self.show()
		
func _ready() -> void:
	self.hide()
	
	%NotificationButton.pressed.connect(_on_pressed)

	aparece()


func _on_pressed() -> void:
	%OpenEffect.play()
	opened_notification.emit()
	# Conecta esse sinal no briefing
	
	self.hide()
	
	GlobalReference.is_working = true
