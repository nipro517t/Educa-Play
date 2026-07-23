extends Control

var lista_fases = [
	"res://scenes/jogos/alfabetos/AAA_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/BBB_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/CCC_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/DDD_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/EEE_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/FFF_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/GGG_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/HHH_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/III_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/JJJ_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/KKK_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/LLL_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/MMM_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/NNN_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/OOO_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/PPP_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/QQQ_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/RRR_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/SSS_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/TTT_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/UUU_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/VVV_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/WWW_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/XXX_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/YYY_PistaLetras.tscn",
	"res://scenes/jogos/alfabetos/ZZZ_PistaLetras.tscn",
]

func _ready() -> void:
	escolher_fase_aleatoria()
	
func _process(_delta: float) -> void:
	pass

func escolher_fase_aleatoria() -> void:
	var indice_sorteado = randi() % lista_fases.size()
	var caminho_escolhido = lista_fases[indice_sorteado]
	get_tree().change_scene_to_file(caminho_escolhido)
