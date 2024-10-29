@tool
class_name SettingsRes extends Resource

@export var debug: bool			 = false
@export var rescale: bool    = true
@export var resScale: float  = 0.6 
@export var fullScreen: bool = false


# probably possible to overengineer with setget ;)
@export var W: int = ProjectSettings.get_setting("display/window/size/viewport_width")
@export var H: int = ProjectSettings.get_setting("display/window/size/viewport_height")
