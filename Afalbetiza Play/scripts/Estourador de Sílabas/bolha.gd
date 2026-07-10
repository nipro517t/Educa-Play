extends Area2D

signal bolha_estourada(texto_silaba)

var silaba_texto = ""

@onready var sprite = $Sprite2D

var cores_disponiveis = [
	Color(1, 1, 1),        # cor original (sem tingir)
	Color(1, 0.4, 0.4),    # vermelho
	Color(0.4, 0.6, 1),    # azul
	Color(0.4, 1, 0.5),    # verde
	Color(1, 0.9, 0.3),    # amarelo
]

func _ready():
	$Label.text = silaba_texto

	sprite.modulate = cores_disponiveis[randi() % cores_disponiveis.size()]
	sprite.play("default")

func _process(delta):
	position.y -= 150 * delta
	if position.y < -50:
		queue_free()

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		emit_signal("bolha_estourada", silaba_texto)
		queue_free()
