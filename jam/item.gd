extends StaticBody3D

var mesh_node: MeshInstance3D
var original_material: Material
var transparent_material: StandardMaterial3D
var is_highlighted = false

func _ready():
	mesh_node = $Mesh
	
	if mesh_node:
		original_material = mesh_node.get_surface_override_material(0)
		if original_material == null:
			original_material = mesh_node.mesh.surface_get_material(0)
		
		transparent_material = StandardMaterial3D.new()
		transparent_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		transparent_material.albedo_color = Color(1, 1, 1, 0.5)  

func highlight():
	if not is_highlighted and mesh_node:
		is_highlighted = true
		mesh_node.set_surface_override_material(0, transparent_material)

func unhighlight():
	if is_highlighted and mesh_node:
		is_highlighted = false
		mesh_node.set_surface_override_material(0, original_material)

func pick_up():
	print("Предмет подобран: ", name)
	queue_free()
