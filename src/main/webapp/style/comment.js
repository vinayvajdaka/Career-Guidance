let comments = JSON.parse(localStorage.getItem("comments")) || [];
let container = document.querySelector(".container");

function addComment() {
    let commentText = document.getElementById("commentInput").value;
    if (commentText.trim() === "") return;

    let comment = { id: Date.now(), text: commentText, replies: [] };
    comments.push(comment);
    document.getElementById("commentInput").value = "";
    saveData();
    renderComments();
}

function addReply(commentId) {
    let replyInput = document.getElementById(replyInput-${commentId});
    let replyText = replyInput.value;
    if (replyText.trim() === "") return;

    let comment = comments.find(c => c.id === commentId);
    if (comment) {
        // Prevent replying to itself
        if (replyText === comment.text) {
            alert("You cannot reply to your own comment!");
            return;
        }
        comment.replies.push({ id: Date.now(), text: replyText });
        saveData();
    }

    replyInput.value = "";
    renderComments();
}

function renderComments() {
    let commentsContainer = document.getElementById("commentsContainer");
    commentsContainer.innerHTML = "";

    comments.forEach(comment => {
        let commentDiv = document.createElement("div");
        commentDiv.classList.add("comment");

        let commentHTML = `
            <p>${comment.text}</p>
            <button class="reply-btn" onclick="toggleReplyBox(${comment.id})">Reply</button>
            <div class="reply-box" id="replyBox-${comment.id}" style="display: none;">
                <input type="text" id="replyInput-${comment.id}" placeholder="Write a reply...">
                <button onclick="addReply(${comment.id})">Reply</button>
            </div>
            <div class="replies">
                ${comment.replies.map(reply => <p>↳ ${reply.text}</p>).join('')}
            </div>
        `;

        commentDiv.innerHTML = commentHTML;
        commentsContainer.appendChild(commentDiv);
    });
}

function toggleReplyBox(commentId) {
    let replyBox = document.getElementById(replyBox-${commentId});
    replyBox.style.display = replyBox.style.display === "none" ? "flex" : "none";
}

function saveData() {
    localStorage.setItem("comments", JSON.stringify(comments));
}

function loadData() {
    comments = JSON.parse(localStorage.getItem("comments")) || [];
    renderComments();
}

// Load stored comments on page load
loadData();