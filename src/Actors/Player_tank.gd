extends KinematicBody2D

var tank_speed = 100
var tank_rotation_speed = 2
var tank_velocity = Vector2.ZERO
var tank_rotation_dir = 0

func get_input():
	tank_rotation_dir = 0
	tank_velocity = Vector2.ZERO
	if Input.is_action_pressed("rotate_right"):
		tank_rotation_dir += 1
	if Input.is_action_pressed("rotate_left"):
		tank_rotation_dir -= 1
	if Input.is_action_pressed("move_forward"):
		tank_velocity += transform.x * tank_speed
	if Input.is_action_pressed("move_back"):
		tank_velocity -= transform.x * tank_speed

func _physics_process(delta):
	get_input()
	rotation += tank_rotation_dir * tank_rotation_speed * delta 
	tank_velocity = move_and_slide(tank_velocity)

