extends CharacterBody2D


const SPEED = 150


func _process(delta):
	
	var input_vector := Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		$Sprite2D.play("right")
		input_vector.x = 1
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.play("left")
		input_vector.x = -1
	if Input.is_action_pressed("ui_up"):
		$Sprite2D.play("up")
		input_vector.y = -1
	if Input.is_action_pressed("ui_down"):
		$Sprite2D.play("down")
		input_vector.y = 1
	
	if input_vector.x != 0:
		input_vector.y = 0
	
	velocity = input_vector.normalized() * SPEED
	
	move_and_slide()
	
	if input_vector == Vector2.ZERO:
		$Sprite2D.stop()
		$Sprite2D.frame = 0
