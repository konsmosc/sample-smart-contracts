// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Voting {

    address private owner;
    mapping (bytes32 => uint) private votesReceived;
    bytes32[] public candidateList;

    constructor(bytes32[] memory candidateNames, string memory title) {
        candidateList = candidateNames;
        votetitle = title;
        owner = msg.sender;
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate) == true,"Candidate doesn't exists");
        votesReceived[candidate] += 1;
    }


    function totalVotesFor(bytes32 candidate) public view returns (uint) {
        require(validCandidate(candidate) == true, "Candidate doesn't exists");
        return votesReceived[candidate];
    }

    function validCandidate(bytes32 candidate) private view returns (bool) {
        for(uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }

    function candidates() public view returns (bytes32[] memory) {
        bytes32[] memory list = new bytes32[](candidateList.length);
        for(uint i = 0; i < candidateList.length; i++){
            list[i] = candidateList[i];
        }
        return list;
    }

}
