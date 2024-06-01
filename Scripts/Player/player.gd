extends CharacterBody2D

@export var speed : int = 60
@onready var animation = $AnimationPlayer

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	animate()

func animate():
	if velocity.length() == 0:
		if animation.is_playing():
			animation.stop()
		return
	
	var direction = "down"
	#if velocity.x < 0: direction = "left"
	#elif velocity. x > 0: direction = "right"
	#elif velocity.y < 0: direction = "up"
	
	animation.play("walk_" + direction)
