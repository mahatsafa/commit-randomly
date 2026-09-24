// java notes
public class Notes {
    static String greet(String name) {
        return "hello " + name;
    }

    public static void main(String[] args) {
        System.out.println(greet("practice"));

        int[] nums = {1, 2, 3};
        for (int n : nums) {
            System.out.println(n * 2);
        }
    }
}
// TODO: try interfaces next
