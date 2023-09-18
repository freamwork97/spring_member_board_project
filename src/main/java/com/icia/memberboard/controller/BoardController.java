package com.icia.memberboard.controller;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.PageDTO;
import com.icia.memberboard.service.BoardService;
import com.icia.memberboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;

    @GetMapping("/write") // /board/save
    public String saveForm() {
        return "board/boardsave";
    }

    @PostMapping("/write")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {

        boardService.save(boardDTO);
        return "/board/boardlist";
    }


    @GetMapping("/list")
    public String findAll(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                          @RequestParam(value = "q", required = false, defaultValue = "") String q,
                          @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                          Model model) {
        // 검색이든 아니든 필요한 정보 : boardList, paging 전역변수 선언
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;

        // 검색 요청인가 아닌가 구분
        if (q.equals("")) {
            //일반 페이지 요청
            boardDTOList = boardService.pagingList(page);
            pageDTO = boardService.pageNumber(page);
        } else {
            // 검색 결과 페이지 요청
            boardDTOList = boardService.searchList(q, type, page);

            pageDTO = boardService.searchPageNumber(q, type, page);
        }
//        System.out.println("boardDTOList = " + boardDTOList);
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        model.addAttribute("page", page);
        return "board/boardlist";
    }
}
