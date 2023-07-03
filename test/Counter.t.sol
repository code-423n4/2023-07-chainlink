// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "./BaseTest.sol";
import "../src/Counter.sol";

contract CounterTest is BaseTest {
    function testIncrement() public {
        vm.prank(address(s_timelock));
        s_counter.increment();
        assertEq(s_counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        vm.prank(address(s_timelock));
        s_counter.setNumber(x);
        assertEq(s_counter.number(), x);
    }
}
