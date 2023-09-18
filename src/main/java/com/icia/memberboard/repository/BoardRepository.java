package com.icia.memberboard.repository;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFile", boardFileDTO);
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> searchList(Map<String, Object> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }

    public int boardSearchCount(Map<String, String> pagingParams) {
        return sql.selectOne("Board.searchcount", pagingParams);
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }
    public List<BoardFileDTO> findFile(Long boardId) {
        return sql.selectList("Board.findFile", boardId);
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }


}
