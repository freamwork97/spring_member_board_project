package com.icia.memberboard.controller;

import com.icia.memberboard.dto.*;
import com.icia.memberboard.service.BoardService;
import com.icia.memberboard.service.CommentService;
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
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private MemberService memberService;
    private HttpSession session; // HttpSession 주입

    @Autowired
    private CommentService commentService;

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
        boardService.save(boardDTO);
        return "redirect:/board/list"; // 저장 후 리스트 페이지로 이동합니다.
    }

    // /board/
    // /board?id=1
    // /board/list?page=1

    @GetMapping("/list")
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

    @GetMapping
    public String findById(@RequestParam("id") Long id,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(value = "q", required = false, defaultValue = "") String q,
                           @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                           Model model,
                           HttpServletRequest request) {
        // 조회수 처리
        // 데이터 가져오기
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
//        System.out.println("boardDTO : "+ boardDTO);
        // 첨부된 파일이 있다면 파일을 가져옴
        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTOList);
        }

        List<CommentDTO> commentDTOList = commentService.findAll(id);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        String loginEmail = (String) request.getSession().getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
//        System.out.println("memberDTO : "+memberDTO);
        model.addAttribute("member", memberDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        model.addAttribute("page", page);
        return "/board/boarddetail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "board/boardupdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);

//        System.out.println("boardDTO : "+ boardDTO);
        // 첨부된 파일이 있다면 파일을 가져옴
        if (dto.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTOList = boardService.findFile(dto.getId());
            model.addAttribute("boardFileList", boardFileDTOList);
        }
        return "board/boarddetail";
//        return "redirect:/board?id=" + boardDTO.getId();
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/list";
    }

}

