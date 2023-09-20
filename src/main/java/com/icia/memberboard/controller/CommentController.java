package com.icia.memberboard.controller;

import com.icia.memberboard.dto.CommentDTO;
import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.service.CommentService;
import com.icia.memberboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    MemberService memberService;
    @PostMapping("/save")
    public ResponseEntity save(@ModelAttribute CommentDTO commentDTO, HttpServletRequest request) {
//        String loginEmail = (String) request.getSession().getAttribute("loginEmail");
//        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
//        System.out.println("memberDTO : " + memberDTO);
        System.out.println("commentDTO : "+commentDTO);
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }
}