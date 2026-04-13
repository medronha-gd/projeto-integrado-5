extends Control
class_name Notification

signal opened_notification


func aparece() -> void:
	if not GlobalReference.is_working:
		# Animação de subir, vai mudar depois pra algo mais bonitinho
		var target_y: float = %NotificationButton.position.y - 20
		var t: PropertyTweener = create_tween().tween_property(%NotificationButton, "position:y",target_y, .3)
		t.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
		#
		%NotificationButton.show()
		
func _ready() -> void:
	%NotificationButton.pressed.connect(_on_pressed)
	
func _on_pressed() -> void:
	opened_notification.emit()
	# Conecta esse sinal no briefing
	
	self.hide()
	
	GlobalReference.is_working = true
