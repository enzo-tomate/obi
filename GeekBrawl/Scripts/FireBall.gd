extends KinematicBody2D

var speed = 10.2

func _ready():
	look_at(get_global_mouse_position())
	
func _process(delta):
	var collisionInfo = move_and_collide(Vector2(1, 0). rotated(rotation) *speed)

	if collisionInfo:
		if "Enemy" in collisionInfo.collider.name:
			collisionInfo.collider.set ("life", collisionInfo.collider.life -10)
			get_parent().remove_child(self)
			
