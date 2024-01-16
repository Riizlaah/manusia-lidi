class_name CharEditorWrapper
extends VBoxContainer
#mn = Minus, wpn = Weapon, pl = Plus, clr = Color, char = Character
@onready var wpn_label = $Hbox/Label

@export var char_editor: CharEditor
@export var weapons: Array[BaseWeapon]
var currWeapon := 0
var colors = [
	Color.WHITE, Color.BLACK, Color.BLUE, Color.RED, Color.GREEN, Color.DARK_GRAY, Color.PURPLE, Color.ORANGE
]
var currColor := 0

func _ready():
	update_color()
	update_weapon()

func get_res():
	return char_editor.get_data()

func _on_mnwpn_pressed():
	currWeapon = (currWeapon - 1) % weapons.size()
	update_weapon()

func _on_plwpn_pressed():
	currWeapon = (currWeapon + 1) % weapons.size()
	update_weapon()
func update_weapon():
	char_editor.set_weapon(weapons[currWeapon])
	wpn_label.text = weapons[currWeapon].weapon_name
func _on_mnclr_pressed():
	currColor = (currColor - 1) % colors.size()
	update_color()
func _on_plclr_pressed():
	currColor = (currColor + 1) % colors.size()
	update_color()
func update_color():
	char_editor.create_texture(colors[currColor])
