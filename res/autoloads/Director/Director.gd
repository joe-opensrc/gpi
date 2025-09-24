@tool
extends Node

# SHOULD hold PlayerState class (or make separate?)
# i.e., if Director.PlayerState.GOD_MODE == True, 
					
# groups:
#		- interestedInPlayer

signal req_scene_transition( c: Node, r: Variant )

func _ready():
	self.req_scene_transition.connect(doSceneTransition)

func doSceneTransition( curScene: Node, reqScene: String ):

	# some director logic...then Enjyn transition...
	Enjyn.doSceneTransition( curScene, reqScene )
