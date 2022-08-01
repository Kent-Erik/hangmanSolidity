// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/willitscale/solidity-util/blob/master/lib/Strings.sol";

contract ConstantAndTransaction {

    //uint trivial = 11;

    //function getTrivial() public view returns(uint) {
        // When called directly, this function is run locally and gas is refunded. 
        // The network is not consulted.     
        //return trivial;
    //}

    //function sub(uint x) public {
        // This is normally a state-changing transaction. It relies on inspecting a read-only function. 
        // That means all nodes will run the read-only function and the sender will pay for it. 
        //trivial += getTrivial() + x;
    //}

    string [] public test = ["f", "-", "-", "b", "-", "-","-", "-", "-", "b", "-", "-"];
    string [] public testNumeroDos = ["-", "-", "-", "-", "-", "r"];
    string [] public finalWord = ["f", "o", "o", "-", "-", "-"];
    string failedGuess = "-";
    bool public functionActivated = false; 

    //function split() public returns(string [] memory) {
        //uint x = (test.length / 2);
            //for(uint i; i < x; i++) {
                //string element = test[i];
                //test.pop();
                //return element;
        //} 
        //return test;
    //}

    function removeShit() public returns(string [] memory) {
        uint x = (testNumeroDos.length);
        for (uint i=0; i < x; i++) {
            if (keccak256(abi.encodePacked(testNumeroDos[i])) == keccak256(abi.encodePacked(failedGuess))) {
                continue;
            }
            else if (keccak256(abi.encodePacked(testNumeroDos[i])) != keccak256(abi.encodePacked(failedGuess))) {
                finalWord[i] = testNumeroDos[i];
            }
            //testNumeroDos.pop();
        }
        
        for (uint i=0; i < x; i++) {
            testNumeroDos.pop();
        }
        return testNumeroDos;
    }
    
    function showFinalWord() public view returns (string [] memory){
        return finalWord;
    }

    function showTestNumeroDos() public view returns (string [] memory){
        return testNumeroDos;
    }

}    
