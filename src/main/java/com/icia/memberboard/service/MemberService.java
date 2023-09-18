package com.icia.memberboard.service;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.dto.MemberProfileDTO;
import com.icia.memberboard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

//    public boolean save(MemberDTO memberDTO) throws IOException {
//        if (memberDTO.getProfile().get(0).isEmpty()) {
//            // 파일 없다.
//            memberDTO.setMemberProfile(0);
//            int result = memberRepository.save(memberDTO);
//
//            if (result > 0) {
//                return true;
//            } else {
//                return false;
//            }
//        } else {
//            // 파일 있다.
//            memberDTO.setMemberProfile(1);
//
//            MemberDTO saveMember = memberRepository.save2(memberDTO);
//            System.out.println("getId : "+saveMember.getId());
//
//            // 파일이 여러개 이기 때문에 반복문으로 파일 하나씩 꺼내서 저장 처리
//            for (MultipartFile memberfile : memberDTO.getProfile()) {
//                // 파일만 따로 가져오기
//                // MultipartFile boardFile = boardDTO.getBoardFile();
//                // 파일 이름 가져오기
//                String originalFilename = memberfile.getOriginalFilename();
//                System.out.println("originalFilename = " + originalFilename);
//                // 저장용 이름 만들기
//                System.out.println(System.currentTimeMillis());
//                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
//                System.out.println("storedFileName = " + storedFileName);
//                // BoardFileDTO 세팅
//                MemberProfileDTO memberProfileDTO = new MemberProfileDTO();
//                memberProfileDTO.setOriginalFileName(originalFilename);
//                memberProfileDTO.setStoredFileName(storedFileName);
//                memberProfileDTO.setMemberId(saveMember.getId());
//                System.out.println("getId : "+saveMember.getId());
//                // 파일 저장용 폴더에 파일 저장 처리
//                String savePath = "D:\\spring_img\\" + storedFileName;
//                memberfile.transferTo(new File(savePath));
//                // board_file_table 저장 처리
//                memberRepository.saveFile(memberProfileDTO);
//            }
//        }
//        int result=1;
//        if (result>0) {
//            return true;
//        } else {
//            return false;
//        }
//    }

    public void save(MemberDTO memberDTO) throws IOException {
        /*
            - 파일 있다.
            1. fileAttached=1, board_table에 저장 후 id값 받아오기
            2. 파일원본 이름 가져오기
            3. 저장용 이름 만들기
            4. 파일 저장용 폴더에 파일 저장 처리
            5. board_file_table에 관련 정보 저장

            - 파일 없다.
                fileAttached=0, 나머지는 기존 방식과 동일
         */
        if (memberDTO.getProfile().get(0).isEmpty()) {
            // 파일 없다.
            memberDTO.setMemberProfile(0);
            memberRepository.save(memberDTO);
        } else {
            // 파일 있다.
            memberDTO.setMemberProfile(1);
            // 게시글 저장 후 id값 활용을 위해 리턴 받음.
            MemberDTO saveMember = memberRepository.save(memberDTO);
            System.out.println("getId : " + saveMember.getId());

            // 파일이 여러개 이기 때문에 반복문으로 파일 하나씩 꺼내서 저장 처리
            for (MultipartFile profile : memberDTO.getProfile()) {
                // 파일만 따로 가져오기
                // MultipartFile boardFile = boardDTO.getBoardFile();
                // 파일 이름 가져오기
                String originalFilename = profile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                // 저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // BoardFileDTO 세팅
                MemberProfileDTO memberProfileDTO = new MemberProfileDTO();
                memberProfileDTO.setOriginalFileName(originalFilename);
                memberProfileDTO.setStoredFileName(storedFileName);
                memberProfileDTO.setMemberId(saveMember.getId());
                System.out.println("getId : " + saveMember.getId());

                // 파일 저장용 폴더에 파일 저장 처리
                String savePath = "D:\\spring_img\\" + storedFileName;
                profile.transferTo(new File(savePath));
                // board_file_table 저장 처리
                memberRepository.saveFile(memberProfileDTO);
            }
        }
    }


    public boolean login(MemberDTO memberDTO) {
        /*
            1. 이메일, 비밀번호 두 값 모두 일치하는 db 조회결과를 가져옴(조회결과 있으면 로그인 성공)
            2. 이메일로 DB에서 조회해서 서비스에서 비밀번호를 서로 비교하여 일치하면 로그인 성공
         */
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return memberRepository.findByMemberEmail(memberEmail);
    }

    public List<MemberDTO> list() {
        return memberRepository.list();
    }

    public MemberDTO detail(int id) {
        return memberRepository.detail(id);
    }

    public void delete(int id) {
        memberRepository.delete(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }


}
