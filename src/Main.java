import java.util.Scanner;

public class Main {
    public Main() {
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true){
            System.out.println("-------Calculadora de Areas-------");
            System.out.println("1) Area del triangulo: ");
            System.out.println("2) Area del cuadrado: ");
            System.out.println("3) Area del circulo: ");
            System.out.println("4) Salir del sistema");
            System.out.println("Ingrese la figura que desea calcular: ");
            int figura = sc.nextInt();
            switch (figura) {
                case 1:
                    System.out.println("---Area del triangulo---");
                    System.out.println("Ingrese la base del triangulo: ");
                    double base = sc.nextDouble();
                    System.out.println("Ingrese la altura del triangulo: ");
                    double altura = sc.nextDouble();
                    double area = base * altura / 2.0;
                    System.out.println("El area del triangulo es: " + area);
                    break;
                case 2:
                    System.out.println("---Area del cuadrado---");
                    System.out.println("Ingrese un lado del cuadrado: ");
                    double ladoC = sc.nextDouble();
                    double areaC = Math.pow(ladoC, 2.0);
                    System.out.println("El area del cuadrado es: " + areaC);
                    break;
                case 3:
                    System.out.println("---Area del circulo---");
                    System.out.println("Ingrese el radio del circulo: ");
                    double radioC = sc.nextDouble();
                    double areaC= Math.PI * Math.pow(radioC,2);
                    System.out.println("El area del circulo es: " + areaC);
                    break;
                case 4:
                    System.out.printf("---Saliendo del sistema---");
                    return;
                default:
                    System.out.printf("---Ingrese un número que este en el menu---");
            }

            System.out.printf("Presione cualquier tecla para volver al menu");
            sc.nextLine();
            sc.nextLine();
        }
    }
}
