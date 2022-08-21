// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "./interfaces/IRegistry.sol";
import "./interfaces/IDeal.sol";
import "vest_minimal/interface/IVestoor.sol";
import "./DealTokenFactory.sol";



contract Deal is ERC721("A0Z Deal","DEAL"), IDeal {

    IRegistry R;
    IERC20 Stable;
    DealToken DealT;
    IMiniVest IVest;

    uint maxID;
    mapping(uint256 => string) _tokenURIs;
    mapping(uint => address) dealTokendAddress;

    constructor(address R_) {
        R = IRegistry(R_);
        Stable = IERC20(R.opTokenAddress());
        
    }

////// Errors /////////
error ParentTokenUnregistered();

////// Events //////////
event IncrementedTo(uint id);

////// Modifiers ///////


////// Public //////

////// External //////



function createDeal(string memory name_, 
    string memory symbol_,
    address parentToken_

    ) public returns (uint) {
    if ( ! R.isRegistered(parentToken_)) revert ParentTokenUnregistered();
    _incrementID();
    // DealT = new DealToken();
    // dealTokendAddress[maxID] = address(DealT);
    // IVest = IMiniVest(address(DealT));
    
    return maxID;
}



////// Private ////// 

function _incrementID() private {
    unchecked { ++ maxID; }
    emit IncrementedTo(maxID);
}


////// View //////

function lastID() public view returns (uint256) {
    return maxID;
}

function getDealToken(uint id_) public view returns (address) {
    return dealTokendAddress[id_];
}



}
