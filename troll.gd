extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.
var darkMode = false
# Member variables
#160 was original
export(int) var MOTION_SPEED
#const MOTION_SPEED = 500 # Pixels/second

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		#$Sprite.animation = "Up"
	if Input.is_action_pressed("move_bottom") or Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		#$Sprite.animation = "Down"
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		#$Sprite.animation = "Right"
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		#$Sprite.animation = "Right"
	
	if motion.x != 0 and motion.y != 0:
		$Sprite.flip_h = motion.x < 0
		if motion.y < 0:
			if darkMode:
				$Sprite.animation = "UpRightDark"
			else:
				$Sprite.animation = "UpRight"
		elif motion.y > 0:
			if darkMode:
				$Sprite.animation = "DownRightDark"
			else:
				$Sprite.animation = "DownRight"
	elif motion.x != 0 and motion.y == 0:
		$Sprite.flip_h = motion.x < 0
		if darkMode:
			$Sprite.animation = "RightDark"
		else:
			$Sprite.animation = "Right"
	elif motion.y != 0 and motion.x == 0:
		if motion.y < 0:
			if darkMode:
				$Sprite.animation = "UpDark"
			else:
				$Sprite.animation = "Up"
		else:
			if darkMode:
				$Sprite.animation = "DownDark"
			else:
				$Sprite.animation = "Down"
	else:
		if darkMode:
			$Sprite.animation = "IdleDark"
		else:
			$Sprite.animation = "Idle"
	
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)
	

func _on_dungeon_flip():
	if !darkMode:
		darkMode = true
	else:
		darkMode = false
