extends KinematicBody

var g=9.81
var gravity=Vector3()
var target
const speed=5
const acceleration=10
var direction=Vector3()
var velocity=Vector3()

func _process(delta):
	if not is_on_floor():
		gravity.y-=g*delta
	move_and_slide(gravity, Vector3.UP)
	
	if target:
		look_at(target.global_transform.origin, Vector3.UP)


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		print("Enter")


func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		target = body
		print("Exit")
