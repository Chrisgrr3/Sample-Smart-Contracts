pragma solidity 0.4.15;

contract WhatTheFunc {
    string word;
    uint number;
    address owner;

    function WhatTheFunc() {
        word = "bird";
        number = 42;
        owner = msg.sender // This sets the owner of the contract as the individual who made the smart contract.
    }

    event Changed(address a);

    modifier onlyOwner {
        // if (msg.sender != owner) {
        //     throw;
        // }
        require(msg.sender == owner);
        // 'require' is a more readible form of the above 'if' statement

        _; // The space is a placeholder for whatever function holds the 'onlyOwner' modifier, 
        // setWord() in this case.
    }

    function getWord() constant returns(string) {
        // We set this as constant because we are not making any changes to the state of the blockchain.
        return word;
    }

    function setWord(string w) onlyOwner {
        // Because this function uses the 'onlyOwner' modifier, only the creator of the smart contract can use this function.
        word = w;
        Changed(msg.sender);
    }
}