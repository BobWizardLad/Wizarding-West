extends TileMap

onready var Pawn = get_node("Pawn")
onready var show_pos = get_node("show_pos")

# Offsets for the tilemap
var offset_x = -512
var offset_y = -192
var map_offset_x = 14
var map_offset_y = -2

var tile = null
var mouse_pos = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Account for the tilemap being centered off of the top right of the screen
	mouse_pos = get_global_mouse_position()
	
func _input(event):
	# Mouse Action
	# 
	# When the mouse is clicked the selection is either on the pawn, on
	# the map, or off the map. Do not react if mouse click is off map.
	if(event.is_action_pressed("action")):
		tile = world_to_map(Vector2(mouse_pos.x + offset_x, mouse_pos.y + offset_y))
		if(world_to_map($Pawn.global_position) == tile):
			# Set up pawn moving indicator
			pass
		elif(get_cellv(tile) != -1):
			$Pawn.global_position = map_to_world(Vector2(tile.x + map_offset_x, tile.y + map_offset_y))
			$show_pos.set_text(str(tile.x) + "\n" + str(tile.y))
