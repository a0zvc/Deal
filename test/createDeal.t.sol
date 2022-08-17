// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "../src/Deal.sol";
//import "Registry/IRegistry.sol";
import "./mocks/mockDAI.sol";


contract createDeal is Test {

    IRegistry iR;
    mockDAI mDAI;

    address immutable registry_goerli = 0x4baF4Ecdd244807C9303DE843541e4C27edf67AD;
    uint immutable MAX_UINT = type(uint).max - 99;
    address deployer = 0xb3F204a5F3dabef6bE51015fD57E307080Db6498;
    address factory = 0xc35DADB65012eC5796536bD9864eD8773aBc74C4; 
    address router = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;
    address opToken;



    function setUp() public {
        vm.startPrank(deployer);
        vm.createSelectFork(vm.envString("GOERLI_ALCHEMY"), 7412222);

        iR = IRegistry(registry_goerli);
        opToken = iR.opTokenAddress();
 
        mDAI = opToken == address(0) ? new mockDAI() : mockDAI(iR.opTokenAddress());
        console.log("OP token is: ",opToken);
        if (mDAI.allowance(deployer, address(iR)) == 0 ) mDAI.approve(address(iR), MAX_UINT);
        iR.setExternalPoints(router,factory,address(mDAI), 10, (20*10**18), 1**18);
        
        // if (opToken == address(0)) {

        // }
        console.log('goerli fork url: ', vm.envString("GOERLI_ALCHEMY"));


        /// @param _router: UniV2 router address
        /// @param _factory: UniV2 factory address
        /// @param _reliableERC20 third party ERC20 (DAI/USDC etc.) used for value determinations
        /// @param _tributeShare share of totalsupply as value contribution. 100:1%, 10:10%, 5:20%
        /// @param _reliableAmt sender approved amount to add as initial liquidity at pool formation
        /// @param _a0zAmount amount to mint and add as initial liquidity at pool formation
        //if (opToken == address(0)) iR.setExternalPoints(router,factory,address(mDAI), 10, (20*10**18), 1**18);
        opToken = address(mDAI);
        vm.stopPrank();

    
    }

    function testSetupCheck() public {
        assertTrue(opToken == address(mDAI), "op token is 0");
        //assertTrue(iR.calculateInitValue() != 0, "initvalue is 0");


    }



    
}
