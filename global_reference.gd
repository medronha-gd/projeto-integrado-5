extends Node

func _process(_delta: float) -> void:
	if OS.is_debug_build():
		if Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit()
