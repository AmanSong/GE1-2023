extends Node3D

@export var dod:PackedScene

@export var num_dod = 10.0
@export var r = 10.0
@export var num_loops = 10

func _ready():
	
	var theta_inc = (PI * 2.0) / num_dod
	
	for j in num_loops:
		
		num_dod = 2.0 * PI * j
		r = j
		
		for i in num_dod:
			var james = dod.instantiate()
			var theta = theta_inc * i
			var pos = Vector3(sin(theta) * r, 0, cos(theta) * r)
			
			james.transform.origin = pos
			
			var newMaterial = StandardMaterial3D.new()
			
			var h = i / num_dod
			print(h)
			newMaterial.albedo_color = Color.from_hsv(h, 1, 1, 0.8)
			james.get_node("MeshInstance3D").material_override = newMaterial
			
			add_child(james)
		
func _process(delta):
	DebugDraw.draw_sphere(transform.origin, r, Color.BLUE)
