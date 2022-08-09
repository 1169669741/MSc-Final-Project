package com.boot.security.server.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.boot.security.server.model.Paper;

@Mapper
public interface PaperDao {

    @Select("select * from paper t where t.id = #{id}")
    Paper getById(Long id);

    @Delete("delete from paper where id = #{id}")
    int delete(Long id);

    int update(Paper paper);
    
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into paper(author, doc_location, keyword, pabstract, paper_id, source, student_id, title, uploading_time) values(#{author}, #{docLocation}, #{keyword}, #{pabstract}, #{paperId}, #{source}, #{studentId}, #{title}, #{uploadingTime})")
    int save(Paper paper);
    
    int count(@Param("params") Map<String, Object> params);

    List<Paper> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset, @Param("limit") Integer limit);
}
