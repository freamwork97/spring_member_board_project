package com.icia.memberboard.dto;

import lombok.Data;

@Data
public class BoardDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberName;
    private String memberMobile;
    private String memberProfile;
}
