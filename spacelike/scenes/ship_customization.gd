extends Node2D

@export var primary_weapon_types = []

@export var secondary_weapon_types = []

@export var defensive_systems_types = []

@export var special_module_types = []

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
@onready var type_name: Label = $TypeName

var primary_weapon_current_option_index = 0
var secondary_weapon_current_option_index = 0
var defensive_system_current_option_index = 0
var special_module_current_option_index = 0

func _ready() -> void:
	update_display()
	
func update_display():
	type_name.text = SCM.get_ship_name()
	var primary_weapon_instance = primary_weapon_types[primary_weapon_current_option_index].instantiate()
	primary_weapon_options.text =primary_weapon_instance.name
	left_weapon_type_button.disabled = primary_weapon_current_option_index == 0
	right_weapon_type_button.disabled = primary_weapon_current_option_index == primary_weapon_types.size() - 1
	
	var secondary_weapon_instance = secondary_weapon_types[secondary_weapon_current_option_index].instantiate()	
	secondary_weapon_options.text = secondary_weapon_instance.name
	left_secondary_weapon_type_button.disabled = secondary_weapon_current_option_index == 0
	right_secondary_weapon_type_button.disabled = secondary_weapon_current_option_index == secondary_weapon_types.size() - 1

	var defensive_systems_instance = defensive_systems_types[defensive_system_current_option_index].instantiate()	
	defensive_systems_options.text = defensive_systems_instance.name
	left_defensive_type_button.disabled = defensive_system_current_option_index == 0
	right_defensive_type_button.disabled = defensive_system_current_option_index == defensive_systems_types.size() - 1

	var special_module_instance = special_module_types[special_module_current_option_index].instantiate()	
	special_module_options.text = special_module_instance.name
	left_special_type_button.disabled = special_module_current_option_index == 0
	right_special_type_button.disabled = special_module_current_option_index == special_module_types.size() - 1

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
	SCM.set_primary_weapon(primary_weapon_types[primary_weapon_current_option_index])
	SCM.set_secondary_weapon(secondary_weapon_types[secondary_weapon_current_option_index])
	SCM.set_special_ability(special_module_types[special_module_current_option_index])
	SCM.set_defense_system(defensive_systems_types[defensive_system_current_option_index])
	SM.gp_to_world()


func _on_back_button_pressed() -> void:
	SM.go_to_select()
