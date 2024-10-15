extends Node

@export var debug: bool = false
@export var resScale: float = 1.0

func _init() -> void:
	resScale = 1.0

func _ready() -> void:

	if Global.resize:
		var window    = get_window()
    var curSize   = window.get_size_with_decorations()
		var curWidth  = curSize.x
		var confWidth = ProjectSettings.get_setting_with_override("display/window/size/viewport_width")

		# basic check to see if were not already scaled; avoids recursive application in editor (@tool)
		if ( curWidth == confWidth ):
			window.set_size( Vector2( curSize * resScale ) )
			# project specific remove from template probably ;)
			window.position = Vector2i(600,100.0)

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
