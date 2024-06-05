extends Area2D

@export var screens : Vector4 = Vector4()

func _on_body_entered(_body):
	Events.room_entered.emit(self)
