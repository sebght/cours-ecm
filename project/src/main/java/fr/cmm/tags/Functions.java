package fr.cmm.tags;

public class Functions {
    public static String text(String a){
        a=a.replace("\n","<br>");
        a=a.replace("&","&amp;");
        return a;
    }
}
