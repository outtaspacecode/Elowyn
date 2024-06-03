extends Area2D

@export var screens : Vector2i = Vector2i(1, 1)

func _ready():
	scale.x = screens.x * 24
	scale.y = screens.y * 13.2

func _on_body_entered(_body):
	Events.room_entered.emit(self)
