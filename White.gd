extends TileMap
var dungeonFlip = true
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_collision_layer_bit(0, true)
	set_collision_mask_bit(0, true)


func _on_dungeon_flip():
	if dungeonFlip:
		set_collision_layer_bit(0, false)
		set_collision_mask_bit(0, false)
		dungeonFlip = !dungeonFlip
	else:
		set_collision_layer_bit(0, true)
		set_collision_mask_bit(0, true)
		dungeonFlip = !dungeonFlip


#func _on_Switch_switch1():
	#self.set_cell(11, -13, -1)
