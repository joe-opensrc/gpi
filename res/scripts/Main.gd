extends Node

func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	pass
	
func _on_reload_pressed() -> void:
	print("reloading...", self)
	get_tree().reload_current_scene()
