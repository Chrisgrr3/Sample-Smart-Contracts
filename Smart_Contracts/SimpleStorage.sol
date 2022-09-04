pragma solidity ^0.4.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }
    function get() constant public returns (uint) {
        return storedData;
    }
    function increment(uint n) public {
        storedData = storedData + n;
    }
    function decrement(uint n) public {
        storedData = storedData - n;
    }
    function multiply(uint n) public {
        storedData = storedData * n;
    }
    function divide(uint n) public {
        storedData = storedData / n;
    }
    function getMultiplied(uint n) constant public returns (uint) {
        multiply(n);
        return storedData;
    }
}