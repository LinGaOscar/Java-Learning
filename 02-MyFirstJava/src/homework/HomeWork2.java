package homework;

public class HomeWork2 {

  public static void main(String[] args) {
    int line = 5;
    // for (int i = 1; i <= line; i++) {
    // 	for (int j = 0; j < i; j++) {
    // 		System.out.print("*");
    // 	}
    // 	System.out.println();
    // }

    //HW another half
    // for (int i = 1; i <= line; i++) {
    //   for (int n = 1; n <= line - i; n++) {
    //     System.out.print("*");
    //   }
	//   System.out.println();
    // }

    //pyramid
    for (int i = 1; i <= line; i++) {
      for (int n = 1; n <= line - i; n++) {
        System.out.print(" ");
      }
      for (int j = 0; j < (2 * i - 1); j++) {
        System.out.print("*");
      }
      System.out.println();
    }
  }
}
