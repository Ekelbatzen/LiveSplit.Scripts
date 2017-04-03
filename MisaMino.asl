/** 
 * MisaMino.asl - An ASL script for the auto-splitter of LiveSplit for the game MisaMino V1.4.5
 * @author  Ekelbatzen
 * @version 1 on April 3rd 2017
 */

state("misamino_V1.4.5"){
	int p1Wins    : 0x495B8, 0x58, 0x1C;
	int p2Wins    : 0x495B8, 0x68, 0x68;
	int turnCount : 0x495B8, 0x48, 0x48;
}

startup{
	vars.timerModel = new TimerModel { CurrentState = timer };
	settings.Add("endReset", false, "Reset when restarting a finished game");
}

update {
	// Resets a finished run
    if(current.turnCount < old.turnCount && settings["endReset"]){
		vars.timerModel.Reset();
	}
}

start{
	return current.turnCount == 1;
}

split{
	return current.p1Wins != old.p1Wins || current.p2Wins != old.p2Wins;
}

reset{
	return current.turnCount < old.turnCount;
}