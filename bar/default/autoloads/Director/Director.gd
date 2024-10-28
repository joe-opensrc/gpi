@tool
extends Node

# SHOULD hold PlayerState class
# i.e., if Director.PlayerState.GOD_MODE == True, 
					

# groups:
#		- interestedInPlayer

signal req_scene_transition( c: Node, r: Variant )

# problem will be:
# name of fs resource and scenetree name; if that makes sense ;)
@export var loader: ResourcePreloader

func _ready():
	self.req_scene_transition.connect(doSceneTransition)
	#self.child_entered_tree.connect(_on_child_entered_tree)
	
	# testing:
	#doSceneTransition( Next1 )
 
#func _on_child_entered_tree( n: Node ):
	#node.req_scene_transition.connect()

func doSceneTransition( curScene: Node, reqScene: String ):

	# some director logic...then Enjyn transition...
	Enjyn.doSceneTransition( curScene, reqScene )
