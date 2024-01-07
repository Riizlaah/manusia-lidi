extends Control

@onready var play_ui = $"../../CanvasLayer2"
@onready var animation = $"../../AnimationPlayer"

func _ready():
	show()
	animation.play("when-ready")

func _on_play_pressed():
	hide()
	play_ui.show()
	animation.play("play_ui")

func _on_quit_pressed():
	get_tree().quit()

func _on_close_pressed():
	animation.play_backwards("play_ui")
	await get_tree().create_timer(0.259).timeout
	play_ui.hide()
	show()
