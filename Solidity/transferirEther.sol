// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SendEther {

    //Hay 3 maneras de enviar ether

    //1 send
    //esta funcion ya no se usa mucho, porque no puede transferir la transacción. 
    //si queremos que una funcion reciba ether debe tener la variable payable 2300 unidades de gas
    function sendEtherSend(address payable _to) public payable {
        bool sent = _to.send(msg.value); //esta variable guardara lo que tranfiramos
        require(sent,"Error");
    }

    //2 transfer()
    //Si no es posible hacer la transacción en automático se revierte la transacción.
    //2300 unidades de gas máximo.
    function sendEtherTransfer (address payable _to) public payable{
        _to.transfer(msg.value);
    }


    //3 call() funcion de bajo nivel.
    // Esto ya es más personalizable, así que aca puede cambiar parámetros.
    function sendEtherCall(address payable _to) public payable returns (bytes memory){
        (bool sent, bytes memory data) = _to.call{value: msg.value, gas: 1000}("");
        require(sent, "Error");
        return data;
    }
}

contract ReceiveEther {
    //con esta reviso el balance
    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    //receive()
    receive() external payable {

    }

    //Fallback ()
    fallback() external payable{

    }

}