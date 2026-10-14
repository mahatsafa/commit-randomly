// Belajar Java: Collection (List, Set, Map) & Stream API
// Jalankan (Java 17+): java 03_Collection.java
import java.util.*;
import java.util.stream.Collectors;

public class Koleksi {
    record Commit(String bahasa, int baris) {}

    public static void main(String[] args) {
        // List: berurutan, boleh duplikat
        List<String> bahasa = new ArrayList<>(List.of("java", "go", "python", "go"));
        Collections.sort(bahasa);
        System.out.println("list : " + bahasa);

        // Set: tanpa duplikat
        Set<String> unik = new TreeSet<>(bahasa);
        System.out.println("set  : " + unik);

        // Map: key -> value
        Map<String, Integer> port = new HashMap<>();
        port.put("ssh", 22);
        port.put("http", 80);
        port.put("netdata", 19999);
        port.forEach((k, v) -> System.out.println("  " + k + " -> " + v));
        System.out.println("ada mysql? " + port.containsKey("mysql"));
        System.out.println("port mysql: " + port.getOrDefault("mysql", -1));

        // Stream: olah data secara deklaratif
        List<Commit> log = List.of(
                new Commit("python", 40), new Commit("go", 25),
                new Commit("python", 15), new Commit("rust", 60),
                new Commit("go", 10));

        Map<String, Integer> barisPerBahasa = log.stream()
                .collect(Collectors.groupingBy(Commit::bahasa,
                        TreeMap::new, Collectors.summingInt(Commit::baris)));
        System.out.println("baris per bahasa: " + barisPerBahasa);

        List<String> besar = log.stream()
                .filter(c -> c.baris() >= 25)
                .map(c -> c.bahasa() + "(" + c.baris() + ")")
                .toList();
        System.out.println("commit besar: " + besar);

        IntSummaryStatistics stat = log.stream().mapToInt(Commit::baris).summaryStatistics();
        System.out.printf("total %d baris, rata-rata %.1f%n", stat.getSum(), stat.getAverage());
    }
}
