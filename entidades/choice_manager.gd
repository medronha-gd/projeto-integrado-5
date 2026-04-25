extends Node


# ---Pombo---
var counter = 0
var choices = {}
var choices_order = []

var current_choice = {}
var last_choice = {}

func save_choice(nome_briefing: String, escolha: String):
	if not current_choice.is_empty():
		last_choice = current_choice.duplicate()
	
	counter += 1
	current_choice = {
		"id": counter,
		"nome": nome_briefing,
		"resultado": escolha,
	}
	
	if not choices.has(nome_briefing):
		choices[nome_briefing] = []
		
	choices[nome_briefing].append(current_choice)
	
	choices_order.append(nome_briefing)
	#
	#print("--- Nova Ação ---")
	#print("Última Escolha: ", last_choice)
	#print("Escolha Atual: ", current_choice)
	#print("Histórico Completo (Choices): ", choices)
	
	match current_choice["id"]: # Posso checar agora as respostas de cada jogada
		1:
			if current_choice["resultado"] == "Verde":
				GlobalReference.verde_choices += 1
			elif current_choice["resultado"] == "Azul":
				GlobalReference.azul_choices += 1
			elif current_choice["resultado"] == "Verde":
				GlobalReference.verde_choices += 1
		
		
		2:
			if current_choice["resultado"] == "Verde":
				GlobalReference.verde_choices += 1
			elif current_choice["resultado"] == "Azul":
				GlobalReference.azul_choices += 1
			elif current_choice["resultado"] == "Vermelho":
				GlobalReference.vermelho_choices += 1


		3:
			if current_choice["resultado"] == "Verde":
				GlobalReference.verde_choices += 1
			elif current_choice["resultado"] == "Azul":
				GlobalReference.azul_choices += 1
			elif current_choice["resultado"] == "Vermelho":
				GlobalReference.vermelho_choices += 1
