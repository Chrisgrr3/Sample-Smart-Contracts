pragma solidity ^0.4.0;

contract Bidder {
    // uint: Unsigned integer of 256 bits
    // int: Integer positive and negative value accepted 256 bits
    // string: String of characters
    // bool: Supports logic true and false values
    // The default modifier is private

    // For every data declared public, accessor or getter function is 
    // automatically provided.

    string public name;
    uint public bidAmount = 20000;
    bool public eligible;
    uint constant minBid = 1000;

    function setName(string n) public {
        name = n;
    }

    function setBidAmount(uint amount) public {
        bidAmount = amount;
    }

    function determineEligibilty() public {
        if (bidAmount >= minBid) eligible = true;
        else eligible = false;
    }

}