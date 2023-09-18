package com.icia.memberboard.controller;

import com.icia.memberboard.dto.BoardDTO;
import com.icia.memberboard.dto.MemberDTO;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;
    private HttpSession session; // HttpSession 주입
    @GetMapping("/write") // /board/save
    public String saveForm() {
        return "board/boardsave";
    }

    @PostMapping("/write")
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
