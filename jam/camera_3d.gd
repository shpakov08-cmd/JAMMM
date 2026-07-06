extends Camera3D
@onready var raycast = $RayCast3D
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

<<<<<<< Updated upstream
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
=======
		target_fov = clamp(
			target_fov,
			min_fov,
			max_fov
		)

func _process(delta):
	fov = lerp(fov, target_fov, zoom_speed * delta)
	

var current_target: Node3D = null

func _physics_process(_delta):
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		print("Попали в: ", collider.name)
		
		# Ищем предмет: проверяем сам объект и его родителя
		var target = null
		
		if collider.is_in_group("items"):
			target = collider
			print("Это предмет (сам объект)!")
		elif collider.get_parent() and collider.get_parent().is_in_group("items"):
			target = collider.get_parent()
			print("Это предмет (родитель): ", target.name)
		
		if target:
			if current_target != target:
				_clear_target()
				current_target = target
				if current_target.has_method("highlight"):
					current_target.highlight()
		else:
			_clear_target()
	else:
		_clear_target()

	if Input.is_action_just_pressed("interact"):
		if current_target and current_target.has_method("pick_up"):
			current_target.pick_up()
			current_target = null

func _clear_target():
	if current_target and current_target.has_method("unhighlight"):
		current_target.unhighlight()
	current_target = null
>>>>>>> Stashed changes
