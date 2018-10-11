package fr.cmm.tags;
import org.junit.Test;
import static org.junit.Assert.*;

public class FunctionsTests {
    @Test
    public void text(){
        assertEquals("a", Functions.text("a"));
        assertEquals("a<br>", Functions.text("a\n"));
        assertEquals("&amp;a", Functions.text("&a"));
    }
}
