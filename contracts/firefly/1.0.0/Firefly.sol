// SPDX-License-Identifier: Apache-2.0

// current version: https://github.com/hyperledger/firefly/blob/0bcef0d6e114c7d43c4db8a65a31973d30120632/smart_contracts/ethereum/solidity_firefly/contracts/Firefly.sol

pragma solidity >=0.6.0 <0.9.0;

contract Firefly {

    event BatchPin (
        address author,
        uint timestamp,
        string namespace,
        bytes32 uuids,
        bytes32 batchHash,
        string payloadRef,
        bytes32[] contexts
    );

    function pinBatch(string memory namespace, bytes32 uuids, bytes32 batchHash, string memory payloadRef, bytes32[] memory contexts) public {
        emit BatchPin(msg.sender, block.timestamp, namespace, uuids, batchHash, payloadRef, contexts);
    }

}