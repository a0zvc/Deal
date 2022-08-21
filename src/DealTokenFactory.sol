// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import "./interfaces/IRegistry.sol";
import "./interfaces/IDeal.sol";
import "vest_minimal/MiniVest.sol";

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

uint256 constant k = 999999999 * 10 **18;

contract DealToken is ERC20, MiniVest(k) {



    constructor(
      string memory name_, 
      string memory symbol_,
      address[] memory participants_, 
      uint[] memory amounts_,
      uint[] memory days_,
      address bigBoss_ ) ERC20(name_, symbol_)  {
       
        

     }


     ///delegateCall to Deal on transfer?
     /// add available withdrawal? 
}