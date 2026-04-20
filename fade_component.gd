extends ColorRect
class_name FadeCompo

func _init() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func _ready() -> void:
	fade_out()

func fade_in():
	%AnimationPlayer.play("fade")

func fade_out():
	%AnimationPlayer.play_backwards("fade")
