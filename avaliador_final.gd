extends Node

@export var briefing: Briefing

func _ready() -> void:
	if briefing != null:
		briefing.ended_day.connect(resultado_final)
	else:
		if OS.is_debug_build():
			print_rich("[tornado radius=5.0 freq=0.5 connected=1]{VOCÊ ESQUECEU DE REFERENCIAR O BRIEFING NA AVALIAÇÃO FINAL!!!}[/tornado].")
func resultado_final() -> void:
	pass
