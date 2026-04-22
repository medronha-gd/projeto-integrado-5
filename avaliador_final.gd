extends Node

@export var briefing: Briefing

func _ready() -> void:
	if briefing != null:
		briefing.ended_day.connect(resultado_final)
	else:
		if OS.is_debug_build():
			print_rich("[tornado radius=5.0 freq=0.5 connected=1]{VOCÊ ESQUECEU DE REFERENCIAR O BRIEFING NA AVALIAÇÃO FINAL!!!}[/tornado].")


func resultado_final() -> void:
	if GlobalReference.verde_choices > GlobalReference.vermelho_choices\
and GlobalReference.verde_choices > GlobalReference.azul_choices:
		print("Final Verde")

	elif GlobalReference.vermelho_choices > GlobalReference.verde_choices\
and GlobalReference.vermelho_choices > GlobalReference.azul_choices:
		print("Final Vermelho")

	elif GlobalReference.azul_choices > GlobalReference.verde_choices\
and GlobalReference.azul_choices > GlobalReference.vermelho_choices:
		print("Final Azul")

	else:
		print("Empate ou caso não previsto")
