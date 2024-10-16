@tool
extends Node

const ZEROf = 0.0
const ONEf = 1.0

@export var options: SettingsRes  # = preload("default_settings.tres")

#func _ready() -> void:
	#ProjectSettings.set("")

func rescaleWindow():

	var resScale = options.resScale
	if not resScale:
		resScale = ONEf

	var window    = get_window()
	var curSize   = window.get_size_with_decorations()
	var curWidth  = curSize.x
	var confWidth = ProjectSettings.get_setting("display/window/size/viewport_width")

		# basic check to see if were not already scaled; avoids recursive application in editor
	if ( curWidth == confWidth ):
		window.set_size( Vector2( curSize * settings.resScale ) )

		# project specific remove from template probably ;)
		window.position = Vector2i(600,100.0)
