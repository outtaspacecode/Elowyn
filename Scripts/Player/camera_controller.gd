extends Camera2D

func _ready():
	Events.room_entered.connect(func(room):
		var tween = create_tween()
		get_tree().paused = true
		reset_limits()
		tween.tween_property(self, "global_position", room.global_position + Vector2(240, 132), 0.5)
		
		tween.finished.connect(func():
			get_tree().paused = false
			print("here")
			limit_bottom = room.global_position.y + room.screens.y * 264
			limit_top = room.global_position.y
			limit_left = room.global_position.x
			limit_right = room.global_position.x + room.screens.x * 480
			global_position = get_parent().global_position
		)
	)

func reset_limits() -> void:
	limit_left = -10000000
	limit_top = -10000000
	limit_right = 10000000
	limit_bottom = 10000000
