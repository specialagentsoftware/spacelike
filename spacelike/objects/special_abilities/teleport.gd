extends SpecialAbility
# Distance to teleport
var teleport_distance: float = 300.0

func activate():
	pass
	#if can_activate():
		# Calculate new position
	#    var direction = owner.global_transform.x.normalized()  # The ship's facing direction
	#    owner.position += direction * teleport_distance

		# Call the base class to handle cooldown and energy cost
	#    .activate()
