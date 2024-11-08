import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ChatMessage } from '../../interfaces/chat-message';
import { ChatService } from '../../services/chat.service';

@Component({
  selector: 'app-chat-component',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './chat.component.html',
  styleUrls: ['./chat.component.scss'],
})
export class ChatComponent implements OnInit {

  public messages: ChatMessage[] = [];
  public content: string = '';
  public sender: string = 'Client';

  constructor(
    private chatService: ChatService,
    private route: ActivatedRoute
  ) {
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      this.sender = params.get('role') || 'Client';
    })

    this.chatService.getMessages().subscribe(savedMessages => {
      this.messages = savedMessages
    });
  }

  public sendMessage(): void {
    if(this.content.trim()) { 
      this.chatService.sendMessage(this.content, this.sender);
      this.content = '';
    }
  }

}
