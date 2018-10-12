package fr.cmm.helper;
import org.junit.Test;
import static org.junit.Assert.*;

public class PaginationTest {
    @Test
    public void pagination(){
        Pagination pagination = new Pagination();
        pagination.setCount(120);
        pagination.setPageSize(20);
        assertEquals(6, pagination.getPageCount());
        pagination.setPageSize(25);
        assertEquals(4, pagination.getPageCount());
        pagination.setCount(0);
        assertEquals(0, pagination.getPageCount());
    }
}
