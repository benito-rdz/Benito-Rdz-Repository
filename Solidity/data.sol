// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Funciones {

    //Calculadora 

    //Variables de estado
    int internal operador1; 
    int public operador2; 
    int private resultado;

    //Funciones 

    //Recibe n parametros
    function asignarDatos(int _parametro1, int _parametro2) public {
        operador1 = _parametro1;
        operador2 = _parametro2;
    }

    //No recibe parametros
    function sumar() internal{
        resultado = operador1 + operador2;
    }

    //
    //No recibe parametros
    function division() public{
        resultado = operador1 / operador2;
    }


    //Regresa un valor 
    function obtenerResultado() public view returns (int){
        return resultado;
    }

    //Regresa múltiples valores
    function obtenerValores() public view returns (int, int, int) {
        return (operador1, operador2, resultado);
    }

    //Reciba un valor y regrese multiples valores 


    //Recibe varios valores y regrese varios valores 

    //Función dentro de otra funcion


    function potencia(int _dato) public pure returns(int){
        int res;
        res = _dato*_dato;
        return res;
    }

    int suma;
    function recibirValores (int _valor1, int _valor2, int _valor3) public returns (int) {
        suma = _valor1 + _valor2 + _valor3;
        return suma;
    }


    function robotOperator(int[] memory arrayOfInputs) public returns(int[] memory, int){
        int sum = 0;
        uint top = arrayOfInputs.length;
        for (uint i=0; i < top; i++) 
        {
            sum = sum + arrayOfInputs[i];
        }
        return (arrayOfInputs, sum);
    }


    address public owner; 

    //Constructor 
    constructor (int _parametro1, int _parametro2){
        owner = msg.sender; 

        asignarDatos(_parametro1, _parametro2);
    }
}
