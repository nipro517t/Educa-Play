extends Control

var lista_fases = [
	"res://scenes/jogos/Estourador de Sílabas/bala.tscn",
	"res://scenes/jogos/Estourador de Sílabas/pata.tscn",
	"res://scenes/jogos/Estourador de Sílabas/vaca.tscn",
]

func _ready() -> void:
	escolher_fase_aleatoria()

func _process(delta: float) -> void:
	pass

func escolher_fase_aleatoria() -> void:
	var indice_sorteado = randi() % lista_fases.size()
	var caminho_escolhido = lista_fases[indice_sorteado]
	get_tree().change_scene_to_file(caminho_escolhido)
