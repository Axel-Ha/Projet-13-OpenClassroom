package com.yourcaryourway.pocchat.service;

import com.yourcaryourway.pocchat.domain.dto.ChatMessageDto;
import com.yourcaryourway.pocchat.domain.entity.ChatMessage;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ChatService {
    private final List<ChatMessage> listChatMessages = new ArrayList<>();
    
    public void saveMessage(ChatMessageDto chatMessageDto) {
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setContent(chatMessageDto.getContent());
        chatMessage.setSender(chatMessageDto.getSender());
        chatMessage.setDate(LocalDateTime.now());
        listChatMessages.add(chatMessage);
    }

    public List<ChatMessageDto> getAllMessages() {
        List<ChatMessageDto> chatMessageDtos = new ArrayList<>();
        for(ChatMessage message : listChatMessages){
            chatMessageDtos.add(new ChatMessageDto(message.getContent(), message.getSender(), message.getDate()));
        }
        return chatMessageDtos;
    }
}
