/** 
 * TimeShift.asl - An ASL script for the auto-splitter of LiveSplit for the game TimeShift (v1.02)
 * @author  Ekelbatzen
 * @version 3 on February 28th 2016
 */
  
// Declare variables to watch via pointers and addresses in RAM
state("TimeShift") {
    string32 stateLevelname    : 0x66F0, 0x5C; // Like "ts2_city_part01.lg"
    bool     stateIsNotLoading : 0xBC8188;
    bool     stateIsBossAlive  : 0xCC0444, 0x230, 0x208;
}

// Variables to declare on script start
startup {
    vars.menuName = "menu.lg";
    vars.levelOneName = "ts2_city_part01.lg";
    vars.lastLevelName = "ts2_cityfinal_part01.lg";
}

// Returns True when time should start
start {
    return current.stateLevelname == vars.levelOneName;
}

// Returns True when split should be done
// Levelname formatting: (playing: x.lg) -> (ending: x) -> (next: y.lg)
split {
    bool isNoMenu = current.stateLevelname != vars.menuName;
    bool hasLevelChanged = isNoMenu && current.stateLevelname != old.stateLevelname;
    bool isEndingCorrectForIngame = current.stateLevelname.EndsWith(".lg");
    bool isLastLevel = current.stateLevelname == vars.lastLevelName;
    bool isNotLoading = current.stateIsNotLoading && current.stateLevelname != vars.menuName;
    bool isBossDead = isNotLoading && !current.stateIsBossAlive;

    return (hasLevelChanged && isEndingCorrectForIngame) || (isLastLevel && isBossDead);
}

// Returns True while game timer should be paused, False to continue
isLoading {
    return !current.stateIsNotLoading || current.stateLevelname == vars.menuName;
}