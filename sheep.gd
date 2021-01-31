extends KinematicBody

var g=9.81
var gravity=Vector3()

const speed=5
const acceleration=10

var direction=Vector3()
var velocity=Vector3()

func _ready():
	pass 

func _process(delta):
	if not is_on_floor():
		gravity.y-=g*delta
	move_and_slide(gravity, Vector3.UP)
	
	direction+=transform.basis.z
	direction=direction.normalized()
	velocity=direction*speed
	velocity.linear_interpolate(velocity, acceleration*delta)
	move_and_slide(velocity, Vector3.UP)
