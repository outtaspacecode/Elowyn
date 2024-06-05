extends Camera2D

var resolution : Vector2 = Vector2(480, 264)

func _ready():
	Events.room_entered.connect(func(room):
		var player = get_parent()
		var tween = create_tween()
		get_tree().paused = true
		reset_limits()
		var coming_from : Vector2 = floor(player.global_position / resolution)
		global_position = centerize(coming_from * resolution)
		var going_to : Vector2 = coming_from + player.facing_direction
		tween.tween_property(self, "global_position", centerize(going_to * resolution), 0.75)
		player.global_position += player.facing_direction * Vector2(10, 10)
		
		tween.finished.connect(func():
			get_tree().paused = false
			limit_bottom = room.global_position.y + room.screens.y * 264
			limit_top = room.global_position.y
			limit_left = room.global_position.x
			limit_right = room.global_position.x + room.screens.x * 480
			global_position = player.global_position
		)
	)

func centerize(pos : Vector2) -> Vector2:
	return pos + (resolution / Vector2(2, 2))

func reset_limits() -> void:
	limit_left = -10000000
	limit_top = -10000000
	limit_right = 10000000
	limit_bottom = 10000000
