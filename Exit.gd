extends Area2D
var dungeonFlip = true
var switchDisable = false
#export(String, FILE, "*.tscn") var next_level

func _ready():
	visible = false

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and !switchDisable:
			get_tree().change_scene("dungeon2.tscn")

func _on_dungeon_flip():
	if dungeonFlip:
		visible = true
		set_collision_layer_bit(0, true)
		set_collision_mask_bit(0, true)
		dungeonFlip = !dungeonFlip
	else:
		visible = false
		set_collision_layer_bit(0, false)
		set_collision_mask_bit(0, false)
		dungeonFlip = !dungeonFlip