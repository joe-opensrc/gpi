class_name SettingsRes extends Resource

@export var debug: bool			= false
@export var resScale: float = 1.0

# probably possible to overengineer with setget ;)
@export var W: int = ProjectSettings.get_setting("display/window/size/viewport_width")
@export var H: int = ProjectSettings.get_setting("display/window/size/viewport_height")
