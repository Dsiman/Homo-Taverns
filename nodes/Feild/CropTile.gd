extends RigidBody
class_name CropTile

export(String) var CropName
export(String) var CurrentStage
export(bool) var Hoed = false
export(int) var Water = 0


var interactable = true
var Deathchecks = 1
var Tile = "Dirt"
var Crops = {
"Grass": {"GrowthStages" : {"Sprout" : 100, "Seedling" : 100, "Vegetative" : 100, "Budding" : 100, "Flowering" : 100, "Ripening" : 100, "Dead" : 0}, "Product" : {"Hay" : 2, "Weed" : 1}, "Consumption" : 1, "SeasonS" : 0, "SeasonE" : 365 },
"Cabbage": {"GrowthStages" : {"Sprout" : 100, "Seedling" : 100, "Vegetative" : 100, "Budding" : 100, "Flowering" : 100, "Ripening" : 100, "Dead" : 0}, "Product" : {"Cabbage" : 2}, "Consumption" : 1, "SeasonS" : 0, "SeasonE" : 365 },
"Turnip": {"GrowthStages" : {"Sprout" : 100, "Seedling" : 100, "Vegetative" : 100, "Budding" : 100, "Flowering" : 100, "Ripening" : 100, "Dead" : 0}, "Product" : {"Turnip" : 2}, "Consumption" : 1, "SeasonS" : 0, "SeasonE" : 365 },
"Potato": {"GrowthStages" : {"Sprout" : 100, "Seedling" : 100, "Vegetative" : 100, "Budding" : 100, "Flowering" : 100, "Ripening" : 100, "Dead" : 0}, "Product" : {"Potato" : 2}, "Consumption" : 1, "SeasonS" : 0, "SeasonE" : 365 }
}

func _ready():
	pass

func interact(relate, equiped):
	print(equiped)
#Planting Seed
func Plant(Seed):
	if Hoed :
		if Water > 0:
			#Remove Seed From Invintory
			#Define the information about the plant
			#Start Growing Plant
			CropName = Seed.key
		else:
			#Error Message / Tooltip
			print("Needs Water")
	else:
		#Error Message / Tooltip
		print("Need to be hoed")
		
#Check if the crop has enough water and check the time of year then grow	
func Grow(): 
	if Tile == "dirt":
		print("nothing")
		
		

#Dry the crop	
func Drying(Amount):
	if Water > 0:
		Water = Water-Amount
		#Display animation or somthing
	else:
		#Check if plant is going to die
		DeathCheck()

#Roll to kill the plant
func DeathCheck():
	var roll = randi()%11+Deathchecks
	if roll > 10:
		print("Plant Had Died")
		CurrentStage = "Dead"
	else:
		print("Plant Has Survived")
		Deathchecks = Deathchecks+1
		
#Called to reset the crop to dirt
func ResetCrop():
	CropName = "Dirt"
	CurrentStage = "Dirty"
	Hoed = false
	Water = 0
