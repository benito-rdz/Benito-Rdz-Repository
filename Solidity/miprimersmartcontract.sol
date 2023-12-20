// SPDX-License-Identifier: GPL-3.0 
pragma solidity >=0.4.16 <0.9.0; //versión del compilador que se puede ejecutar.

contract SimpleStorage { //contract: nombre del contract. Todos los contratos se escribe entre llaves

//variebles de estado, se va a aestar escribiendo directamente en la block chain
    uint storedData;

//Funciones.
    function set(uint x) public {
        storedData = x; //el dato que recibas del parámetro guardalo
    }

    function get() public view returns (uint) { //aca lo regresa la variable.
        return storedData;
    }
}