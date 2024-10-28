extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	print("READY: %s" % self)
	await get_tree().create_timer(1.5).timeout
	print("3SECTO: %s" % self)
	#NodePath
	Director.scene_transition_requested.emit(self, "res://Next1.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
