extends Control
# Caminhos ajustados exatamente para a sua árvore de nós da foto:
@onready var alvo_container = $AlvoContainer
@onready var opcoes_container = $OpcoesContainer
@onready var mensagem_label = $MensagemLabel
# Lista da palavra da vez e sílabas para confundir o jogador
var palavra_alvo: Array = ["LA", "TA"]
var silabas_distratoras: Array = ["DA", "CA", "VA", "PA", "CO", "FA", "RA", "MA", "BO"]
var tentativa_atual: Array = []
func _ready():
	mensagem_label.text = "Monte a palavra!"
	iniciar_fase()
func iniciar_fase():
	tentativa_atual.clear()
	limpar_containers()
	
	# 1. Junta as sílabas certas com duas distratoras aleatórias e embaralha
	var todas_silabas = palavra_alvo.duplicate()
	todas_silabas.append(silabas_distratoras.pick_random())
	todas_silabas.append(silabas_distratoras.pick_random())
	todas_silabas.shuffle()
	
	# 2. Cria os espaços vazios (slots "_") no AlvoContainer (parte de cima)
	for i in range(palavra_alvo.size()):
		var slot = Button.new()
		slot.text = "_"
		slot.disabled = true # Apenas visual no início
		slot.custom_minimum_size = Vector2(80, 80)
		alvo_container.add_child(slot)
		
	# 3. Gera os botões clicáveis no OpcoesContainer (parte de baixo)
	for silaba in todas_silabas:
		var botao = Button.new()
		botao.text = silaba
		botao.custom_minimum_size = Vector2(80, 80)
		# Conecta o clique do botão para a nossa função de montagem
		botao.pressed.connect(_na_silaba_clicada.bind(botao))
		opcoes_container.add_child(botao)
func _na_silaba_clicada(botao_clicado: Button):
	# Só aceita o clique se ainda faltar completar a palavra
	if tentativa_atual.size() < palavra_alvo.size():
		var texto_silaba = botao_clicado.text
		tentativa_atual.append(texto_silaba)
		
		# Esconde e desativa o botão clicado lá embaixo
		botao_clicado.disabled = true
		botao_clicado.visible = false
		
		# Preenche o próximo espaço vazio lá em cima
		var indice = tentativa_atual.size() - 1
		var slot = alvo_container.get_child(indice)
		slot.text = texto_silaba
		
		# Se completou o tamanho da palavra, verifica o resultado
		if tentativa_atual.size() == palavra_alvo.size():
			verificar_resultado()
func verificar_resultado():
	if tentativa_atual == palavra_alvo:
		mensagem_label.text = "Parabéns! Você acertou!"
		Pause.adicionar_aura(1)
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn")
	else:
		mensagem_label.text = "Ops, tente novamente!"
		# Espera 1.5 segundos e reinicia a tentativa para o jogador tentar de novo
		await get_tree().create_timer(1.5).timeout
		reiniciar_tentativa()
func reiniciar_tentativa():
	tentativa_atual.clear()
	mensagem_label.text = "Monte a palavra!"
	
	# Reseta os textos dos slots lá em cima para "_"
	for slot in alvo_container.get_children():
		slot.text = "_"
		
	# Reativa todos os botões de opções lá embaixo para visíveis novamente
	for botao in opcoes_container.get_children():
		botao.disabled = false
		botao.visible = true
func limpar_containers():
	for filho in alvo_container.get_children():
		filho.queue_free()
	for filho in opcoes_container.get_children():
		filho.queue_free()
