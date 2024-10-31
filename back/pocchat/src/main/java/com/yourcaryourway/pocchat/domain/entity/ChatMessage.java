package com.yourcaryourway.pocchat.domain.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ChatMessage {
    private String content;
    private String sender;
    private LocalDateTime date;
}
