@tool
extends Node

const ZEROf = 0.0
const ONEf = 1.0

@export  var options: SettingsRes  # = preload("default_settings.tres")
@onready var window = get_window()
var projectWindowSizeMode =	ProjectSettings.get_setting("display/window/size/mode")


func _ready() -> void:
	mangleWindow()

func mangleWindow():

	if options.rescale:
	
		var resScale = options.resScale
		if resScale and not resScale == ONEf:

			var curSize   = window.get_size_with_decorations()
			var curWidth  = curSize.x
			var confWidth = ProjectSettings.get_setting("display/window/size/viewport_width")

			# basic check to see if were not already scaled; avoids recursive application in editor
			if ( curWidth == confWidth ):
				window.set_size( Vector2( curSize * options.resScale ) )

			# project specific remove from template probably ;)
				window.position = Vector2i(600,100.0)
			
	else:

		if options.fullScreen:
			window.set_mode(Window.MODE_FULLSCREEN)
		else:
			window.set_mode( projectWindowSizeMode )

func getWindowCenter():
	var window = get_window()
	var size = window.get_size_with_decorations()
	return size / 2.0
	
func _unhandled_input(event: InputEvent) -> void:
	#self.getWindowCenter()
	#print(event)
	if event.is_action_released("req_quit"):
		engine_teardown()
		
func engine_teardown() -> void:
	get_tree().quit()
