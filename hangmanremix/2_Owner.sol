// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/Arachnid/solidity-stringutils/blob/master/src/strings.sol";

contract hangMan {
    using strings for *;
    
    string secretWord;

    function chooseYourWord(string memory yourWord) public {
        secretWord = yourWord;
    }
    
    // the following three variables should be remade into a struct
    string [] arrayTestOutput;

 

    string [] private failedGuesses;

    //uint private hangManCountDown = 11;
    
    string letterGuess;
    
    string failedGuess = "-";

    function guessALetter(string memory yourLetter) public {
        letterGuess = yourLetter;
        strings.slice memory s = secretWord.toSlice();
        string[] memory letterArray = new string[](s.len());
        for (uint i = 0; s.len() > 0; i++) {
        letterArray[i] = s.nextRune().toString();
            if (keccak256(abi.encodePacked(letterArray[i])) == keccak256(abi.encodePacked(letterGuess))) {
                arrayTestOutput.push(letterGuess);
            }
            else if (keccak256(abi.encodePacked(letterArray[i])) != keccak256(abi.encodePacked(letterGuess))) {
                arrayTestOutput.push(failedGuess);
                // failedGuesses.push(letterGuess);
            }
        }
        //return (arrayTestOutput);
    }
    
    string [] private letterAdd;
    
    bool public functionActivated = false; 

   //function showTestOutput() public returns ( string [] memory){
        //if (functionActivated = true)
            
        //for (uint i=0; i < letterArray.length; i++) {
            //if (keccak256(abi.encodePacked(letterArray[i])) == keccak256(abi.encodePacked(letterGuess))) {
                //arrayTestOutput.push(letterGuess);
           //}
           //else if (keccak256(abi.encodePacked(letterArray[i])) != keccak256(abi.encodePacked(letterGuess))) {
                //arrayTestOutput.push(failedGuess);


        //functionActivated = true;
        //return arrayTestOutput;
            //}
        //}
    //}

    function showTestOutput() public view returns (string [] memory){
        return arrayTestOutput;
    }

    //function showFailedGuesses() public view returns (string [] memory){
       // return failedGuesses;
    //}    
    
    function revealWord() public view returns(string memory){
        return secretWord;   
    }
}