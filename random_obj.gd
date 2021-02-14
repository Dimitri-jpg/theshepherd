extends Spatial

var grassx
var grassy=0
var grassz
var treex
var treey=0
var treez

func _ready():
	randomize()
	#for i in range(5):
	var grass=preload("res://objects/grass.tscn").instance()
	grassx=rand_range(20, 90)
	grassz=rand_range(20, 90)
	print(grassx)
	print(grassy)
	print(grassz)
	grass.translation.x=grassx
	grass.translation.y=grassy
	grass.translation.z=grassz
	add_child(grass)
	
	
	var tree=preload("res://objects/tree.tscn").instance()
	treex=rand_range(20, 90)
	treez=rand_range(20, 90)
	print(treex)
	print(treey)
	print(treez)
	tree.translation.x=treex
	tree.translation.y=treey
	tree.translation.z=treez
	add_child(tree)
