pragma solidity ^0.5.0;

contract StateTrans {

    enum Stage {Init, Reg, Vote, Done}
    Stage public stage;
    uint startTime;
    uint public timeNow;

    constructor() public {
        stage = Stage.Init;
        startTime = now;
    }

    // We'll assume that state change has to be enacted approximately every ten seconds. The timeNow variable is defined for understanding the
    // process (we can simply use the 'now' Solidity defined variable).
    // Time duration for stages may depend on your application, but we'll use 10 seconds to illustrate the working.
    function advanceState () public {
        timeNow = now;
        if (timeNow > (startTime + 10 seconds)) {
            startTime = timeNow;
            if (stage == Stage.Init) {stage = Stage.Reg; return;}
            if (stage == Stage.Reg) {stage = Stage.Vote; return;}
            if (stage == Stage.Vote) {stage = Stage.Done; return;}
            return;
        }
    }
}