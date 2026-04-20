extends Node

var is_working: bool = false

var verde_choices: int = 0
var vermelho_choices: int = 0
var azul_choices: int = 0

func _process(_delta: float) -> void:
	if OS.is_debug_build():
		if Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit()
