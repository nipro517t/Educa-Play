extends Control

var lista_fases = [
	"res://assets/disgner/estouraSilabas/30 Sem Título_20260709230014.png",
	"res://scenes/jogos/Estourador de Sílabas/arena.tscn",
	"res://scenes/jogos/Estourador de Sílabas/bala.tscn",
	"res://scenes/jogos/Estourador de Sílabas/bota.tscn",
	"res://scenes/jogos/Estourador de Sílabas/cama.tscn",
	"res://scenes/jogos/Estourador de Sílabas/cara.tscn",
	"res://scenes/jogos/Estourador de Sílabas/casa.tscn",
	"res://scenes/jogos/Estourador de Sílabas/dama.tscn",
	"res://scenes/jogos/Estourador de Sílabas/faca.tscn",
	"res://scenes/jogos/Estourador de Sílabas/lata.tscn",
	"res://scenes/jogos/Estourador de Sílabas/pata.tscn",
	"res://scenes/jogos/Estourador de Sílabas/vaca.tscn",
	"res://scenes/jogos/Estourador de Sílabas/vara.tscn"
]


func _ready() -> void:
	escolher_fase_aleatoria()

func _process(delta: float) -> void:
	pass

func escolher_fase_aleatoria() -> void:
	var indice_sorteado = randi() % lista_fases.size()
	var caminho_escolhido = lista_fases[indice_sorteado]
	get_tree().change_scene_to_file(caminho_escolhido)
