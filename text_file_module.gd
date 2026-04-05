extends Control


@export var texto: String = "Nome\nDo\nArquivo"


func _ready() -> void:
	%Label.text = texto
