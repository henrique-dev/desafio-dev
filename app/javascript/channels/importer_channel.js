import consumer from "channels/consumer";

consumer.subscriptions.create("ImporterChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const tr = document.getElementById(`tr_importer_${data.importer.id}`);

    if (tr) {
      const tdState = tr.getElementsByClassName("state")[0];

      if (!tdState) return;

      tdState.textContent = data.importer.state;
    }

    const notification = document.getElementById("notification");

    if (!notification) return;

    notification.style.display = "flex";

    const span = notification.getElementsByTagName("span")[0];
    if (span) {
      span.textContent = `The import #${data.importer.id} has been completed`;
    }

    const button = notification.getElementsByTagName("button")[0];
    if (button) {
      button.onclick = () => {
        notification.style.display = "none";
      };
    }

    // const newLogTr = document.createElement("tr");
    // newLogTr.classList = "border-b border-gray-200 hover:bg-gray-100";

    // const newLogTd = document.createElement("td");
    // newLogTd.classList = `px-4 py-2 text-${data.color}-600`;
    // newLogTd.textContent = data.message;

    // newLogTr.appendChild(newLogTd);

    // logsTbody.prepend(newLogTr);
  },
});
