package com.icia.memberboard.dto;

import lombok.Data;

@Data
public class MemberProfileDTO {
    private Long id;
    private Long memberId;
    private String originalFileName;
    private String storedFileName;
}
