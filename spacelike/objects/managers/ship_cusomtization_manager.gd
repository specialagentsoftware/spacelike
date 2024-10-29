class_name ShipCustomizationManager
extends Node

var selected_ship

func set_ship(ship:PackedScene):
	selected_ship = ship.instantiate()

func get_ship_name() -> String:
	return selected_ship.name

func get_ship_specs() -> Dictionary:
	return {
		"acceleration":selected_ship.acceleration,
		"turning_speed":selected_ship.turning_speed,
		"drag":selected_ship.drag,
		#"primary_weapon":selected_ship.primary_weapon,
		#"secondary_weapon":selected_ship.secondary_weapon.name,
		#"defensive_system":selected_ship.defence_system.name,
		#"special_ability":selected_ship.special_ability.name
	}

func set_primary_weapon(weapon_scene: PackedScene):
	selected_ship.primary_weapon = weapon_scene
	#selected_ship.add_child(selected_ship.primary_weapon)

func set_secondary_weapon(weapon_scene: PackedScene):
	selected_ship.secondary_weapon = weapon_scene
	#selected_ship.add_child(selected_ship.secondary_weapon)

func set_defense_system(defense_scene: PackedScene):
	selected_ship.defense_system = defense_scene
	#selected_ship.add_child(selected_ship.defense_system)

func set_special_ability(ability_scene: PackedScene):
	selected_ship.special_ability = ability_scene
	#selected_ship.add_child(selected_ship.special_ability)

# Call this function when the player selects a new ship
#func apply_customization():
	## Example: Customize a small ship with specific components
	#selected_ship = preload("res://scripts/ships/small_scout.tscn").instantiate()
#
	## Apply different weapons, defenses, abilities
	#set_primary_weapon(preload("res://scripts/weapons/laser_cannon.tscn"))
	#set_secondary_weapon(preload("res://scripts/weapons/rail_gun.tscn"))
	#set_defense_system(preload("res://scripts/defensive_systems/shield.tscn"))
	#set_special_ability(preload("res://scripts/special_abilities/teleport.tscn"))
#
	## Add the ship to the scene
	#add_child(selected_ship)
