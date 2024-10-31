package com.yourcaryourway.pocchat.controller;

import com.yourcaryourway.pocchat.domain.dto.ChatMessageDto;
import com.yourcaryourway.pocchat.service.ChatService;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ChatController {

    private final ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
    }

    @MessageMapping("sendMessage")
    @SendTo("/topic/messages")
    public ChatMessageDto sendMessage(@Payload ChatMessageDto chatMessageDto){
        chatService.saveMessage(chatMessageDto);
        return chatMessageDto;
    }

    @GetMapping("/api/messages")
    public List<ChatMessageDto> getAllMessages() {
        return chatService.getAllMessages();
    }
}
