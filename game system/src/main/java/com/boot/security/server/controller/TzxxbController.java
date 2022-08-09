package com.boot.security.server.controller;

import java.util.List;

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
import com.boot.security.server.dao.TzxxbDao;
import com.boot.security.server.model.Tzxxb;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/tzxxbs")
public class TzxxbController {

    @Autowired
    private TzxxbDao tzxxbDao;

    @PostMapping
    @ApiOperation(value = "保存")
    public Tzxxb save(@RequestBody Tzxxb tzxxb) {
        tzxxbDao.save(tzxxb);

        return tzxxb;
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id获取")
    public Tzxxb get(@PathVariable Long id) {
        return tzxxbDao.getById(id);
    }

    @PutMapping
    @ApiOperation(value = "修改")
    public Tzxxb update(@RequestBody Tzxxb tzxxb) {
        tzxxbDao.update(tzxxb);

        return tzxxb;
    }

    @GetMapping
    @ApiOperation(value = "列表")
    public PageTableResponse list(PageTableRequest request) {
        return new PageTableHandler(new CountHandler() {

            @Override
            public int count(PageTableRequest request) {
                return tzxxbDao.count(request.getParams());
            }
        }, new ListHandler() {

            @Override
            public List<Tzxxb> list(PageTableRequest request) {
                return tzxxbDao.list(request.getParams(), request.getOffset(), request.getLimit());
            }
        }).handle(request);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除")
    public void delete(@PathVariable Long id) {
        tzxxbDao.delete(id);
    }
}
