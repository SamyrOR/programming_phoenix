import Player from "./player.js";

let Video = {
  init(socket, element) {
    if (!element) {
      return;
    }
    let playerId = element.getAttribute("data-player_id");
    let videoId = element.getAttribute("data-id");
    socket.connect();
    Player.init(element.id, playerId, () => {
      this.onReady(videoId, socket);
    });
  },

  onReady(videoId, socket) {
    let msgContainer = document.getElementById("msg-container");
    let msgInput = document.getElementById("msg-input");
    let postButton = document.getElementById("msg-submit");
    let lastSeenId = 0;
    let vidChannel = socket.channel("videos:" + videoId, () => {
      return { last_seend_id: lastSeenId };
    });
    postButton.addEventListener("click", (e) => {
      let payload = { body: msgInput.value, at: Player.getCurrentTime() };
      vidChannel
        .push("new_annotation", payload)
        .receive("error", (e) => console.log(e));
      msgInput.value = "";
    });
    msgContainer.addEventListener("click", (e) => {
      e.preventDefault();
      let seconds =
        e.target.getAttribute("data-seek") ||
        e.target.parentNoed.getAttribute("data-seek");
      if (!seconds) {
        return;
      }
      Player.seekTo(seconds);
    });

    vidChannel.on("new_annotation", (resp) => {
      this.renderAnnotation(msgContainer, resp);
    });
    vidChannel
      .join()
      // .receive("ok", (resp) => console.log("joined the video channel", resp))
      .receive("ok", ({ annotations }) => {
        this.scheduleMessages(msgContainer, annotations);
      })
      .receive("error", (reason) => console.log("join failed", reason));
  },
  esc(str) {
    let div = document.createElement("div");
    div.appendChild(document.createTextNode(str));
    return div.innerHTML;
  },

  renderAnnotation(msgContainer, { user, body, at }) {
    let template = document.createElement("div");
    template.innerHTML = `
    <a href="#" data-seek="${this.esc(at)}">
      [${this.formatTime(at)}]
      <b>${this.esc(user.username)}</b>: ${this.esc(body)}
    </a>
    `;
    msgContainer.appendChild(template);
    msgContainer.scrollTop = msgContainer.scrollHeight;
  },

  scheduleMessages(msgContainer, annotations) {
    clearTimeout(this.schedulerTimer);
    this.scheduleTimer = setTimeout(() => {
      let currentTime = Player.getCurrentTime();
      let remaining = this.renderAtTime(annotations, currentTime, msgContainer);
      this.scheduleMessages(msgContainer, remaining);
    }, 1000);
  },

  renderAtTime(annotations, seconds, msgContainer) {
    return annotations.filter((annotation) => {
      if (annotation.at > seconds) {
        return true;
      }
      this.renderAnnotation(msgContainer, annotation);
      return false;
    });
  },

  formatTime(at) {
    let date = new Date(null);
    date.setSeconds(at / 1000);
    return date.toISOString().substr(14, 5);
  },
};
export default Video;
