// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "vest_minimal/interface/IVestoor.sol";
import "./interfaces/IRegistry.sol";
import "./interfaces/IDeal.sol";
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


contract DealToken is ERC20 {

    IMiniVest Vestoor;

    constructor(string memory name_, 
    string memory symbol_,
     address[] memory participants_, 
     address[] memory amounts_,
     uint256[] memory days_,
     address bigBoss_ ) ERC20(name_, symbol_)  {
        
        Vestoor = IMiniVest(msg.sender);

     }


     ///delegateCall to Deal on transfer?
     /// add available withdrawal? 
}