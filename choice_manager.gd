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
	
	#if escolha == "verde":
	choices_order.append(nome_briefing)
		
	print("--- Nova Ação ---")
	print("Última Escolha: ", last_choice)
	print("Escolha Atual: ", current_choice)
	print("Histórico Completo (Choices): ", choices)
