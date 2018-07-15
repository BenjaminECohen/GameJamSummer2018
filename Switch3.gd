extends Area2D
var dungeonFlip = true
var switchDisable = false

signal switch3

func _ready():
	visible = true

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and !switchDisable:
			emit_signal("switch3")
			$Sound.play()
			switchDisable = true

func _on_dungeon_flip():
	if dungeonFlip:
		visible = false
		set_collision_layer_bit(0, false)
		set_collision_mask_bit(0, false)
		dungeonFlip = !dungeonFlip
	else:
		visible = true
		set_collision_layer_bit(0, true)
		set_collision_mask_bit(0, true)
		dungeonFlip = !dungeonFlip