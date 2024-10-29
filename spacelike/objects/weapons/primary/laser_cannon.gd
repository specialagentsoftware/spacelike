extends Weapon

func _ready():
	cooldown = 0.2  # Faster firing rate

func fire():
	pass
	#if OS.get_ticks_msec() - last_fire_time > cooldown * 1000:
		# Fire laser logic
	 #   print("Laser Fired!")
	  #  last_fire_time = OS.get_ticks_msec()
