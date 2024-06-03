extends Node2D

@export var dimensions : Vector2i = Vector2i(1,1)
@export var offset : Vector2i = Vector2i(0, 0)
@export var player : CharacterBody2D
@export var cam : Camera2D

var screen_size : Vector2i = Vector2i(480,264)
var box_size : Vector2i = Vector2i(2, 2)

@onready var left = $left/CollisionShape2D
@onready var right = $right/CollisionShape2D
@onready var top = $top/CollisionShape2D
@onready var bottom = $bottom/CollisionShape2D

func _ready():
	scale_camera()

func _physics_process(_delta):
	var leave_area = $top.get_overlapping_bodies()
	if leave_area.size() > 0.0:
		offset.y -= dimensions.y
		scale_camera()
	
	leave_area = $bottom.get_overlapping_bodies()
	if leave_area.size() > 0.0:
		offset.y += dimensions.y
		scale_camera()
	
	leave_area = $left.get_overlapping_bodies()
	if leave_area.size() > 0.0:
		offset.x -= dimensions.x
		scale_camera()
	
	leave_area = $right.get_overlapping_bodies()
	if leave_area.size() > 0.0:
		offset.x += dimensions.x
		scale_camera()


func scale_camera() -> void:
	var left_limit = offset.x * screen_size.x
	var top_limit = offset.y * screen_size.y
	var right_limit = screen_size.x * dimensions.x
	var bottom_limit = screen_size.y * dimensions.y
	
	cam.limit_left = left_limit
	cam.limit_top = top_limit
	cam.limit_right = left_limit + right_limit
	cam.limit_bottom = top_limit + bottom_limit
	
	left.scale = Vector2(1, 1)
	@warning_ignore("integer_division")
	left.scale.y = screen_size.y / 18 * dimensions.y
	left.scale.x = 0.1
	@warning_ignore("integer_division")
	left.global_position.x = box_size.y / -2
	@warning_ignore("integer_division")
	left.global_position.y = (screen_size.y * dimensions.y) / 2
	var offsetF := (offset * screen_size) as Vector2
	left.global_position += offsetF
	
	top.scale = Vector2(1, 1)
	@warning_ignore("integer_division")
	top.scale.x = screen_size.x / 20 * dimensions.x
	top.scale.y = 0.1
	@warning_ignore("integer_division")
	top.global_position.y = box_size.x / -2
	@warning_ignore("integer_division")
	top.global_position.x = (screen_size.x * dimensions.x) / 2
	top.global_position += offsetF
	
	
	right.scale = Vector2(1, 1)
	@warning_ignore("integer_division")
	right.scale.y = screen_size.y / 18 * dimensions.y
	right.scale.x = 0.1
	@warning_ignore("integer_division")
	right.global_position.x = (screen_size.x * dimensions.x) + box_size.y / 2
	@warning_ignore("integer_division")
	right.global_position.y = (screen_size.y * dimensions.y) / 2
	right.global_position += offsetF
	
	bottom.scale = Vector2(1, 1)
	@warning_ignore("integer_division")
	bottom.scale.x = screen_size.x / 20 * dimensions.x
	bottom.scale.y = 0.1
	@warning_ignore("integer_division")
	bottom.global_position.y = (screen_size.y * dimensions.y) + box_size.x / 2
	@warning_ignore("integer_division")
	bottom.global_position.x = (screen_size.x * dimensions.x) / 2
	bottom.global_position += offsetF
