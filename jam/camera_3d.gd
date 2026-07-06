extends Camera3D

@export var sensitivity := 0.003

var pitch := 0.0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		
		pitch -= event.relative.y * sensitivity
		pitch = clamp(pitch, deg_to_rad(-89), deg_to_rad(89))
		rotation.x = pitch

		
		if get_parent():
			get_parent().rotate_y(-event.relative.x * sensitivity)

	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
