package com.boot.security.server.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataTablePage {

    DataTablePage(){

    }

    public static DataTablePage CreateDataTablePage(Map<String,String[]> map){
        DataTablePage page = new DataTablePage();
        int indexCol = -1;
        Column col = null;
        List<Column> lstCol = new ArrayList<>();
        for (Map.Entry<String,String[]> m: map.entrySet()
        ) {
            String key = m.getKey();
            String val = m.getValue()[0];
            if(key.trim().equalsIgnoreCase("draw")){
                if(val!= "") page.setDraw(Integer.parseInt(val));
            }else if(key.trim().equalsIgnoreCase("start")){
                if(val!= "") page.setStart(Integer.parseInt(val));
            }else if(key.trim().equalsIgnoreCase("length")){
            if(val!= "") page.setLength(Integer.parseInt(val));
            }else if(key.trim().startsWith("order")) {
                if(key.trim().endsWith("[column]"))
                    page.setOrderColNo(Integer.parseInt(val));
                if(key.trim().endsWith("[dir]"))
                    page.setOrderType(val);
            }else if(key.trim().startsWith("columns")){
                String va = key.substring(key.indexOf('[')+1,key.indexOf(']'));
                int index = Integer.valueOf(va);
                if(lstCol.size()<=index){
                    lstCol.add(new Column());
                }
                col = lstCol.get(index);
                col.setIndex(index);
                if(key.trim().endsWith("[data]")) col.setData(val);
                if(key.trim().endsWith("[name]")) col.setName(val);
                if(key.trim().endsWith("[searchable]")) col.setSearchable(Boolean.valueOf(val));
                if(key.trim().endsWith("[orderable]")) col.setOrderable(Boolean.valueOf(val));
                if(key.trim().endsWith("[search][value]")) col.setSearchValue(val);
                if(key.trim().endsWith("[search][regex]")) col.setSearchRegex(Boolean.valueOf(val));
            }

        }
        page.setColumns(lstCol);

        return page;
    }

    public Map<String,Object> getSearchParams(){
        Map<String,Object> map = new HashMap<>();
        for (Column c:this.getColumns()
             ) {
            if(c.searchable && !map.containsKey(c.data))
            map.put(c.data,c.searchValue);
        }
        return  map;
    }

    int draw = -1;
    int start = 0;
    int length = 0;
    int orderColNo = -1;
    String orderColName = "";
    String orderType = "asc";
    List<Column> Columns;

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getOrderColNo() {
        return orderColNo;
    }

    public void setOrderColNo(int orderColNo) {
        this.orderColNo = orderColNo;
    }

    public String getOrderColName() {
        return orderColName;
    }

    public void setOrderColName(String orderColName) {
        this.orderColName = orderColName;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public List<Column> getColumns() {
        return Columns;
    }

    public void setColumns(List<Column> columns) {
        Columns = columns;
    }

    static class Column{
         int index;
         String data;
         String name;
         boolean searchable;
         boolean orderable;
         boolean searchRegex;
         String searchValue;

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }

        public String getData() {
            return data;
        }

        public void setData(String data) {
            this.data = data;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public boolean isSearchable() {
            return searchable;
        }

        public void setSearchable(boolean searchable) {
            this.searchable = searchable;
        }

        public boolean isOrderable() {
            return orderable;
        }

        public void setOrderable(boolean orderable) {
            this.orderable = orderable;
        }

        public boolean isSearchRegex() {
            return searchRegex;
        }

        public void setSearchRegex(boolean searchRegex) {
            this.searchRegex = searchRegex;
        }

        public String getSearchValue() {
            return searchValue;
        }

        public void setSearchValue(String searchValue) {
            this.searchValue = searchValue;
        }
    }
}
