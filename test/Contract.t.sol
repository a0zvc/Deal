// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "../src/Deal.sol";
//import "Registry/IRegistry.sol";


contract createDeal is Test {

    IRegistry iR;
    address immutable registry_goerli = 0x4baF4Ecdd244807C9303DE843541e4C27edf67AD;
    
    function setUp() public {
        iR = IRegistry(registry_goerli);

    }

    function testExample() public {
        assertTrue(true);
    }
}
