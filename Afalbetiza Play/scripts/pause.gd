extends CanvasLayer


@onready var label: Label = $Label


var aura = 0

func _ready() -> void:
	atualizar_label()

func atualizar_label() -> void:
	label.text = "Aura: " + str(aura)

func adicionar_aura(quantidade: int = 1) -> void:
	aura += quantidade
	atualizar_label()

func definir(quantidade: int) -> void:
	aura = quantidade
	atualizar_label()

func _on_arena_aura_mais() -> void:
	aura += 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = "Aura: "  + str(aura)


func _on_texture_button_pressed() -> void:
	var cena_pausa = preload("res://scenes/menupause.tscn").instantiate()
	get_tree().root.add_child(cena_pausa)

	get_tree().paused = true
