extends Weapon

func _ready():
	cooldown = 1.5  # Slower firing rate but more damage

func fire():
	pass
	#if OS.get_ticks_msec() - last_fire_time > cooldown * 1000:
		# Fire railgun logic
	 #   print("Railgun Fired!")
	  #  last_fire_time = OS.get_ticks_msec()
