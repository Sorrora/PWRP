Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = {r = 102, g = 0, b = 102}
Config.RespawnDelayAfterRPDeath   = 10 * 60 * 1000
Config.MenuRespawnToHospitalDelay = 5 * 60 * 1000
Config.EnableSocietyOwnedVehicles = false
Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true
Config.EnablePlayerManagement     = false
Config.ShowDeathTimer			  = true
Config.EarlyRespawn				  = false
Config.EarlyRespawnFine			  = false
Config.EarlyRespawnFineAmount	  = 500
Config.Locale                     = 'en'

Config.Zones = {


	HospitalInteriorEntering1 = {
		Pos  = {x = 1151.447, y = -1529.491, z = 34.375},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = 1
	},

	HospitalInteriorInside1 = {
		Pos  = {x = 251.464, y = -1369.770, z = 28.648},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	HospitalInteriorOutside1 = {
		Pos  = {x = 1153.364, y = -1525.731, z = 33.843},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	HospitalInteriorExit1 = {
		Pos  = {x = 253.612, y = -1371.66, z = 28.647},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = 1
	},

	HospitalInteriorEntering2 = {
		Pos  = {x = 1137.181, y = -1597.504, z = 33.692},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = 1
	},

	HospitalInteriorInside2 = {
		Pos  = {x = 240.508,  y = -1360.565, z = 28.647},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	HospitalInteriorOutside2 = {
		Pos  = {x = 1137.922, y = -1601.434, z = 33.692},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = -1
	},

	HospitalInteriorExit2 = {
		Pos  = {x = 238.587,  y = -1359.113, z = 28.647},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type = 1
	},

	AmbulanceActions = {
		Pos   = {x = 244.048, y = -1366.330, z = 28.647},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	VehicleSpawner = {
		Pos   = {x = 1128.290, y = -1601.451, z = 33.893},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = {x = 1138.061, y = -1607.882, z = 34.692},
		Size = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = 1122.436, y = -1617.600, z = 33.692},
		Size  = {x = 3.0, y = 3.0, z = 2.0},
		Type  = 1
	}

}
