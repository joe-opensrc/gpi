@tool
class_name SettingsRes extends Resource

@export var debug: bool			= false
@export var rescale: bool   = true
@export var resScale: float = 1.0

enum StretchMode { disabled, canvas_items, viewport }
@export var stretchMode: StretchMode

func _setStretchMode( m: int ):
	ProjectSettings.set_setting("display/window/stretch/mode", StretchMode.find_key(m) )

# probably possible to overengineer with setget ;)
@export var W: int = ProjectSettings.get_setting("display/window/size/viewport_width")
@export var H: int = ProjectSettings.get_setting("display/window/size/viewport_height")
