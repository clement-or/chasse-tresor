extends KinematicBody2D

export var speed = 50

var vel = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	# Get user input and move
	vel.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	vel.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	vel = vel.normalized() * speed
	
	update_anim()
	move_and_slide(vel, Vector2.UP)
	update()

func update_anim():
	
	# Y velocity has priority
	if vel.y > 0:
		$Anim.play("walk_down")
	elif vel.y < 0:
		$Anim.play("walk_up")
	
	elif vel.x > 0:
		$Anim.play("walk_right")
	elif vel.x < 0:
		$Anim.play("walk_left")
		
	if vel == Vector2.ZERO:
		$Anim.stop()
		$Sprite.frame_coords.x = 1

