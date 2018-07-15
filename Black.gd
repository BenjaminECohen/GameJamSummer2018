extends TileMap
var dungeonFlip = true

func _ready():
	set_collision_layer_bit(0, false)
	set_collision_mask_bit(0, false)


func _on_dungeon_flip():
	if dungeonFlip:
		set_collision_layer_bit(0, true)
		set_collision_mask_bit(0, true)
		dungeonFlip = !dungeonFlip
	else:
		set_collision_layer_bit(0, false)
		set_collision_mask_bit(0, false)
		dungeonFlip = !dungeonFlip


func _on_Switch_switch1():
	self.set_cell(20, -3, -1)


func _on_Switch2_switch2():
	self.set_cell(8, -2, -1)


func _on_Switch3_switch3():
	self.set_cell(4, 2, -1)
