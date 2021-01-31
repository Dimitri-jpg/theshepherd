extends KinematicBody
onready var pivot=$Pivot
onready var pointerpivot=$PointerPivot

const g=9.81
const jump_height=8
var gravity=Vector3()

const speed=25
const acceleration=10
const mouse_sensitivity=0.2

var direction=Vector3()
var velocity=Vector3()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if Input.is_action_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x*mouse_sensitivity))
		pivot.rotate_x(deg2rad(-event.relative.y*mouse_sensitivity))
		pivot.rotation.x=clamp(pivot.rotation.x, deg2rad(-75), deg2rad(75))
		pointerpivot.rotate_x(deg2rad(-event.relative.y*mouse_sensitivity))
		pivot.rotation.x=clamp(pointerpivot.rotation.x, deg2rad(-75), deg2rad(75))

func _process(delta):
	direction=Vector3()
	if Input.is_action_pressed("ui_up"):
		direction-=transform.basis.z
	elif Input.is_action_pressed("ui_down"):
		direction+=transform.basis.z
	elif Input.is_action_pressed("ui_left"):
		direction-=transform.basis.x
	elif Input.is_action_pressed("ui_right"):
		direction+=transform.basis.x
	
	if not is_on_floor():
		gravity.y-=g*delta
	move_and_slide(gravity, Vector3.UP)
	
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		gravity.y=jump_height
	
	direction=direction.normalized()
	velocity=direction*speed
	velocity.linear_interpolate(velocity, acceleration*delta)
	move_and_slide(velocity, Vector3.UP)
