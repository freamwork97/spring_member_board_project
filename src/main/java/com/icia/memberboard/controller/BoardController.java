package com.icia.memberboard.controller;

import com.icia.memberboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
}
