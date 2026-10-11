// Belajar Java: class, inheritance, abstract, interface
// Jalankan (Java 11+): java 02_OOP.java
import java.util.ArrayList;
import java.util.List;

interface BisaDibayar {
    double hitungGaji();
}

abstract class Karyawan implements BisaDibayar {
    private final String nama;
    protected final int tahunMasuk;

    Karyawan(String nama, int tahunMasuk) {
        this.nama = nama;
        this.tahunMasuk = tahunMasuk;
    }

    public String getNama() {
        return nama;
    }

    int masaKerja() {
        return 2026 - tahunMasuk;
    }

    abstract String jabatan();

    @Override
    public String toString() {
        return String.format("%-8s %-10s masa kerja %d th, gaji Rp%,.0f",
                nama, jabatan(), masaKerja(), hitungGaji());
    }
}

class Tetap extends Karyawan {
    private final double gajiPokok;

    Tetap(String nama, int tahunMasuk, double gajiPokok) {
        super(nama, tahunMasuk);
        this.gajiPokok = gajiPokok;
    }

    String jabatan() { return "tetap"; }

    public double hitungGaji() {
        return gajiPokok + masaKerja() * 250_000; // tunjangan per tahun
    }
}

class Freelance extends Karyawan {
    private final int jam;
    private final double tarifPerJam;

    Freelance(String nama, int tahunMasuk, int jam, double tarifPerJam) {
        super(nama, tahunMasuk);
        this.jam = jam;
        this.tarifPerJam = tarifPerJam;
    }

    String jabatan() { return "freelance"; }

    public double hitungGaji() {
        return jam * tarifPerJam;
    }
}

public class OOP {
    public static void main(String[] args) {
        List<Karyawan> tim = new ArrayList<>();
        tim.add(new Tetap("Gusto", 2023, 6_000_000));
        tim.add(new Tetap("Ani", 2019, 8_500_000));
        tim.add(new Freelance("Budi", 2025, 60, 75_000));

        double total = 0;
        for (Karyawan k : tim) {
            System.out.println(k);
            total += k.hitungGaji();
        }
        System.out.printf("Total gaji: Rp%,.0f%n", total);
    }
}
