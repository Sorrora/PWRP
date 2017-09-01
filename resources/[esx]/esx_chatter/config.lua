--[[
Config based RP chat engine to allow easy modifications.

Data structure and available fields:
	key = the command to detect in chat
	prefix = string that exists before then : in chat (affected by color)
	color = table with keys red, green, and blue and their corrosponding integers
	job_whitelist = table of jobs the messages should be limited to (will also go to sender)
	message = string available if you want to manipulate the actual message (after : in chat)
	proximity = boolean if you want only players near the sender to see the message
	
String replacement variables available:
	$name will be replaced with the sender's name
	$id will be replaced with the sender's id
	$message will be replaced with the original message (minus the command)
	
Mutually exclusive fields:
	proximity and job_whitelist cannot be used together for now

--]]

Config 			  = {}
Config.intercepts = {}
Config.intercepts["/tweet"] = {
	prefix = "Twitter | $name",
	color = {
		red = 36,
		green = 214,
		blue = 249
	}
}

Config.intercepts["/ooc"] = {
	prefix = "OOC | $name",
	color = {
		red = 128,
		green = 128,
		blue = 128
	}
}

Config.intercepts["/911"] = {
	prefix = "911 -( $name | $id )- ",
	color = {
		red = 200,
		green = 0,
		blue = 0
	},
	job_whitelist = {
		"police",
		"ambulance"
	}
}

Config.intercepts["/me"] = {
	prefix = "Action",
	message = "$name $message",
	proximity = true
}

Config.intercepts["/ad"] = {
	prefix = "Ad $",
	color = {
		red = 0,
		green = 175,
		blue = 0
	}
}
