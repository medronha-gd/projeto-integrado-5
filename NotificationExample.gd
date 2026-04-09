extends Control
class_name NotificationExample

func _ready() -> void:
	# Example of how to use the notification system
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_1:
				# Simple notification
				NotificationManager.show_notification(
					"Hello! Click me!",
					on_notification_clicked
				)
			
			KEY_2:
				# Success notification (auto-dismisses in 3 seconds)
				NotificationManager.show_success("Operation completed!")
			
			KEY_3:
				# Error notification
				NotificationManager.show_error(
					"An error occurred!",
					on_error_clicked
				)
			
			KEY_4:
				# Warning notification
				NotificationManager.show_warning("Warning: Be careful!")
			
			KEY_5:
				# Info notification
				NotificationManager.show_info("Here's some info...")
			
			KEY_Q:
				# Get the notification object and do something with it
				var notif = NotificationManager.show_notification("I'm custom!")
				notif.notification_clicked.connect(func(): print("Custom notification clicked!"))

func on_notification_clicked() -> void:
	print("Notification was clicked!")
	# Do something here!

func on_error_clicked() -> void:
	print("Error notification clicked - performing error action!")
	# Do error handling here!

# You can also instantiate notifications in any script like this:
# NotificationManager.show_notification("Your message", your_callback_function, auto_dismiss_time)
