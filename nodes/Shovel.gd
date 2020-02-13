extends RayCast2D

var Hole = preload("res://nodes/hole/Hole.tscn")

export(NodePath) var ground_tilemap
onready var player = get_parent()

var dirs = {
	"up" : Vector2(0, -18),
	"down" : Vector2(0, 36),
	"right" : Vector2(18, 0),
	"left" : Vector2(-18, 0),
}

func _ready():
	assert(ground_tilemap)
	ground_tilemap = get_node(ground_tilemap)

func _physics_process(delta):
	var player_dir = player.get_node("Anim").current_animation.substr(5,-1)
	if player_dir:
		cast_to = dirs.get(player_dir)
	print(cast_to)
	

func _input(event):
	if event.is_action_pressed("dig"):
		dig()

func dig():
	var inst = Hole.instance()
	
	var pos = $Player.global_position + $Player/Shovel.cast_to
	pos = $Ground.world_to_map(pos)
	pos = $Ground.map_to_world(pos)
