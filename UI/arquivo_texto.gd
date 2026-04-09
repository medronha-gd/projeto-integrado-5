extends TextureButton
class_name FileModule

## Lembre-se de atribuir um recurso de texto aqui! - 🦶🏾
@export var conteudo_textual: ConteudoTextual

@export var nome_arquivo: String = "Escreva aqui!"

func _ready() -> void:
	%Trecho.text = conteudo_textual.textual_value
	%NomeArquivo.text = nome_arquivo
	%TituloArquivo.text = nome_arquivo
	
	
	
	%PainelMestre.visible = false

func arquivo_on_pressed() -> void:
	if %PainelMestre.visible:
		%PainelMestre.visible = false
	else:
		centralizar_painel()
		%PainelMestre.visible = true
		UIAnimation.animate_pop(%PainelMestre, 0.5)


func _on_fechar_pressed() -> void:
	if %PainelMestre.visible:
		%PainelMestre.visible = false
	#else:
		#%PainelMestre.visible = true
		
		
		
func centralizar_painel():
	var screen_size: Vector2 = get_viewport_rect().size
	var panel_size: Vector2 = %PainelMestre.size


	%PainelMestre.global_position = (screen_size - panel_size) / 2
