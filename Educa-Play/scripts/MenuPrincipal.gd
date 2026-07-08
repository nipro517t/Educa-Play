extends Control

@onready var titulo_jogo = $TituloJogo
@onready var card_central = $CardCentral

var indice_atual
var lista_jogos: Array = [
	{"nome": "A Pista das Letras", "cena": "res://scenes/jogos/A Pista das Letras.tscn", "imagem": preload("res://acerts/disgner/images.jpg")},
	{"nome": "Cortador de Sílabas", "cena": "res://scenes/jogos/Cortador de Sílabas.tscn", "imagem": preload("res://acerts/disgner/download.jpg")},
	{"nome": "FORMA PALAVRAS", "cena": "res://scenes/jogos/FORMA PALAVRAS.tscn", "imagem": preload("res://acerts/disgner/1-jpg-1200px-k8wi5ylara.webp")},
]

func _ready():
	indice_atual = 0        # garante que começa no primeiro jogo
	atualizar_card()

func atualizar_card():
	var jogo = lista_jogos[indice_atual]
	titulo_jogo.text = jogo["nome"]
	card_central.texture_normal = jogo["imagem"]

func _on_botao_esquerda_pressed():
	if indice_atual > 0:
		indice_atual -= 1
	else:
		indice_atual = lista_jogos.size() - 1
	atualizar_card()

func _on_botao_direita_pressed():
	if indice_atual < lista_jogos.size() - 1:
		indice_atual += 1
	else:
		indice_atual = 0
	atualizar_card()

func _on_card_central_pressed():
	var cena = lista_jogos[indice_atual]["cena"]
	if ResourceLoader.exists(cena):
		get_tree().change_scene_to_file(cena)
	else:
		print("Cena não encontrada: ", cena)
