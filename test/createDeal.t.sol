// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "../src/Deal.sol";
//import "Registry/IRegistry.sol";
// import "./mocks/mockDAI.sol";


contract createDeal is Test {

    IRegistry iR;
    IERC20 mDAI;

    address immutable registry_goerli = 0x0E0BD1e019109fddEdb75C00fF8d76075d719788;
    uint immutable MAX_UINT = type(uint).max - 99;
    address deployer = 0xb3F204a5F3dabef6bE51015fD57E307080Db6498;
    address factory = 0xc35DADB65012eC5796536bD9864eD8773aBc74C4; 
    address router = 0x1b02dA8Cb0d097eB8D57A175b88c7D8b47997506;
    address opToken =0xFf6d5B4C418A4064aA9aF61Ac97CeA07d833d3e9;


    function setUp() public {
        // vm.assume(_x > 101);
        // vm.assume(_x < type(uint256).max / 2 + 65);
        vm.createSelectFork(vm.envString("GOERLI_ALCHEMY"), 7432592);
        vm.startPrank(deployer);
        
        iR = IRegistry(registry_goerli);
        mDAI =  IERC20(opToken);

        
        console.log("OP token is: ",opToken);
        if (mDAI.allowance(deployer, address(iR)) == 0 )
        {   
            mDAI.approve(address(iR), MAX_UINT);
            uint stableAmount = mDAI.balanceOf(deployer) / 2;
            assertTrue(stableAmount > 0, 'balance is 0');

            uint a0zMintAmount = 100 * 10 ** 18;
            iR.setExternalPoints(router,factory,address(mDAI), 10, stableAmount, a0zMintAmount);
        }


        /// @param _router: UniV2 router address
        /// @param _factory: UniV2 factory address
        /// @param _reliableERC20 third party ERC20 (DAI/USDC etc.) used for value determinations
        /// @param _tributeShare share of totalsupply as value contribution. 100:1%, 10:10%, 5:20%
        /// @param _reliableAmt sender approved amount to add as initial liquidity at pool formation
        /// @param _a0zAmount amount to mint and add as initial liquidity at pool formation
        //if (opToken == address(0)) iR.setExternalPoints(router,factory,address(mDAI), 10, (20*10**18), 1**18);

        vm.stopPrank();

    
    }

    function testSetupCheck() public {
        assertTrue(iR.opTokenAddress() == address(mDAI), "op token is 0");
        // assertTrue(iR.owner() == deployer, "deployer not owner"); @dev solmate method unavailable
        assertTrue(iR.calculateInitValue() != 0, "initvalue is 0"); //@dev @todo fuzz and consider init amount edgecases on calculateInit() 
    }



    
}
