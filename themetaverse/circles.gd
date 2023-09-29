extends Node3D

@export var circleScene:PackedScene

@export var numCircles = 6
@export var radius = 1
@export var rings = 10
@export var colour = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(rings):
		# Calculate the angle step between objects
		var angleStep = 360.0 / numCircles

		for i in range(numCircles):
			# Calculate the position using sine and cosine
			var angle = deg_to_rad(angleStep * i)
			var x = radius * cos(angle)
			var z = radius * sin(angle)

			# Create and add the object to the container
			var circle = circleScene.instantiate()
			circle.transform.origin.x = x
			circle.transform.origin.z = z
			
			# create a colour
			var newMaterial = StandardMaterial3D.new()
			newMaterial.albedo_color = Color.from_hsv(colour+0.1, 1, 1, 0.8)
			circle.get_node("MeshInstance3D").material_override = newMaterial
			
			add_child(circle)
		colour += 0.1
		
		# grow the radius and num of circles
		numCircles += 6
		radius += 1
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
