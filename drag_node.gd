extends Node

var _dragging := false
var _drag_offset := Vector2.ZERO


const BLOCKED_TYPES = ["BaseButton", "TextEdit", "LineEdit", "SpinBox", "Slider", "ScrollContainer"]

func _ready() -> void:
	assert(get_parent() is Control, "DragHandler precisa ser filho de um Control")

func _is_blocked(control: Control) -> bool:
	for type in BLOCKED_TYPES:
		if control.is_class(type):
			return true
	return false

func _input(event: InputEvent) -> void:
	var parent: Control = get_parent()

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if parent.get_global_rect().has_point(event.global_position):
				var hovered = get_viewport().gui_get_hovered_control()
				
				if hovered != null and _is_blocked(hovered):
					return

				_dragging = true
				_drag_offset = parent.position - parent.get_global_mouse_position()
				get_viewport().set_input_as_handled()
		else:
			_dragging = false

func _process(_delta: float) -> void:
	if not _dragging:
		return

	var parent: Control = get_parent()
	var new_pos = parent.get_global_mouse_position() + _drag_offset

	var screen := parent.get_viewport_rect().size
	new_pos.x = clamp(new_pos.x, 0, screen.x - parent.size.x)
	new_pos.y = clamp(new_pos.y, 0, screen.y - parent.size.y)

	parent.position = new_pos
