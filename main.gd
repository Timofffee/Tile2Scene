extends Node2D

export var startPos = Vector2(0,0)
export var endPos = Vector2(800,600)

onready var tileMap = get_node("TileMap")
var prefab = preload("res://particle.scn")

func _ready():
	for i in range (startPos.x, endPos.x):
		for j in range (startPos.y, endPos.y):
			var p = tileMap.world_to_map(Vector2(i,j))
			if (tileMap.get_cellv(p) != -1):
				tileMap.set_cellv(p, -1)
				var pref = prefab.instance()
				pref.set_pos(Vector2(i,j))
				pref.set_emitting(true)
				add_child(pref)
	#tileMap.queue_free()								#Variant 