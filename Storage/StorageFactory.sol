// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;
    mapping(address => uint256) public simpleStorageToIndex;
    uint256 public totalSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorageContract = new SimpleStorage();
        
        listOfSimpleStorageContracts.push(simpleStorageContract);
        simpleStorageToIndex[address(simpleStorageContract)] = listOfSimpleStorageContracts.length - 1;
        totalSimpleStorageContracts++;
    }

    function addPersonToContract(address _simpleStorageAddress, string memory _name, uint256 _favoriteNumber) public {
        uint256 simpleStorageIndex = simpleStorageToIndex[_simpleStorageAddress];
        SimpleStorage simpleStorageContract = listOfSimpleStorageContracts[simpleStorageIndex];
        simpleStorageContract.addPerson(_name, _favoriteNumber);
    }

    function getAllFavoriteNumbers(address _simpleStorageAddress) public view returns (string[] memory, uint256[] memory) {
    uint256 simpleStorageIndex = simpleStorageToIndex[_simpleStorageAddress];
    SimpleStorage simpleStorageContract = listOfSimpleStorageContracts[simpleStorageIndex];
    
    string[] memory names = simpleStorageContract.getKeys();
    uint256[] memory favoriteNumbers = new uint256[](names.length);
    
    for (uint256 i = 0; i < names.length; i++) {
        string memory name = names[i];
        favoriteNumbers[i] = simpleStorageContract.nameToFavoriteNumber(name);
    }
    
    return (names, favoriteNumbers);
}
}