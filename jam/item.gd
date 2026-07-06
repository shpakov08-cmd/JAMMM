extends StaticBody3D

var mesh_node: MeshInstance3D
var original_material: StandardMaterial3D
var highlight_material: StandardMaterial3D
var is_highlighted = false

func _ready():
	mesh_node = $Mesh 
	

	highlight_material = StandardMaterial3D.new()
	highlight_material.emission_enabled = true
	highlight_material.emission = Color(1.0, 0.933, 1.0, 1.0)
	highlight_material.emission_energy_multiplier = 2.0
	
	if mesh_node and mesh_node.mesh:
		original_material = mesh_node.get_active_material(0)

func highlight():
	if not is_highlighted and mesh_node:
		is_highlighted = true
		mesh_node.set_surface_override_material(0, highlight_material)

func unhighlight():
	if is_highlighted and mesh_node:
		is_highlighted = false
		mesh_node.set_surface_override_material(0, original_material)

func pick_up():
	print("Предмет подобран: ", name)
	queue_free() 
