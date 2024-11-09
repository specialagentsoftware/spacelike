class_name SpecialAbility
extends Node

# Common properties for abilities
var cooldown: float = 5.0    # Time between uses
var energy_cost: int = 20    # Energy required to use
var last_used_time: float = 0

# Method to be overridden by specific abilities
func activate():
	pass
	

# Helper function to check if the ability is ready
func can_activate() -> bool:
	return true
	#return OS.get_ticks_msec() - last_used_time > cooldown * 1000 and owner.energy >= energy_cost
