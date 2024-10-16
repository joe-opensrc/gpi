@tool
extends Node

###
# A class to manage scene transitions and Other Things™ 
# Might get split up later into Engine/Scene and Agents/AI, etc.


# preLoadScene()
# transitionNext()
# transitionType() 

# class SceneTransition:
# 	init( ):

# 
#                root
#	     _________ /  \ _______________
#	    /         /    \         \     \
#	 Enjyn    SigBus  Director  UIX  Realm2D



#      ST:		
#	   Realm2D -- Enjyn
#		   / \
#		  .   x       y   -- pla 
#    /   / \     / \
#   .		.   .   .   .
#                  / \
#									.   . 


	func addSceneTransition( self, prev, next, type ) 
	signal reqSceneTransition( self, SceneTransition.Next ) => .connect( doSceneTransition )
	func doSceneTransition( currentScene, dir: SceneTransitionDirection ):
		transition_next

	Enjyn.doSceneTransition(  )

  SceneTransition:
		prev: null
		next: Node2D
		type: Enum: shader|anim|
		strict: false # pointers must be same type
		next|prev():
			if next|prev == null:	restart same scene
			
		- x: 

		SceneTransition
