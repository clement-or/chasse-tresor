extends Node2D

func _ready():
	pass

func _physics_process(delta):
	update()

func _draw():
	var s = $Player.global_position
	
	var pos = $Player.global_position + $Player/Shovel.cast_to
	pos = $Ground.world_to_map(pos)
	pos = $Ground.map_to_world(pos)
	
	draw_line(
		$Player/Shovel.global_position, $Player.position+$Player/Shovel.cast_to, Color.red
	)
	draw_rect(
		Rect2(pos, Vector2(16,16)), 
		Color(0,0,0,.5))
