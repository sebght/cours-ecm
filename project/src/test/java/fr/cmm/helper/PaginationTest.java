package fr.cmm.helper;
import org.junit.Assert;
import org.junit.Test;

import java.util.*;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class PaginationTest {
    @Test
    public void pageCount(){
        Pagination pagination = new Pagination();
        pagination.setCount(120);
        pagination.setPageSize(20);
        assertEquals(6, pagination.getPageCount());
        pagination.setPageSize(25);
        assertEquals(5, pagination.getPageCount());
        pagination.setCount(0);
        assertEquals(1, pagination.getPageCount());
    }

    @Test
    public void getPage(){
        Pagination pagination = new Pagination();
        pagination.setCount(120);
        pagination.setPageSize(20);
        List<Integer> integerList = Arrays.asList(1,2,3,4,5,6);
        Assert.assertEquals(integerList,pagination.getPages());
        pagination.setPageSize(25);
        integerList = Arrays.asList(1,2,3,4,5);
        Assert.assertEquals(integerList,pagination.getPages());
        pagination.setCount(0);
        integerList = Arrays.asList(1);
        Assert.assertEquals(integerList,pagination.getPages());
    }
}
