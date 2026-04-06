extends Control

@export_multiline() var textual_content: String = ""
@export var text_file_module: TextFileModule

func _ready() -> void:
	%ScrollContainer.horizontal_scroll_mode = 0
	
	self.visible = false
	
	if text_file_module:
		text_file_module.opened_file.connect(open)

	%Label.text = textual_content
func _on_close_button_pressed() -> void:
	self.visible = false

func open(text: String) -> void:
	
	self.visible = true
	%NomeArquivo.text = text
