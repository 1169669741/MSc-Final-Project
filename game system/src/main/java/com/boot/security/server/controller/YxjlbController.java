package com.boot.security.server.controller;

import java.util.List;

import com.boot.security.server.model.statics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.boot.security.server.page.table.PageTableRequest;
import com.boot.security.server.page.table.PageTableHandler;
import com.boot.security.server.page.table.PageTableResponse;
import com.boot.security.server.page.table.PageTableHandler.CountHandler;
import com.boot.security.server.page.table.PageTableHandler.ListHandler;
import com.boot.security.server.dao.YxjlbDao;
import com.boot.security.server.model.Yxjlb;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/yxjlbs")
public class YxjlbController {

    @Autowired
    private YxjlbDao yxjlbDao;

    @PostMapping
    @ApiOperation(value = "保存")
    public Yxjlb save(@RequestBody Yxjlb yxjlb) {
        yxjlbDao.save(yxjlb);

        return yxjlb;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public Yxjlb get(@PathVariable Long id) {
        return yxjlbDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    public Yxjlb update(@RequestBody Yxjlb yxjlb) {
        yxjlbDao.update(yxjlb);

        return yxjlb;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return yxjlbDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<Yxjlb> list(PageTableRequest request) {
                return yxjlbDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    public void delete(@PathVariable Long id) {
        yxjlbDao.delete(id);
    }

    @GetMapping("/staticfirst")
    public List<statics> staticfirst(){
        return yxjlbDao.staticfirst();
    }

    @GetMapping("/staticsecond")
    public List<statics> staticsecond(){
        return yxjlbDao.staticsecond();
    }

    @GetMapping("/staticthird")
    public List<statics> staticthird(){
        return yxjlbDao.staticthird();
    }

    @GetMapping("/staticforth")
    public List<statics> staticforth(){
        return yxjlbDao.staticforth();
    }

    @GetMapping("/staticfifth")
    public List<statics> staticfifth(){
        return yxjlbDao.staticfifth();
    }

    @GetMapping("/staticsisth")
    public List<statics> staticsisth(){
        return yxjlbDao.staticsisth();
    }

    @GetMapping("/staticseven")
    public List<statics> staticseven(){
        return yxjlbDao.staticseven();
    }

}
