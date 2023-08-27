import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat-subscription"
export default class extends Controller {
  static values = { chatId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {


    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatChannel", id: this.chatIdValue },
      { received: data => this.#insertMessage(data)}
    )


    console.log(`subscribed to chat ${this.chatIdValue}`);

  }

  resetForm(event) {
    event.target.reset()
  }


  #insertMessage(data){
    const currentUserIsSender = this.currentUserIdValue === data.sender_id;
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
    this.messagesTarget.insertAdjacentHTML("beforeend",messageElement);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }
}
