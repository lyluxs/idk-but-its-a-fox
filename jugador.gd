extends CharacterBody2D
#la vida a veces da a veces quitaa
@export var walk_speed := 150.0
@export var run_speed := 250.0

@onready var sprite = $AnimatedSprite2D

var last_direction := "down"

func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	var speed = walk_speed
	if Input.is_action_pressed("run"):
		speed = run_speed

	velocity = direction * speed
	move_and_slide()

	if direction == Vector2.ZERO:
		sprite.play("idle " + last_direction)
		return
#la vida a veces da a veces quitaaa
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			last_direction = "right"
			if Input.is_action_pressed("run"):
				sprite.play("run right")
			else:
				sprite.play("walk right")
		else:
			last_direction = "left"
			if Input.is_action_pressed("run"):
				sprite.play("run left")
			else:
				sprite.play("walk left")
	else:
		if direction.y > 0:
			last_direction = "down"
			if Input.is_action_pressed("run"):
				sprite.play("run down")
			else:
				sprite.play("walk down")
		else:
			last_direction = "up"
			if Input.is_action_pressed("run"):
				sprite.play("run up")
			else:
				sprite.play("walk up")
