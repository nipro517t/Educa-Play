extends Control

@onready var titulo_jogo = $TituloJogo

var lista_jogos: Array = [
	"A Pista das Letras",
	"Cortador de Sílabas",
	"FORMA PALAVRAS"
]


var indice_atual: int = 0

func _ready():
	
	atualizar_card()

func atualizar_card():
	titulo_jogo.text = lista_jogos[indice_atual]

func _on_botao_esquerda_pressed():
	if indice_atual > 0:
		indice_atual -= 1
	else:
		indice_atual = lista_jogos.size() - 1 # Volta para o último se passar do início
	atualizar_card()

func _on_botao_direita_pressed():
	if indice_atual < lista_jogos.size() - 1:
		indice_atual += 1
	else:
		indice_atual = 0 
	atualizar_card()
