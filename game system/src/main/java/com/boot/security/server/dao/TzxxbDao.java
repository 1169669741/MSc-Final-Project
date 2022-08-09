package com.boot.security.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.security.server.model.Tzxxb;

@Mapper
public interface TzxxbDao {

    @Select("select * from tzxxb t where t.id = #{id}")
    Tzxxb getById(Long id);

    @Delete("delete from tzxxb where id = #{id}")
    int delete(Long id);

    int update(Tzxxb tzxxb);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into tzxxb(tzcp, tzsj, tznll, tzqx, tzje, tzzt, tzsy, tzyh) values(#{tzcp}, #{tzsj}, #{tznll}, #{tzqx}, #{tzje}, #{tzzt}, #{tzsy}, #{tzyh})")
    int save(Tzxxb tzxxb);
    
    int count(@Param("params") Map<String, Object> params);

    List<Tzxxb> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
