package com.icia.memberboard.controller;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.dto.PageDTO;
import com.icia.memberboard.service.BoardService;
import com.icia.memberboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
//@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;
    private HttpSession session; // HttpSession 주입
    @GetMapping("/board/write") // /board/save
    public String saveForm() {
        return "board/boardsave";
    }

    @PostMapping("/board/write")
    public String save(@ModelAttribute BoardDTO boardDTO, HttpServletRequest request) throws IOException {
        // 로그인한 사용자의 정보를 가져와서 boardDTO의 memberId에 설정합니다.
        String loginEmail = (String) request.getSession().getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        boardDTO.setMemberId(memberDTO.getId());
        boardDTO.setBoardWriter(loginEmail);
        // 나머지는 이미 BoardService에서 처리하고 있기 때문에 boardService.save(boardDTO)만 호출합니다.
        boardService.save(boardDTO);
        return "redirect:/list"; // 저장 후 리스트 페이지로 이동합니다.
    }

    // /board/
    // /board?id=1
    // /board/list?page=1

    @GetMapping("/board/list")
    public String findAll(@RequestParam(value = "page", defaultValue = "1") int page,
                          @RequestParam(value = "q", defaultValue = "") String q,
                          @RequestParam(value = "type", defaultValue = "boardTitle") String type,
                          Model model) {
        List<BoardDTO> boardDTOList;
        PageDTO pageDTO;

        if (q.isEmpty()) {
            boardDTOList = boardService.pagingList(page);
            pageDTO = boardService.pageNumber(page);
        } else {
            boardDTOList = boardService.searchList(q, type, page);
            pageDTO = boardService.searchPageNumber(q, type, page);
        }

        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        model.addAttribute("page", page);

        return "board/boardlist";
    }

}
