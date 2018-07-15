#Main Menu
extends Control

onready var global = get_node("/root/GlobalMusic")
onready var song = get_node("/root/GlobalSong")

func _ready():
	song.play()

func _on_StartGame_pressed():
	global.play()
	song.stop()
	get_tree().change_scene("dungeon.tscn")


func _on_Controls_pressed():
	global.play()
	get_tree().change_scene("ControlsMenu.tscn")


func _on_ExitGame_pressed():
	get_tree().quit()
