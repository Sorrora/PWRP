Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor                = {r = 50, g = 50, b = 204}
Config.EnablePlayerManagement     = false
Config.EnableArmoryManagement     = false
Config.EnableGCIdentity           = false
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.MaxInService               = 8
Config.Locale       		      = 'en'

Config.PoliceStations = {
	
	LSPD = {

		Blip = {
			Pos   = {x = 425.130, y = -979.558, z = 30.711},
			Color = 29
		},

		AuthorizedWeapons = {
			{name = 'WEAPON_NIGHTSTICK',       price = 200},
			{name = 'WEAPON_COMBATPISTOL',     price = 300},
			{name = 'WEAPON_ASSAULTSMG',       price = 1250},
			{name = 'WEAPON_CARBINERIFLE',     price = 1500},
			{name = 'WEAPON_PUMPSHOTGUN',      price = 600},
			{name = 'WEAPON_STUNGUN',          price = 500},
			{name = 'WEAPON_FLASHLIGHT',       price = 80},
			{name = 'WEAPON_FIREEXTINGUISHER', price = 120},
			{name = 'WEAPON_FLAREGUN',         price = 60},
			{name = 'GADGET_PARACHUTE',        price = 300},
		},

		AuthorizedVehicles = {
			{name = 'police2' , label = 'City Police Charger'},
			{name = 'police4', label = 'City Police Interceptor'},
			{name = 'sheriff', label = 'Sheriff Charger'},
			{name = 'sheriff2', label = 'Sheriff SUV'},
			{name = 'sheriff3', label = 'Sheriff Crown Victoria'},
			{name = 'police', label = 'Unmarked Crown Victoria'},
			{name = 'policeb', label = 'Motorcycle'},
			{name = 'police3', label = 'Mustang GT'},
			{name = 'fbi2',		label = 'Unmarked SUV'},
		},

		Cloakrooms = {
			{x = 452.600, y = -993.306, z = 29.750}
		},

		Armories = {
			{x = 451.699, y = -980.356, z = 29.689}
		},

		Vehicles = {
			{
				Spawner    = {x = 454.69, y = -1017.4, z = 27.430},
				SpawnPoint = {x = 438.42, y = -1018.3, z = 27.757},
				Heading    = 90.0
			}
		},

		Helicopters = {
			{
				Spawner    = {x = 466.477, y = -982.819, z = 42.691},
				SpawnPoint = {x = 450.04, y = -981.14, z = 42.691},
				Heading    = 0.0
			}
		},

		VehicleDeleters = {
			{x = 462.74, y = -1014.4, z = 27.065},
			{x = 462.40, y = -1019.7, z = 27.104}
		},

		BossActions = {
			{x = 448.417, y = -973.208, z = 29.689}
		}

	},
	
	SandyShores = {

		Blip = {
			Pos   = {x = 1857.6206054688, y = 3679.0146484375, z = 33.026447296143},
			Color = 29
		},

		AuthorizedWeapons = {
			{name = 'WEAPON_NIGHTSTICK',       price = 200},
			{name = 'WEAPON_COMBATPISTOL',     price = 300},
			{name = 'WEAPON_ASSAULTSMG',       price = 1250},
			{name = 'WEAPON_CARBINERIFLE',     price = 1500},
			{name = 'WEAPON_PUMPSHOTGUN',      price = 600},
			{name = 'WEAPON_STUNGUN',          price = 500},
			{name = 'WEAPON_FLASHLIGHT',       price = 80},
			{name = 'WEAPON_FIREEXTINGUISHER', price = 120},
			{name = 'WEAPON_FLAREGUN',         price = 60},
			{name = 'GADGET_PARACHUTE',        price = 300},
		},

		AuthorizedVehicles = {
			{name = 'police2' , label = 'City Police Charger'},
			{name = 'police4', label = 'City Police Interceptor'},
			{name = 'sheriff', label = 'Sheriff Charger'},
			{name = 'sheriff2', label = 'Sheriff SUV'},
			{name = 'sheriff3', label = 'Sheriff Crown Victoria'},
			{name = 'police', label = 'Unmarked Crown Victoria'},
			{name = 'policeb', label = 'Motorcycle'},
			{name = 'police3', label = 'Mustang GT'},
			{name = 'fbi2',		label = 'Unmarked SUV'},
		},

		Cloakrooms = {
			{x = 1857.3419189453, y = 3689.0759277344, z = 33.267078399658}
		},

		Armories = {
			{x = 1848.7974853516, y = 3689.8078613281, z = 33.267078399658}
		},

		Vehicles = {
			{
				Spawner    = {x = 1862.3001708984, y = 3682.5014648438, z = 32.768924713135},
				SpawnPoint = {x = 1868.5006103516, y = 3681.73046875, z = 33.626258850098},
				Heading    = 90.0
			}
		},
		Helicopters = {},

		VehicleDeleters = {
			{x = 1870.6472167969, y = 3691.5666503906, z = 31.913780212402}
		},

		BossActions = {}
	},
	
	PaletoBay = {

		Blip = {
			Pos   = {x = -439.64807128906, y = 6019.7138671875, z = 30.773178100586},
			Color = 29
		},

		AuthorizedWeapons = {
			{name = 'WEAPON_NIGHTSTICK',       price = 200},
			{name = 'WEAPON_COMBATPISTOL',     price = 300},
			{name = 'WEAPON_ASSAULTSMG',       price = 1250},
			{name = 'WEAPON_CARBINERIFLE',     price = 1500},
			{name = 'WEAPON_PUMPSHOTGUN',      price = 600},
			{name = 'WEAPON_STUNGUN',          price = 500},
			{name = 'WEAPON_FLASHLIGHT',       price = 80},
			{name = 'WEAPON_FIREEXTINGUISHER', price = 120},
			{name = 'WEAPON_FLAREGUN',         price = 60},
			{name = 'GADGET_PARACHUTE',        price = 300},
		},

		AuthorizedVehicles = {
			{name = 'police2' , label = 'City Police Charger'},
			{name = 'police4', label = 'City Police Interceptor'},
			{name = 'sheriff', label = 'Sheriff Charger'},
			{name = 'sheriff2', label = 'Sheriff SUV'},
			{name = 'sheriff3', label = 'Sheriff Crown Victoria'},
			{name = 'police', label = 'Unmarked Crown Victoria'},
			{name = 'policeb', label = 'Motorcycle'},
			{name = 'police3', label = 'Mustang GT'},
			{name = 'fbi2',		label = 'Unmarked SUV'},
		},

		Cloakrooms = {
			{x = -449.71078491211, y = 6016.5395507813, z = 30.71639251709}
		},

		Armories = {
			{x = -448.12261962891, y = 6008.5986328125, z = 30.71639251709}
		},

		Vehicles = {
			{
				Spawner    = {x = -460.00796508789, y = 6015.8295898438, z = 30.490106582642},
				SpawnPoint = {x = -479.51629638672, y = 6027.7080078125, z = 31.340547561646},
				Heading    = 90.0
			}
		},
		
		Helicopters = {},

		VehicleDeleters = {
			{x = -455.23275756836, y = 6041.041015625, z = 30.052349090576}
		},

		BossActions = {}
	}
}
