package nl.gall.reflex.java;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class DatFileWriter {

    public static void writeDespatchNoteDataToDatFile(String reference, String item1, int qty1, String item2, int qty2, String item3, int qty3, String item4, int qty4)  throws IOException {
        FileWriter fw = new FileWriter("despatchnote.dat", true);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write( reference.substring(0,10) + "," + item1  + "," +qty1  + "," + item2 + "," + qty2 + "," + item3 + "," + qty3 + "," + item4 + "," + qty4);
        bw.newLine();
        bw.close();
    }
}
