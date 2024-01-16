extends CharacterBody2D

@onready var sprite = $Body/hand2/Node2D/Sprite2D
@export var meshes: Array[MeshInstance2D]
@export var char2: bool = false

const SPEED = 300.0
const JUMP_VELOCITY = -780.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 780
var texture: ImageTexture
var weapon: BaseWeapon
var jump_wait
var jump_wait2

func _ready():
	jump_wait = Setting.JUMP_WAIT
	jump_wait2 = Setting.JUMP_WAIT

func _physics_process(delta):
	# Add the gravity.
	var direction
	if !is_on_floor():
		velocity.y += gravity * delta
		print(velocity.y)
	if char2:
		direction = Input.get_axis("j", "l")
	else:
		direction = Input.get_axis("a", "d")
	if Input.is_action_pressed("i"):
		jump_wait2 -= 1
	if Input.is_action_pressed("w"):
		jump_wait -= 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if jump_wait == 0 and !char2 and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_wait = Setting.JUMP_WAIT
	elif jump_wait2 == 0 and char2 and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_wait2 = Setting.JUMP_WAIT
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func set_weapon(weapon1: BaseWeapon):
	weapon = weapon1
	sprite.texture = weapon.texture
	sprite.scale = weapon.scale
	sprite.rotation_degrees = weapon.rot
	sprite.position.y = weapon.y
	sprite.position.x = weapon.x

func set_texture(texture1: ImageTexture):
	texture = texture1
	for node in meshes:
		node.texture = texture
