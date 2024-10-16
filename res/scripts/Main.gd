extends Node

@export var debug: bool = false
@export var resScale: float = 1.0

func _init() -> void:
	pass

func _ready() -> void:

	if Enjyn.options.debug:
		Enjyn.rescaleWindow()

func _unhandled_input(event: InputEvent) -> void:
	#print(event)
	if event.is_action_released("user_quit"):
		engine_teardown()
	
func _process(delta: float) -> void:
	pass
	
func engine_teardown() -> void:
	get_tree().quit()


func _on_reload_pressed() -> void:
	print("reloading...")
	get_tree().reload_current_scene()
