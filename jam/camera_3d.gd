extends Camera3D

@export var sensitivity := 0.003

# зум переменные
@export var min_fov := 20.0
@export var max_fov := 75.0
@export var zoom_step := 3.0
@export var zoom_speed := 5.0
var pitch := 0.0
var target_fov := 75.0



func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	fov = max_fov
	target_fov = max_fov


func _input(event):
	if event is InputEventMouseMotion:
		
		# поворот 
		get_parent().rotate_y(-event.relative.x * sensitivity)

		# Поворот камеры вверх-вниз
		pitch -= event.relative.y * sensitivity
		pitch = clamp(
			pitch,
			deg_to_rad(-89),
			deg_to_rad(89)
		)
		rotation.x = pitch

	# зум
	elif event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			target_fov -= zoom_step
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			target_fov += zoom_step

		target_fov = clamp(
			target_fov,
			min_fov,
			max_fov
		)

func _process(delta):
	fov = lerp(fov, target_fov, zoom_speed * delta)
