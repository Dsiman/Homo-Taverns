extends Node

const ICON_PATH = "res://assets/Icons/"

const ITEMS = {
	#Tools
	"Hoe": {
		"Icon": ICON_PATH + "Hoe.png",
		"Type": "Tool"
	},
	#Seeds
	"Cabbage Seed": {
		"Icon": ICON_PATH + "Cabbage.png",
		"Type": "Seed"
	},
	"Potato Seed": {
		"Icon": ICON_PATH + "Potato.png",
		"Type": "Seed"
	},
	"Turnip Seed": {
		"Icon": ICON_PATH + "Turnip.png",
		"Type": "Seed"
	},
	#error out
	"Error": {
		"Icon": ICON_PATH + "Turnip.png",
		"Type": "Error"
	}
	
}

func get_item(item_id):
	if item_id in ITEMS:
		return ITEMS[item_id]
	else:
		return ITEMS["Error"]
