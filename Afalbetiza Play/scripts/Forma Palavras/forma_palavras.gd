extends Node2D

var lista_fases = [
	"res://scenes/jogos/Forma Palavras/F.P.BALA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.BOCA.tscn", 
	"res://scenes/jogos/Forma Palavras/F.P.BOLA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.BOTA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.CAMA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.CARA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.CASA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.DAMA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.FACA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.LATA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.PATO.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.VACA.tscn",
	"res://scenes/jogos/Forma Palavras/F.P.VARA.tscn"
	
]

func _ready() -> void:
	escolher_fase_aleatoria()
	
func _process(_delta: float) -> void:
	pass

func escolher_fase_aleatoria() -> void:
	var indice_sorteado = randi() % lista_fases.size()
	var caminho_escolhido = lista_fases[indice_sorteado]
	get_tree().change_scene_to_file(caminho_escolhido)
