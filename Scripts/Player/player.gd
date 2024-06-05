extends CharacterBody2D

@export var speed : int = 60
@onready var animation = $AnimationPlayer
var direction = ""
var facing_direction = Vector2(0, 1)

func _physics_process(_delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if(input_direction != Vector2(0, 0)):
		if(abs(round(input_direction.x)) == 1 && abs(round(input_direction.y)) == 1):
			pass
		else:
			facing_direction = input_direction
	velocity = input_direction * speed
	move_and_slide()
	animate()

func animate():
	if velocity.length() == 0:
		if animation.is_playing():
			animation.stop()
		return
	
	
	if facing_direction.x < 0: direction = "left"
	elif facing_direction.x > 0: direction = "right"
	elif facing_direction.y < 0: direction = "up"
	elif facing_direction.y > 0: direction = "down"
	
	var move_speed = "walk_"
	
	if direction != "":
		animation.play(move_speed + direction)
