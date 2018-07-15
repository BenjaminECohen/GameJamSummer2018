extends Node2D

var whiteToggle = true
signal flip 

signal menu

var allowFlip = false

func _unhandled_input(event):
	if event is InputEventKey:
		if (event.pressed and event.scancode == KEY_A) and allowFlip:
			emit_signal("flip")
			if whiteToggle:
				get_node("White").hide()
				get_node("WhiteFloor").hide()
				get_node("Black").show()
				get_node("BlackFloor").show()
				get_node("Particles").get_node("WhiteParticles").hide()
				get_node("Particles").get_node("BlackParticles").show()
				get_node("WhiteSound").set_volume_db(-80.0)
				get_node("BlackSound").set_volume_db(-5.0)
				whiteToggle = false
			else: 
				get_node("White").show()
				get_node("WhiteFloor").show()
				get_node("Black").hide()
				get_node("BlackFloor").hide()
				get_node("Particles").get_node("WhiteParticles").show()
				get_node("Particles").get_node("BlackParticles").hide()
				get_node("WhiteSound").set_volume_db(-5.0)
				get_node("BlackSound").set_volume_db(-80.0)
				whiteToggle = true
				
		if event.pressed and event.scancode == KEY_TAB:
			emit_signal("menu")


func _on_FlipArea1_flipArea():
	allowFlip = true


func _on_NonFlipArea_flipCancel():
	allowFlip = false


func _on_FlipArea2_flipArea():
	allowFlip = true


func _on_FlipArea3_flipArea():
	allowFlip = true
