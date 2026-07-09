extends Area2D

signal bolha_estourada(texto_silaba) # Sinal que avisa o jogo principal

var silaba_texto = ""

func _ready():
	$Label.text = silaba_texto

func _process(delta):
	# A bolha sobe sozinha
	position.y -= 150 * delta 
	# Remove se sair da tela (para economizar memória)
	if position.y < -50:
		queue_free()

func _on_input_event(_viewport, event, _shape_idx):
	# Se clicar na bolha
	if event is InputEventMouseButton and event.pressed:
		emit_signal("bolha_estourada", silaba_texto)
		queue_free() # Some com a bolha
