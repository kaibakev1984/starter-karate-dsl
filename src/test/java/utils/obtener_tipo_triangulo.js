/*
    @param lado1
    @param lado2
    @param lado3
*/
function fn(lado1, lado2, lado3) {
    if (lado1 == lado2 && lado2 == lado3) {
        return "equilatero";
    }
    if (lado1 != lado2 && lado2 != lado3) {
        return "escaleno";
    }
    return "isosceles";
}