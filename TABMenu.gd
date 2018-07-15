extends Control
var menuVisibility = true
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	visible = false

func _on_dungeon_menu():
	print("Here")
	if menuVisibility:
		visible = true
		menuVisibility = false
	else:
		visible = false
		menuVisibility = true


func _on_RestartLevel_pressed():
	get_tree().reload_current_scene()


func _on_QuitLevel_pressed():
	get_tree().change_scene("MainMenu.tscn")
