class_name Weapon
extends Node2D

var cooldown: float = 0.5
var last_fire_time: float = 0

func fire():
	pass
#	if OS.get_ticks_msec() - last_fire_time > cooldown * 1000:
#		# Logic to fire the weapon
#		print("Weapon Fired!")
#		last_fire_time = OS.get_ticks_msec()
