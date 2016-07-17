/** 
 * MarkOfTheNinja.asl - An ASL script for the auto-splitter of LiveSplit for the game Mark of the Ninja
 * @author  Ekelbatzen
 * @version 1 on July 17th 2016
 */
 
state("game") {
	// 0 when loading, big number when done but not ingame, 65554 ingame
    int loadingCode: 0x3AB5E4, 0x180, 0x18C, 0x160, 0x40;
	
	// 2 ingame, 1 in menus, 5 in cutscenes and decision menu, 6 in style menu
	int menucode: 0x3AB5DC, 0x88;
	
	string3 levelname: 0x3AB5DC, 0x150;
}

startup {
    vars.levelnames = new string[]{"0_1", "1_1", "1_2", "1_3", "1_4", "2_1", "2_2", "2_3", "2_4", "3_1", "3_2", "4_1", "4_2"};
	vars.startedEndlevel = false;
}

start {
	return current.levelname == vars.levelnames[0] && current.loadingCode != 0;
}

split {
	if (current.levelname == vars.levelnames[12]) {
		if (vars.startedEndlevel && current.loadingCode == 0 && current.menucode == 5) {
			// end of game
			vars.startedEndlevel = false;
			return true;
		}
		if (current.loadingCode == 65554) {
			vars.startedEndlevel = true;
		}
	}
	
	return current.levelname != old.levelname;
}

// Returns True while game timer should be paused, False to continue
isLoading {
    return current.loadingCode == 0 || current.menucode == 1;
}