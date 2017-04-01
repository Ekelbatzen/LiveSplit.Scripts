/** 
 * Factorio.asl - An ASL script for the auto-splitter of LiveSplit for the game Factorio (x64, steam version, English localization)
 * @author  Ekelbatzen
 * @version 2 on April 1st 2017 (not a joke)
 */
state("Factorio", "0.14.21_x64_en") {
	//Displays current research text or "Press T to start a new research."
	string35 researchText : 0x10AC668, 0x50, 0xA8, 0x78,  0x348, 0x0;
	string8  victoryText  : 0x10AC668, 0x48, 0x10, 0x610, 0x558, 0x0;
	uint     ticks        : 0x10AC5BC;
}

state("Factorio", "0.14.22_x64_en") {
	//Displays current research text or "Press T to start a new research."
	string35 researchText : 0x1126720, 0x50, 0xA8, 0x78,  0x348, 0x0;
	string8  victoryText  : 0x1126720, 0x48, 0x10, 0x610, 0x558, 0x0;
	uint     ticks        : 0x1126710;
}

init{
	switch(modules.First().FileVersionInfo.FileVersion){
		case "0.14.22.25342":
			version = "0.14.22_x64_en";
			break;
	}
}

startup {
	/*  SP: "Press T to start a new research", no other research starts with "pre" though
	    MP: "x FINISHED, press T.", no other research has "fin" in it */
	vars.emptyTitleSPBeginning = "Pre";
	vars.emptyTitleMPMiddle = "FIN";
	vars.enVictoryText = "Victory!";

	// Listing of every single available research on 0.14.21 in English
	vars.resLookup = new Dictionary<string, string>();
	vars.resLookup.Add("0",   "Advanced electronics");
	vars.resLookup.Add("1",   "Advanced material processing");
	vars.resLookup.Add("2",   "Advanced oil processing");
	vars.resLookup.Add("3",   "Alien technology");
	vars.resLookup.Add("4",   "Armor crafting");
	vars.resLookup.Add("5",   "Armor crafting 2");
	vars.resLookup.Add("6",   "Auto character logistic trash slots");
	vars.resLookup.Add("7",   "Automated construction");
	vars.resLookup.Add("8",   "Automated rail transportation");
	vars.resLookup.Add("9",   "Automation");
	vars.resLookup.Add("10",  "Automation 2");
	vars.resLookup.Add("11",  "Automation 3");
	vars.resLookup.Add("12",  "Automobilism");
	vars.resLookup.Add("13",  "Battery");
	vars.resLookup.Add("14",  "Battery MK2 equipment");
	vars.resLookup.Add("15",  "Battery equipment");
	vars.resLookup.Add("16",  "Bullet damage 1");
	vars.resLookup.Add("17",  "Bullet damage 2");
	vars.resLookup.Add("18",  "Bullet damage 3");
	vars.resLookup.Add("19",  "Bullet damage 4");
	vars.resLookup.Add("20",  "Bullet damage 5");
	vars.resLookup.Add("21",  "Bullet damage 6");
	vars.resLookup.Add("22",  "Bullet shooting speed 1");
	vars.resLookup.Add("23",  "Bullet shooting speed 2");
	vars.resLookup.Add("24",  "Bullet shooting speed 3");
	vars.resLookup.Add("25",  "Bullet shooting speed 4");
	vars.resLookup.Add("26",  "Bullet shooting speed 5");
	vars.resLookup.Add("27",  "Bullet shooting speed 6");
	vars.resLookup.Add("28",  "Character logistic slots 1");
	vars.resLookup.Add("29",  "Character logistic slots 2");
	vars.resLookup.Add("30",  "Character logistic slots 3");
	vars.resLookup.Add("31",  "Character logistic slots 4");
	vars.resLookup.Add("32",  "Character logistic slots 5");
	vars.resLookup.Add("33",  "Character logistic slots 6");
	vars.resLookup.Add("34",  "Character logistic trash slots 1");
	vars.resLookup.Add("35",  "Character logistic trash slots 2");
	vars.resLookup.Add("36",  "Circuit network");
	vars.resLookup.Add("37",  "Cluster grenade");
	vars.resLookup.Add("38",  "Combat robot damage 1");
	vars.resLookup.Add("39",  "Combat robot damage 2");
	vars.resLookup.Add("40",  "Combat robot damage 3");
	vars.resLookup.Add("41",  "Combat robot damage 4");
	vars.resLookup.Add("42",  "Combat robot damage 5");
	vars.resLookup.Add("43",  "Combat robotics");
	vars.resLookup.Add("44",  "Combat robotics 2");
	vars.resLookup.Add("45",  "Combat robotics 3");
	vars.resLookup.Add("46",  "Concrete");
	vars.resLookup.Add("47",  "Construction robotics");
	vars.resLookup.Add("48",  "Discharge defense");
	vars.resLookup.Add("49",  "Effect transmission");
	vars.resLookup.Add("50",  "Efficiency module");
	vars.resLookup.Add("51",  "Efficiency module 2");
	vars.resLookup.Add("52",  "Efficiency module 3");
	vars.resLookup.Add("53",  "Electric energy accumulators");
	vars.resLookup.Add("54",  "Electric energy distribution 1");
	vars.resLookup.Add("55",  "Electric energy distribution 2");
	vars.resLookup.Add("56",  "Electric engine");
	vars.resLookup.Add("57",  "Electronics");
	vars.resLookup.Add("58",  "Energy shield MK2 equipment");
	vars.resLookup.Add("59",  "Energy shield equipment");
	vars.resLookup.Add("60",  "Engine");
	vars.resLookup.Add("61",  "Exoskeleton equipment");
	vars.resLookup.Add("62",  "Explosive rocketry");
	vars.resLookup.Add("63",  "Explosives");
	vars.resLookup.Add("64",  "Flamethrower");
	vars.resLookup.Add("65",  "Flamethrower damage 1");
	vars.resLookup.Add("66",  "Flamethrower damage 2");
	vars.resLookup.Add("67",  "Flamethrower damage 3");
	vars.resLookup.Add("68",  "Flamethrower damage 4");
	vars.resLookup.Add("69",  "Flamethrower damage 5");
	vars.resLookup.Add("70",  "Flamethrower damage 6");
	vars.resLookup.Add("71",  "Flammables");
	vars.resLookup.Add("72",  "Flight");
	vars.resLookup.Add("73",  "Fluid handling");
	vars.resLookup.Add("74",  "Follower robot count 1");
	vars.resLookup.Add("75",  "Follower robot count 2");
	vars.resLookup.Add("76",  "Follower robot count 3");
	vars.resLookup.Add("77",  "Follower robot count 4");
	vars.resLookup.Add("78",  "Follower robot count 5");
	vars.resLookup.Add("79",  "Follower robot count 6");
	vars.resLookup.Add("80",  "Follower robot count 7");
	vars.resLookup.Add("81",  "Follower robot count 8");
	vars.resLookup.Add("82",  "Follower robot count 9");
	vars.resLookup.Add("83",  "Follower robot count 10");
	vars.resLookup.Add("84",  "Follower robot count 11");
	vars.resLookup.Add("85",  "Follower robot count 12");
	vars.resLookup.Add("86",  "Follower robot count 13");
	vars.resLookup.Add("87",  "Follower robot count 14");
	vars.resLookup.Add("88",  "Follower robot count 15");
	vars.resLookup.Add("89",  "Follower robot count 16");
	vars.resLookup.Add("90",  "Follower robot count 17");
	vars.resLookup.Add("91",  "Follower robot count 18");
	vars.resLookup.Add("92",  "Follower robot count 19");
	vars.resLookup.Add("93",  "Follower robot count 20");
	vars.resLookup.Add("94",  "Gates");
	vars.resLookup.Add("95",  "Grenade damage 1");
	vars.resLookup.Add("96",  "Grenade damage 2");
	vars.resLookup.Add("97",  "Grenade damage 3");
	vars.resLookup.Add("98",  "Grenade damage 4");
	vars.resLookup.Add("99",  "Grenade damage 5");
	vars.resLookup.Add("100", "Grenade damage 6");
	vars.resLookup.Add("101", "Gun turret damage 1");
	vars.resLookup.Add("102", "Gun turret damage 2");
	vars.resLookup.Add("103", "Gun turret damage 3");
	vars.resLookup.Add("104", "Gun turret damage 4");
	vars.resLookup.Add("105", "Gun turret damage 5");
	vars.resLookup.Add("106", "Gun turret damage 6");
	vars.resLookup.Add("107", "Inserter capacity bonus 1");
	vars.resLookup.Add("108", "Inserter capacity bonus 2");
	vars.resLookup.Add("109", "Inserter capacity bonus 3");
	vars.resLookup.Add("110", "Inserter capacity bonus 4");
	vars.resLookup.Add("111", "Inserter capacity bonus 5");
	vars.resLookup.Add("112", "Inserter capacity bonus 6");
	vars.resLookup.Add("113", "Inserter capacity bonus 7");
	vars.resLookup.Add("114", "Lab research speed 1");
	vars.resLookup.Add("115", "Lab research speed 2");
	vars.resLookup.Add("116", "Lab research speed 3");
	vars.resLookup.Add("117", "Lab research speed 4");
	vars.resLookup.Add("118", "Landfill");
	vars.resLookup.Add("119", "Landmines");
	vars.resLookup.Add("120", "Laser");
	vars.resLookup.Add("121", "Laser turret damage 1");
	vars.resLookup.Add("122", "Laser turret damage 2");
	vars.resLookup.Add("123", "Laser turret damage 3");
	vars.resLookup.Add("124", "Laser turret damage 4");
	vars.resLookup.Add("125", "Laser turret damage 5");
	vars.resLookup.Add("126", "Laser turret damage 6");
	vars.resLookup.Add("127", "Laser turret shooting speed 1");
	vars.resLookup.Add("128", "Laser turret shooting speed 2");
	vars.resLookup.Add("129", "Laser turret shooting speed 3");
	vars.resLookup.Add("130", "Laser turret shooting speed 4");
	vars.resLookup.Add("131", "Laser turret shooting speed 5");
	vars.resLookup.Add("132", "Laser turret shooting speed 6");
	vars.resLookup.Add("133", "Laser turrets");
	vars.resLookup.Add("134", "Logistic robotics");
	vars.resLookup.Add("135", "Logistic system");
	vars.resLookup.Add("136", "Logistics");
	vars.resLookup.Add("137", "Logistics 2");
	vars.resLookup.Add("138", "Logistics 3");
	vars.resLookup.Add("139", "Military");
	vars.resLookup.Add("140", "Military 2");
	vars.resLookup.Add("141", "Military 3");
	vars.resLookup.Add("142", "Military 4");
	vars.resLookup.Add("143", "Modular armor");
	vars.resLookup.Add("144", "Modules");
	vars.resLookup.Add("145", "Nightvision equipment");
	vars.resLookup.Add("146", "Oil processing");
	vars.resLookup.Add("147", "Optics");
	vars.resLookup.Add("148", "Personal laser defense");
	vars.resLookup.Add("149", "Personal roboport");
	vars.resLookup.Add("150", "Plastics");
	vars.resLookup.Add("151", "Portable fusion reactor");
	vars.resLookup.Add("152", "Portable solar panel");
	vars.resLookup.Add("153", "Power armor");
	vars.resLookup.Add("154", "Power armor MK2");
	vars.resLookup.Add("155", "Productivity module");
	vars.resLookup.Add("156", "Productivity module 2");
	vars.resLookup.Add("157", "Productivity module 3");
	vars.resLookup.Add("158", "Rail signals");
	vars.resLookup.Add("159", "Railway");
	vars.resLookup.Add("160", "Robotics");
	vars.resLookup.Add("161", "Rocket damage 1");
	vars.resLookup.Add("162", "Rocket damage 2");
	vars.resLookup.Add("163", "Rocket damage 3");
	vars.resLookup.Add("164", "Rocket damage 4");
	vars.resLookup.Add("165", "Rocket damage 5");
	vars.resLookup.Add("166", "Rocket shooting speed 1");
	vars.resLookup.Add("167", "Rocket shooting speed 2");
	vars.resLookup.Add("168", "Rocket shooting speed 3");
	vars.resLookup.Add("169", "Rocket shooting speed 4");
	vars.resLookup.Add("170", "Rocket shooting speed 5");
	vars.resLookup.Add("171", "Rocket silo");
	vars.resLookup.Add("172", "Rocketry");
	vars.resLookup.Add("173", "Shotgun shell damage 1");
	vars.resLookup.Add("174", "Shotgun shell damage 2");
	vars.resLookup.Add("175", "Shotgun shell damage 3");
	vars.resLookup.Add("176", "Shotgun shell damage 4");
	vars.resLookup.Add("177", "Shotgun shell damage 5");
	vars.resLookup.Add("178", "Shotgun shell damage 6");
	vars.resLookup.Add("179", "Shotgun shell shooting speed 1");
	vars.resLookup.Add("180", "Shotgun shell shooting speed 2");
	vars.resLookup.Add("181", "Shotgun shell shooting speed 3");
	vars.resLookup.Add("182", "Shotgun shell shooting speed 4");
	vars.resLookup.Add("183", "Shotgun shell shooting speed 5");
	vars.resLookup.Add("184", "Shotgun shell shooting speed 6");
	vars.resLookup.Add("185", "Solar energy");
	vars.resLookup.Add("186", "Speed module");
	vars.resLookup.Add("187", "Speed module 2");
	vars.resLookup.Add("188", "Speed module 3");
	vars.resLookup.Add("189", "Stack inserter");
	vars.resLookup.Add("190", "Steel processing");
	vars.resLookup.Add("191", "Stone walls");
	vars.resLookup.Add("192", "Sulfur processing");
	vars.resLookup.Add("193", "Tanks");
	vars.resLookup.Add("194", "Toolbelt");
	vars.resLookup.Add("195", "Turrets");
	vars.resLookup.Add("196", "Worker robot cargo size 1");
	vars.resLookup.Add("197", "Worker robot cargo size 2");
	vars.resLookup.Add("198", "Worker robot cargo size 3");
	vars.resLookup.Add("199", "Worker robot speed 1");
	vars.resLookup.Add("200", "Worker robot speed 2");
	vars.resLookup.Add("201", "Worker robot speed 3");
	vars.resLookup.Add("202", "Worker robot speed 4");
	vars.resLookup.Add("203", "Worker robot speed 5");

	//Settings "navigation"
	settings.Add("a", false, "##### Main settings ###########");
	settings.Add("MP", false, "Multiplayer (SP if disabled)");
	settings.Add("b", false, "##### Research to split after #####");

	//Assign settings with research
	foreach(KeyValuePair<string, string> entry in vars.resLookup) {
		settings.Add(entry.Key, false, entry.Value);
	}
}

start {
	//Start when research text displays default text when it previously displayed nothing
	if(old.researchText == null && current.researchText != null) {
		//Prepare list of splits on start
		vars.researchSplits = new List<string>();
		foreach(KeyValuePair<string, string> entry in vars.resLookup) {
			if(settings[entry.Key]) {
				vars.researchSplits.Add(entry.Value);
			}
		}

		return true;
	}
	return false;
}

split {
	bool isResearchFinished = false;
	bool splitCondition = false;
	if(settings["MP"]) {
		if(!old.researchText.Contains(vars.emptyTitleMPMiddle) &&
		current.researchText.Contains(vars.emptyTitleMPMiddle)){
			isResearchFinished = true; //Research finished in MP
		}
	} else if(!old.researchText.StartsWith(vars.emptyTitleSPBeginning) &&
		   current.researchText.StartsWith(vars.emptyTitleSPBeginning)) {
		isResearchFinished = true; //Research finished in SP
	}
	
	if(isResearchFinished && vars.researchSplits.Contains(old.researchText)) {
		splitCondition = true; //Split research finished
	} else if(current.victoryText == vars.enVictoryText) {
		splitCondition = true; //Game finished
	}

	if(splitCondition) {
		if(isResearchFinished) {
			vars.researchSplits.Remove(old.researchText);
		}
		return true;
	}

	return false;
}

reset {
	return old.researchText != null && current.researchText == null;
}

gameTime {
	print("ticks: " + current.ticks);
	return TimeSpan.FromMilliseconds(current.ticks*(1000.0/60.0)); //60 ticks per second
}