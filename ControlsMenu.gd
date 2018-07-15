#Screen that shows the controls of the game
extends Control

onready var global = get_node("/root/GlobalMusic")

signal menuReturn

func _on_Return_to_Menu_pressed():
	global.play()
	emit_signal("menuReturn")
	get_tree().change_scene("MainMenu.tscn")
