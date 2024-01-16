extends Control

@export var char1: CharEditorWrapper
@export var char2: CharEditorWrapper

@onready var root_node = $"../.."
@onready var canvas1 = $"../../CanvasLayer"
@onready var canvas2 = $".."

var map = preload("res://scene/map/face.tscn")
var character = preload("res://scene/character.tscn")

func _on_mulai_pressed():
	var chars = []
	chars.append(char2.get_res())
	chars.append(char1.get_res())
	canvas1.hide()
	canvas2.hide()
	var world = map.instantiate()
	root_node.add_child(world)
	var spawns = world.spawns
	for i in chars.size():
		var charr = character.instantiate()
		world.add_child(charr)
		charr.set_weapon(chars[i].weapon)
		charr.set_texture(chars[i].texture)
		charr.global_position = spawns[i].global_position
		if i == 1:
			charr.char2 = true
