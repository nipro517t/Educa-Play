extends Node2D
@export var bolha_cena: PackedScene
@onready var label: Label = $Label
signal auraMais
# Referências dos nós
@onready var label_palavra = $CanvasLayer/MarginContainer/PalavraAlvo
@onready var estrelas = [
	$CanvasLayer/MarginContainer/HBoxContainer/TextureRect,
	$CanvasLayer/MarginContainer/HBoxContainer/TextureRect2,
	$CanvasLayer/MarginContainer/HBoxContainer/TextureRect3
]
var vidas = 3
var silabas_alvo = ["BO", "CA"]
var silabas_distratoras = ["FA", "DA", "NA", "PA", "LA", "JA", "ZA", "VA", "MA", "BA", "TA", "SA"]
var progresso = 0
var bolhas_corretas_ativas = 0
const MAX_BOLHAS_CORRETAS = 1
func _on_spawn_timer_timeout():
	if progresso < silabas_alvo.size():
		var nova_bolha = bolha_cena.instantiate()
		var eh_correta = randf() > 0.01 and bolhas_corretas_ativas < MAX_BOLHAS_CORRETAS
		if eh_correta:
			nova_bolha.silaba_texto = silabas_alvo[progresso]
			bolhas_corretas_ativas += 1
			nova_bolha.tree_exited.connect(func(): bolhas_corretas_ativas -= 1)
		else:
			nova_bolha.silaba_texto = silabas_distratoras.pick_random()
		nova_bolha.bolha_estourada.connect(_na_bolha_estourada)
		add_child(nova_bolha)
		nova_bolha.position = Vector2(randf_range(100, 1000), 700)
	else:
		$Timer.stop()
func _na_bolha_estourada(texto_estourado):
	# Verifica se acertou
	if progresso < silabas_alvo.size() and texto_estourado == silabas_alvo[progresso]:
		print("Acertou!")
		progresso += 1
		# Atualiza o texto da palavra
		var palavra_montada = ""
		for i in range(progresso):
			palavra_montada += silabas_alvo[i]
		label_palavra.text = "Palavra: " + palavra_montada
		if progresso >= silabas_alvo.size():
			label_palavra.text = "Parabéns!"
			label.text = "BOCA."
			$Timer.stop()
			Pause.adicionar_aura(1)
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn") # Ajuste para o caminho do seu menu
	else:
		# Se errou, tira uma vida
		print("Errou!")
		vidas -= 1
		if vidas >= 0:
			estrelas[vidas].visible = false # Esconde a estrela correspondente
		if vidas <= 0:
			label_palavra.text = "Game Over!"
			$Timer.stop()
