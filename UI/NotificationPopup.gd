extends PanelContainer
class_name NotificationPopup

## Signal emitted when the notification is clicked
signal notification_clicked

## The message text to display
@export var message: String = "Notification!"

## How long the notification stays visible (0 = forever until clicked)
@export var auto_dismiss_time: float = 0.0

## Background color
@export var bg_color: Color = Color.DARK_GRAY

@onready var label: Label = %Label
@onready var close_button: Button = %CloseButton

var is_dismissing: bool = false

func _ready() -> void:
	label.text = message
	modulate.a = 0.0  # Start transparent
	close_button.pressed.connect(_on_close_pressed)
	
	# Animate in
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.3)
	
	# Use UIAnimation if available for pop effect
	if has_meta("use_pop_animation"):
		if UIAnimation:
			UIAnimation.animate_pop(self, 0.3)
	
	# Auto dismiss if set
	if auto_dismiss_time > 0:
		await get_tree().create_timer(auto_dismiss_time).timeout
		if not is_dismissing:
			dismiss()

func _on_close_pressed() -> void:
	notification_clicked.emit()
	dismiss()

func _gui_input(event: InputEvent) -> void:
	# Allow clicking anywhere on the notification to trigger the signal
	if event is InputEventMouseButton and event.pressed:
		notification_clicked.emit()
		dismiss()

func dismiss() -> void:
	if is_dismissing:
		return
	
	is_dismissing = true
	
	# Animate out
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.3)
	await tween.finished
	
	queue_free()

## Set the notification message
func set_message(text: String) -> void:
	message = text
	if label:
		label.text = text

## Set auto dismiss time and start timer
func set_auto_dismiss(time: float) -> void:
	auto_dismiss_time = time
	if is_node_ready() and time > 0:
		await get_tree().create_timer(time).timeout
		if not is_dismissing:
			dismiss()
