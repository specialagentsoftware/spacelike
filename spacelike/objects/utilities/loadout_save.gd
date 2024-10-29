#func save_loadout():
	#var save_data = {
		#"ship_type": selected_ship.get_class(),
		#"primary_weapon": selected_ship.primary_weapon.get_class(),
		#"secondary_weapon": selected_ship.secondary_weapon.get_class(),
		#"defense_system": selected_ship.defense_system.get_class(),
		#"special_ability": selected_ship.special_ability.get_class()
	#}
	#var save_file = FileAccess.open("user://loadout.save", FileAccess.WRITE)
	#save_file.store_string(to_json(save_data))
	#save_file.close()
#
#func load_loadout():
	#var save_file = FileAccess.open("user://loadout.save", FileAccess.READ)
	#var save_data = parse_json(save_file.get_as_text())
	#save_file.close()
#
	## Apply saved data to the player's ship
	#var ship_scene = preload("res://ships/%s.tscn" % save_data["ship_type"]).instance()
	#set_primary_weapon(preload("res://weapons/%s.tscn" % save_data["primary_weapon"]))
	#set_secondary_weapon(preload("res://weapons/%s.tscn" % save_data["secondary_weapon"]))
	#set_defense_system(preload("res://defenses/%s.tscn" % save_data["defense_system"]))
	#set_special_ability(preload("res://abilities/%s.tscn" % save_data["special_ability"]))
	#add_child(ship_scene)
