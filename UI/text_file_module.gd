extends Control
class_name TextFileModule

signal opened_file(name: String)
@export var texto: String = "Nome\nDo\nArquivo"

func _ready() -> void:
	%Label.text = texto


func _on_text_file_icon_pressed() -> void:
	opened_file.emit(texto)
