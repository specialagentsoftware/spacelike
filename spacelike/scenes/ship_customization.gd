extends Node2D

@onready var primary_weapon_types = [
	"Laser Turret", 
	"Plasma Cannon",
	"Rail Gun"]

@onready var secondary_weapon_types = [
	"EMP Blast",
	"Mine Deployment",
	"Reflective Shield"
]

@onready var defensive_systems_types = [
	"Energy Shields",
	"Cloaking Device",
	"Chaff",
	"Armor Plating",
]

@onready var special_module_types = [
	"Teleportation",
	"Overdrive",
	"Tractor Beam",
	
]

@onready var primary_weapon_options: Label = $PrimaryWeaponOptions
@onready var left_weapon_type_button: TextureButton = $LeftWeaponTypeButton
@onready var right_weapon_type_button: TextureButton = $RightWeaponTypeButton
@onready var secondary_weapon_options: Label = $SecondaryWeaponOptions
@onready var left_secondary_weapon_type_button: TextureButton = $LeftSecondaryWeaponTypeButton
@onready var right_secondary_weapon_type_button: TextureButton = $RightSecondaryWeaponTypeButton
@onready var defensive_systems_options: Label = $DefensiveSystemsOptions
@onready var left_defensive_type_button: TextureButton = $LeftDefensiveTypeButton
@onready var right_defensive_type_button: TextureButton = $RightDefensiveTypeButton
@onready var special_module_options: Label = $SpecialModuleOptions
@onready var left_special_type_button: TextureButton = $LeftSpecialTypeButton
@onready var right_special_type_button: TextureButton = $RightSpecialTypeButton


var primary_weapon_current_option_index = 0
var secondary_weapon_current_option_index = 0
var defensive_system_current_option_index = 0
var special_module_current_option_index = 0

func _ready() -> void:
	update_display()
	
func update_display():
	primary_weapon_options.text = primary_weapon_types[primary_weapon_current_option_index]
	left_weapon_type_button.disabled = primary_weapon_current_option_index == 0
	right_weapon_type_button.disabled = primary_weapon_current_option_index == primary_weapon_types.size() - 1
	
	secondary_weapon_options.text = secondary_weapon_types[secondary_weapon_current_option_index]
	left_secondary_weapon_type_button.disabled = secondary_weapon_current_option_index == 0
	right_secondary_weapon_type_button.disabled = secondary_weapon_current_option_index == secondary_weapon_types.size() - 1

	defensive_systems_options.text = defensive_systems_types[defensive_system_current_option_index]
	left_defensive_type_button.disabled = defensive_system_current_option_index == 0
	right_defensive_type_button.disabled = defensive_system_current_option_index == defensive_systems_types.size() - 1

	special_module_options.text = special_module_types[special_module_current_option_index]
	left_special_type_button.disabled = special_module_current_option_index == 0
	left_special_type_button.disabled = special_module_current_option_index == special_module_types.size() - 1

func _on_left_weapon_type_button_pressed() -> void:
	if primary_weapon_current_option_index > 0:
		primary_weapon_current_option_index -= 1
		update_display()


func _on_right_weapon_type_button_pressed() -> void:
	if primary_weapon_current_option_index < primary_weapon_types.size() - 1:
		primary_weapon_current_option_index += 1
		update_display()


func _on_left_secondary_weapon_type_button_pressed() -> void:
	if secondary_weapon_current_option_index > 0:
		secondary_weapon_current_option_index -= 1
		update_display()


func _on_right_secondary_weapon_type_button_pressed() -> void:
	if secondary_weapon_current_option_index < secondary_weapon_types.size() - 1:
		secondary_weapon_current_option_index += 1
		update_display()


func _on_left_defensive_type_button_pressed() -> void:
	if defensive_system_current_option_index > 0:
		defensive_system_current_option_index -= 1
		update_display()


func _on_right_defensive_type_button_pressed() -> void:
	if defensive_system_current_option_index < defensive_systems_types.size() - 1:
		defensive_system_current_option_index += 1
		update_display()


func _on_left_special_type_button_pressed() -> void:
	if special_module_current_option_index > 0:
		special_module_current_option_index -= 1
		update_display()


func _on_right_special_type_button_pressed() -> void:
	if special_module_current_option_index < special_module_types.size() - 1:
		special_module_current_option_index += 1
		update_display()

func _on_confirm_button_pressed() -> void:
	pass # Replace with function body.
