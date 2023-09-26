extends CharacterBody2D
var SPEED = 400
var direction = Vector2(1,0)
var max_angle = deg_to_rad(PI/3)
var initial_pos = position

func _ready():
	var present = get_node('Visible')
	present.screen_exited.connect(_respawn)
	
	
func _physics_process(delta):
	
	velocity = direction * SPEED
	var collision = move_and_collide(velocity * delta)
	if collision: 
		if (collision.get_collider().name == 'Player1' or collision.get_collider().name == 'Player2'):
			var diff = position.y - collision.get_collider().position.y
			var possible_range = collision.get_collider().scale.y / 2
			var sign = 1.0
			if diff < 0:
				sign = -1.0
			var angle = abs(diff / possible_range) * max_angle * sign
			var rebound = sin(angle)
			direction.y = rebound
			direction.x = - direction.x
			SPEED += 20
		else:
			direction.y = - direction.y
#	if position.x < :
#		await get_tree().create_timer(2.0).timeout

func _respawn():
	position = initial_pos
	SPEED = 0
	await get_tree().create_timer(1.0).timeout
	SPEED = 300
	var sign_x = sign(- direction.x)  # Get the sign of the x component
	direction.y = 0  # Set the y component to 0
	direction.x = sign_x  # Set the x component to its sign
	var scoreP1 = get_node("../Score P1")
	var scoreP2 = get_node("../Score P2")
	var player = scoreP1
	if sign_x < 0:
		player = scoreP1
	if sign_x > 0:
		player = scoreP2
	var actual_score = int(player.text)
	actual_score += 1
	player.text = str(actual_score)
	
