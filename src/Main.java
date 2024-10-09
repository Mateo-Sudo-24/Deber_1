import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("-------Calculadora de Areas-------");
        System.out.println("1) Area del triangulo: ");
        System.out.println("2) Area del cuadrado: ");
        System.out.println("3) Area del circulo: ");
        System.out.println("Ingrese la figura que desea calcular: ");
        int figura = sc.nextInt();

        switch (figura) {
            case 1:
                System.out.println("---Area del triangulo---");
                System.out.println("Ingrese la base del triangulo: ");
                double base = sc.nextDouble();
                System.out.println("Ingrese la altura del triangulo: ");
                double altura = sc.nextDouble();
                double area = (base*altura)/2;
                System.out.println("El area del triangulo es: " + area);
                break;
            case 2:
                System.out.println("---Area del cuadrado---");
                System.out.println("Ingrese un lado del cuadrado: ");
        }
    }
}