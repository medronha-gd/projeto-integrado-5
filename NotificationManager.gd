extends CanvasLayer
class_name NotificationManager

## Get the container that holds all notifications
@onready var container: Control = self

const NOTIFICATION_SCENE = preload("res://UI/NotificationPopup.tscn")

func _ready() -> void:
	layer = 100  # Make sure it's on top

## Show a notification with the given message
## callback: Optional function to call when notification is clicked/dismissed
## auto_dismiss_time: Time in seconds before auto-dismissing (0 = only on click)
func show_notification(
	message: String, 
	callback: Callable = Callable(), 
	auto_dismiss_time: float = 0.0
) -> NotificationPopup:
	
	var notification = NOTIFICATION_SCENE.instantiate() as NotificationPopup
	notification.message = message
	notification.auto_dismiss_time = auto_dismiss_time
	
	add_child(notification)
	
	# Connect callback if provided
	if callback.is_valid():
		notification.notification_clicked.connect(callback)
	
	return notification

## Show a success notification (green)
func show_success(
	message: String, 
	callback: Callable = Callable()
) -> NotificationPopup:
	var notification = show_notification(message, callback, 3.0)
	notification.self_modulate = Color.GREEN
	return notification

## Show an error notification (red)
func show_error(
	message: String, 
	callback: Callable = Callable()
) -> NotificationPopup:
	var notification = show_notification(message, callback)
	notification.self_modulate = Color.RED
	return notification

## Show a warning notification (yellow)
func show_warning(
	message: String, 
	callback: Callable = Callable()
) -> NotificationPopup:
	var notification = show_notification(message, callback, 5.0)
	notification.self_modulate = Color.YELLOW
	return notification

## Show an info notification (blue)
func show_info(
	message: String, 
	callback: Callable = Callable()
) -> NotificationPopup:
	var notification = show_notification(message, callback)
	notification.self_modulate = Color.CYAN
	return notification
