@tool
extends Node

const ZEROf = 0.0
const ONEf = 1.0

@export  var options: SettingsRes  # = preload("default_settings.tres")
@onready var window = get_window()

var projectWindowSizeMode =	ProjectSettings.get_setting("display/window/size/mode")

@export var loader: ResourcePreloader

func _init() -> void:
	if not options:
		options = SettingsRes.new()

func _ready() -> void:
	self.mangleWindow()

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
	if not Engine.is_editor_hint():
		if event.is_action_released("user_quit"):
			engine_teardown()
		
func engine_teardown() -> void:
	get_tree().quit()

# Scene based shenanigans
func doSceneTransition( curScene, reqScene ):

	var sceneExists = ResourceLoader.exists( reqScene )
	var sceneCached = ResourceLoader.has_cached( reqScene )
	var nextSceneRes: Resource
	var nextScene: Node
	
	#print("DST: %s" % type_string( typeof( reqScene ) ) )
	print("DST: RL: exists: %s, cached: %s" % [ sceneExists, sceneCached ] )
	if sceneExists:
		if not sceneCached:
			nextSceneRes = ResourceLoader.load( reqScene )
			nextScene = nextSceneRes.instantiate()
			curScene.add_sibling.call_deferred( nextScene )
	curScene.queue_free()

	# if get_node_or_null(reqScene):
		# print("ALREADY")
	# else:
		
		#curScene.add_sibling( load(reqScene).instantiate() )
	#match typeof( reqScene ):
		#"String":
		#"Node":
		#"NodePath":
		#TYPE_NODE_PATH

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
#   Realm2D -- Enjyn
#    / \
#   .   x        y   -- pla 
#  /   / \      / \
# .   .   .    .   .  
#    / \
#   .   . 


	#func addSceneTransition( self, prev, next, type ) 
	#signal reqSceneTransition( self, SceneTransition.Next ) => .connect( doSceneTransition )
	#func doSceneTransition( currentScene, dir: SceneTransitionDirection ):
		#transition_next

	#Enjyn.doSceneTransition(  )

  #SceneTransition:
		#prev: null
		#next: Node2D
		#type: Enum: shader|anim|
		#strict: false # pointers must be same type
		#next|prev():
			#if next|prev == null:	restart same scene
			#
		#- x: 
#
		#SceneTransition
