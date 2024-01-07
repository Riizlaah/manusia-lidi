extends Control
#mn = Minus, wpn = Weapon, pl = Plus, clr = Color, char = Character

@export var char_editor: CharEditor
var colors = [
	Color.WHITE, Color.BLACK, Color.BLUE, Color.RED, Color.GREEN, Color.DARK_GRAY, Color.PURPLE, Color.ORANGE
]
var currColor := 0


func _on_mnwpn_pressed():
	pass # Replace with function body.

func _on_plwpn_pressed():
	pass # Replace with function body.

func _on_mnclr_pressed():
	if currColor > 0:
		currColor -= 1
		update_color()
	else:
		currColor = 7
		update_color()
func _on_plclr_pressed():
	if currColor < 7:
		currColor += 1
		update_color()
	else:
		currColor = 0
		update_color()
func update_color():
	char_editor.create_texture(colors[currColor])

func _on_mnchar_pressed():
	pass # Replace with function body.

func _on_plchar_pressed():
	pass # Replace with function body.
