extends CharacterBody2D

@export var speed : int = 60
@onready var animation = $AnimationPlayer
var direction = ""

func _physics_process(_delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
	animate()

func animate():
	if velocity.length() == 0:
		if animation.is_playing():
			animation.stop()
		return
	
	
	if velocity.x < 0 && velocity.y == 0: direction = "left"
	elif velocity. x > 0 && velocity.y == 0: direction = "right"
	elif velocity.y < 0 && velocity.x == 0: direction = "up"
	elif velocity.y > 0 && velocity.x == 0: direction = "down"
	
	var move_speed = "walk_"
	
	if direction != "":
		animation.play(move_speed + direction)
