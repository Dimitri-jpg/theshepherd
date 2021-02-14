extends Spatial

func _ready():
	
	#var map_limits = $TileMap.get_used_rect()
	#$Player/Camera3D.limit_left = map_limits.position.x * $TileMap.cell_size.x
	#$Player/Camera3D.limit_top = map_limits.position.z * $TileMap.cell_size.z
	#$Player/Camera3D.limit_right = map_limits.end.x * $TileMap.cell_size.x
	#$Player/Camera3D.limit_bottom = map_limits.end.z * $TileMap.cell_size.z
	
	for object in get_tree().get_nodes_in_group("minimap_objects"):
		object.connect("removed", $wrld/Control/ViewportContainer/MiniMap, "_on_object_removed")

