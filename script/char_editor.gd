class_name CharEditor
extends Node2D


@export var mesh_nodes: Array[Node]
var texture : ImageTexture
func _ready():
	pass

func create_texture(color: Color = Color.BLUE):
	var img = Image.create(8, 8, true, Image.FORMAT_RGB8)
	img.fill(color)
	texture = ImageTexture.create_from_image(img)
	for node in mesh_nodes:
		node.texture = texture


