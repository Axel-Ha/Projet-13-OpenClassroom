import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Client, IFrame, IMessage } from '@stomp/stompjs';
import { Observable, tap } from 'rxjs';
import { ChatMessage } from '../interfaces/chat-message';

@Injectable({
  providedIn: 'root'
})
export class ChatService {

  private apiUrl = '/api/messages';
  private client: Client;
  public messages: ChatMessage[] = [];

  constructor(private http: HttpClient) {
    this.client = new Client({ 
      brokerURL: 'ws://localhost:8080/support-chat',
      reconnectDelay: 5000, // Reconnect to the server every 5 seconds if the connection is lost
      heartbeatIncoming: 4000, // Set the heartbeat interval for incoming messages to 4 seconds
      heartbeatOutgoing: 4000, // Set the heartbeat interval for outgoing messages to 4 seconds
      webSocketFactory: () => { 
        return new WebSocket('ws://localhost:8080/support-chat');  
      } 
    });

    this.client.onConnect = (frame: IFrame) => {  
      this.client.subscribe('/topic/messages', (message: IMessage) => {  // Subscribe to the /topic/messages endpoint
        if(message.body) { // Check if the message has a body
          const chatMessage: ChatMessage = JSON.parse(message.body); // Parse the message body
          this.messages.push(chatMessage); // Add the message to the messages array
        } 
      });
    };
 
    this.client.activate(); // Activate the client
  } 

  public sendMessage(content: string, sender: string): void {
    const chatMessage: ChatMessage = { 
      sender,
      content,
      date: new Date()
    };
    this.client.publish({   
      destination: '/app/sendMessage', // Publish the message to the /app/sendMessage endpoint
      body: JSON.stringify(chatMessage) 
    });
  }

  public getMessages(): Observable<ChatMessage[]> { 
    return this.http.get<ChatMessage[]>(this.apiUrl).pipe(  
      tap(savedMessages => { 
        console.log(savedMessages);
        this.messages = savedMessages; 
      })
    );
  }

}
