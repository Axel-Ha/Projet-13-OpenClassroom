package com.yourcaryourway.pocchat.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
public class ChatMessageDto {
    private String content;
    private String sender;
    private LocalDateTime date;
}
