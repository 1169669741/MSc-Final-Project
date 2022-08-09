package com.boot.security.server.dao;

import java.util.List;
import java.util.Map;

import com.boot.security.server.model.statics;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.security.server.model.Yxjlb;

@Mapper
public interface YxjlbDao {

    @Select("select * from yxjlb t where t.id = #{id}")
    Yxjlb getById(Long id);

    @Delete("delete from yxjlb where id = #{id}")
    int delete(Long id);

    int update(Yxjlb yxjlb);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into yxjlb(sfzq, swyx, yxrm, yxrnl, yxrxb,yxsj) values(#{sfzq}, #{swyx}, #{yxrm}, #{yxrnl}, #{yxrxb}, #{yxsj})")
    int save(Yxjlb yxjlb);
    
    int count(@Param("params") Map<String, Object> params);

    List<Yxjlb> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);

    @Select("SELECT yxrm as statictype,count(id) as staticvalue from yxjlb where sfzq = '对' GROUP BY yxrm;")
    List<statics> staticfirst();

    @Select("SELECT swyx as statictype,count(id) as staticvalue ,yxrxb as staitcqt from yxjlb where sfzq = '对' GROUP BY swyx,yxrxb;")
    List<statics> staticsecond();

    @Select("SELECT swyx as statictype,count(id)/10 as staticvalue from yxjlb where sfzq = '对' and swyx in (1,2) GROUP BY swyx;")
    List<statics> staticthird();

    @Select("SELECT swyx as statictype,count(id)/10 as staticvalue from yxjlb where sfzq = '对' and swyx in (1,3) GROUP BY swyx;")
    List<statics> staticforth();

    @Select("SELECT swyx as statictype,count(id)/10 as staticvalue from yxjlb where sfzq = '对' and swyx in (4,5) GROUP BY swyx;")
    List<statics> staticfifth();

    @Select("SELECT swyx as statictype,count(id)/10 as staticvalue from yxjlb where sfzq = '对' and swyx in (4,6) GROUP BY swyx;")
    List<statics> staticsisth();

    @Select("SELECT swyx as statictype,sum(yxsj)/count(yxrm) as staticvalue from yxjlb where swyx in (4,5,6) GROUP BY swyx")
    List<statics> staticseven();
}
