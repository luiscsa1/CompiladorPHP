//MAIN
package lexico;
import java.io.File;

public class Lexico {

    public static void main(String[] args) {
     String cadena="C:\\Users\\Luis\\Documents\\NetBeansProjects\\Lexico\\src\\lexico\\Lexer.flex";   
     generarLexico(cadena);
    }
     
     
    
    private static void generarLexico(String cadena){
        File file=new File(cadena);
        jflex.Main.generate(file);
    }

}
