// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Twitter is Owner {

    string private message;

    function setMessage(string memory _message) public isOwner {
        message = _message;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }

}