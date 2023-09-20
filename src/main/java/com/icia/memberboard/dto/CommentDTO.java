package com.icia.memberboard.dto;

import lombok.Data;

@Data
public class CommentDTO {
    private Long id;
    private Long boardId;
    private Long memberId;
    private String commentWriter;
    private String commentContents;
    private String createdAt;
}
