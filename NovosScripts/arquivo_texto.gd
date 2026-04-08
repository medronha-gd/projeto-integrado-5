extends TextureButton
class_name FileModule

## Lembre-se de atribuir um recurso de texto aqui! - 🦶🏾
@export var conteudo_textual: ConteudoTextual

@export var nome_arquivo: String = "Escreva aqui!"

func _ready() -> void:
	%NomeArquivo.text = nome_arquivo
	%TituloArquivo.text = nome_arquivo
	
	%Trecho.text = conteudo_textual.textual_value


func arquivo_on_pressed() -> void:
	if %PainelMestre.visible:
		%PainelMestre.visible = false
	else:
		%PainelMestre.visible = true


func _on_fechar_pressed() -> void:
	if %PainelMestre.visible:
		%PainelMestre.visible = false
	else:
		%PainelMestre.visible = true
