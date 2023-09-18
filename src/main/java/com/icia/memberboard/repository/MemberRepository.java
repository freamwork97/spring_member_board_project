package com.icia.memberboard.repository;

import com.icia.memberboard.dto.MemberDTO;
import com.icia.memberboard.dto.MemberProfileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

//    public int save(MemberDTO memberDTO) {
//        return sql.insert("Member.save", memberDTO);
//    }
    public MemberDTO save(MemberDTO memberDTO) {
        System.out.println("insert 전 memberDTO = " + memberDTO);
        sql.insert("Member.save", memberDTO);
        System.out.println("insert 후 memberDTO = " + memberDTO);

        return memberDTO;
    }

    public void saveFile(MemberProfileDTO memberProfileDTO) {
        sql.insert("Member.saveFile", memberProfileDTO);
//        System.out.println("member id : "+memberProfileDTO.getMemberId());
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return sql.selectOne("Member.findByEmail", memberEmail);
    }

    public List<MemberDTO> list() {
        return sql.selectList("Member.list");
    }

    public MemberDTO detail(Long id) {
        return sql.selectOne("Member.detail", id);
    }
    public List<MemberProfileDTO> findFile(Long memberId) {
        return sql.selectList("Member.findFile", memberId);
    }


    public void delete(int id) {
        sql.delete("Member.delete", id);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }


}
