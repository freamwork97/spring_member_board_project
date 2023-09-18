package com.icia.memberboard.controller;

import com.icia.memberboard.dto.BoardDTO;
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
    public String list() {


        return "/board/boardlist";
    }
}
