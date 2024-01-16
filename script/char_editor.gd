class_name CharEditor
extends Node2D

@onready var sprite = $Body/hand2/Node2D/Sprite2D
@export var mesh_nodes: Array[Node]
var texture : ImageTexture
var weapon: BaseWeapon

func create_texture(color: Color = Color.BLUE):
	var img = Image.create(8, 8, true, Image.FORMAT_RGB8)
	img.fill(color)
	texture = ImageTexture.create_from_image(img)
	for node in mesh_nodes:
		node.texture = texture

func set_weapon(weapon1: BaseWeapon):
	weapon = weapon1
	sprite.texture = weapon.texture
	sprite.scale = weapon.scale
	sprite.rotation_degrees = weapon.rot
	sprite.position.y = weapon.y
	sprite.position.x = weapon.x

func get_data() -> CharData:
	var res = CharData.new()
	res.texture = texture
	res.weapon = weapon.duplicate(true)
	return res
