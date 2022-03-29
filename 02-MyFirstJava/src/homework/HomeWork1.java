package homework;

public class HomeWork1 {

  public static void main(String[] args) {
    for (int i = 1; i <= 100; i++) {
      if (i % 10 == 1 && i > 10) {
        System.out.println();
      }
      System.out.print(i + " \t");
    }

    //HW 9*9
    // for (int i = 1; i < 10; i++) {
    //   for (int j = 1; j < 10; j++) {
    //     if (j % 10 == 1 && i != 1) {
    //       System.out.println();
    //     }
    //     System.out.print(i * j + "\t");
    //   }
    // }
  }
}
