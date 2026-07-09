extends Node2D

@export var bolha_cena: PackedScene

# Referências dos nós que você me passou
@onready var label_palavra = $CanvasLayer/MarginContainer/PalavraAlvo
@onready var estrelas = [
	$CanvasLayer/MarginContainer/HBoxContainer/TextureRect,
	$CanvasLayer/MarginContainer/HBoxContainer/TextureRect2,
	$CanvasLayer/MarginContainer/HBoxContainer/TextureRect3
]

var vidas = 3
var silabas_alvo = ["BO", "LA"]
var silabas_distratoras = ["CA", "MA", "PA"]
var progresso = 0

func _on_spawn_timer_timeout():
	if progresso < silabas_alvo.size():
		var nova_bolha = bolha_cena.instantiate()
		
		if randf() > 0.5:
			nova_bolha.silaba_texto = silabas_alvo[progresso]
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
			$Timer.stop()
	else:
		# Se errou, tira uma vida
		print("Errou!")
		vidas -= 1
		if vidas >= 0:
			estrelas[vidas].visible = false # Esconde a estrela correspondente
		
		if vidas <= 0:
			label_palavra.text = "Game Over!"
			$Timer.stop()
