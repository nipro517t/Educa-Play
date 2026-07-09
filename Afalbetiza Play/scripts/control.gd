extends Node2D

signal pause

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	var cena_pausa = preload("res://scenes/menupause.tscn").instantiate()
	get_tree().root.add_child(cena_pausa)

	get_tree().paused = true
