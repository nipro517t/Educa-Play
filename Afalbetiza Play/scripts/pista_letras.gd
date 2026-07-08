extends Node2D

@onready var pista_path = $PistaPath
@onready var path_follow = $PistaPath/PathFollow
@onready var carro = $PistaPath/PathFollow/Carro

var arrastando = false
var fase_concluida = false

func _ready():
	# Garante que o carro começa no início da pista (0%)
	path_follow.progress_ratio = 0.0
	
	# Conecta o clique do carrinho via código para economizar seu tempo
	carro.button_down.connect(_on_carro_clicked)
	carro.button_up.connect(_on_carro_released)

func _input(event):
	# Se o jogador soltar o clique/dedo em qualquer lugar da tela
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		arrastando = false
		verificar_se_abandonou_pista()

	# Lógica principal: Arrastar o carro pelo trilho
	if event is InputEventMouseMotion and arrastando and not fase_concluida:
		var mouse_pos = get_global_mouse_position()
		
		# O truque mágico da Godot: acha o ponto do trilho mais próximo do dedo da criança
		var offset_proximo = pista_path.curve.get_closest_offset(mouse_pos)
		
		# Só avança o carrinho se a criança estiver arrastando para a FRENTE
		if offset_proximo > path_follow.progress:
			path_follow.progress = offset_proximo
		
		# Verifica se chegou muito perto do fim (98% da pista concluída)
		if path_follow.progress_ratio >= 0.98:
			ganhou_fase()

func _on_carro_clicked():
	if not fase_concluida:
		arrastando = true

func _on_carro_released():
	arrastando = false
	verificar_se_abandonou_pista()

func verificar_se_abandonou_pista():
	# Se a criança soltar o carro no meio do caminho, ele volta pro início suavemente (Pedagógico)
	if not fase_concluida and path_follow.progress_ratio < 0.95:
		var tween = create_tween()
		tween.tween_property(path_follow, "progress_ratio", 0.0, 0.6).set_trans(Tween.TRANS_CUBIC)

func ganhou_fase():
	fase_concluida = true
	arrastando = false
	print("Vitória! Tocar áudio: AAAAA!")
	# AudioManager.play_sfx("som_letra_a")
	
	# Espera 2 segundos na tela de vitória e volta pro menu principal
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/MenuPrincipal.tscn") # Ajuste para o caminho do seu menu
