// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/Arachnid/solidity-stringutils/blob/master/src/strings.sol";

contract hangMan {    
    string [] arrayTestOutput = ["f", "o", "o", "-", "-", "-"];

    string [] finalWord;

    string failedGuess = "-";

    bool public functionActivated;

    function showStats() public {
        uint x = (arrayTestOutput.length);
        
        if (functionActivated = true) {
            for (uint i=0; i < x; i++) {
                if (keccak256(abi.encodePacked(arrayTestOutput[i])) == keccak256(abi.encodePacked(failedGuess))) {
                    finalWord.push(failedGuess);
                }
                else if (keccak256(abi.encodePacked(arrayTestOutput[i])) != keccak256(abi.encodePacked(failedGuess))) {
                    finalWord.push(arrayTestOutput[i]);
                }  
            }
        
            for (uint i=0; i < x; i++) {
                arrayTestOutput.pop();
            }
        }
        else if (functionActivated = false) {
            for (uint i=0; i < x; i++) {
                finalWord.push(arrayTestOutput[i]);
            }
            for (uint i=0; i < x; i++) {
            arrayTestOutput.pop();
            functionActivated = true;
            }
        }
    }

    function showFinalWord() public view returns (string [] memory){
        return finalWord;
    }
}

