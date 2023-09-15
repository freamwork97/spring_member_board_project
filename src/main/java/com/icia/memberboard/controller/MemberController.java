package com.icia.memberboard.controller;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String save() {
        return "page/membersave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean result = memberService.save(memberDTO);
        if (result) {
            return "page/login";
        } else {
            return "page/membersave";
        }
    }

    @GetMapping("/login")
    public String login() {
        return "page/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            // 로그인 성공시 사용자의 이메일을 세션에 저장
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            // model.addAttribute("member", memberDTO); // x
            // 모델에 이메일 저장
            model.addAttribute("email", memberDTO.getMemberEmail());
            return "redirect:/";
        } else {
            return "page/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 아래 방법중 하나만 사용
        // 해당 파라미터만 없앨 경우
        session.removeAttribute("loginEmail");
        // 세션 전체를 없앨 경우
//        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/duplicate-check")
    public ResponseEntity duplicateCheck(@RequestParam("memberEmail") String memberEmail) {
        MemberDTO memberDTO = memberService.findByMemberEmail(memberEmail);
        if (memberDTO == null) {
            return new ResponseEntity<>(HttpStatus.OK); // http status code 200
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    @GetMapping("/members")
    public String list(Model model) { // 가져갈게 있을 때 Model사용
        List<MemberDTO> memberDTOList = memberService.list();
        System.out.println("memberList = " + memberDTOList);
        model.addAttribute("memberList", memberDTOList); // 화면에 가져갈 데이터
        return "page/memberlist"; // 브라우저에 출력할 jsp 파일 이름
    }

    @GetMapping("/member")
    public String detail(@RequestParam("id") int id, Model model) {
        MemberDTO memberDTO = memberService.detail(id);
        System.out.println(id);
        model.addAttribute("member", memberDTO);
        return "page/memberdetail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        memberService.delete(id);
        return "redirect:/members";
    }

}
