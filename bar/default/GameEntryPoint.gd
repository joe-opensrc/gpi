extends ResourcePreloader

#var sceneResMap: Dictionary = {
	#"sName": StringName,
	#"sPath": String
#}

func _ready() -> void:
	#ResourceLoader.load_threaded_request("res://")
	#await get_tree().create_timer(2.0).timeout
	Director.scene_transition_requested.emit($MyNode, "res://Realms.tscn")
	




### Add these to project settings...
# [display]
# 
# window/stretch/mode="canvas_items"
# 
# [editor]
# 
# naming/scene_name_casing=1
# naming/script_name_casing=1
# 
# [input]
# 
# user_req_quit={
# "deadzone": 0.5,
# "events": [Object(InputEventKey,"resource_local_to_scene":false,"resource_name":"","device":-1,"window_id":0,"alt_pressed":true,"shift_pressed":false,"ctrl_pressed":false,"meta_pressed":false,"pressed":false,"keycode":0,"physical_keycode":81,"key_label":0,"unicode":113,"location":0,"echo":false,"script":null)
# ]
# }
