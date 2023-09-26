extends CharacterBody2D
var SPEED = 300
var direction = Vector2(1,0)
func _physics_process(delta):
	
	velocity = direction * SPEED
	var collision = move_and_collide(velocity * delta)
	if collision: 
		#print(collision.get_collider().scale)
		if (collision.get_collider().name == 'Player1' or collision.get_collider().name == 'Player2'):
			var diff = position.y - collision.get_collider().position.y
			direction.y = 1/diff
			direction.x = - direction.x
			SPEED += 20
		else:
			direction.y = - direction.y
