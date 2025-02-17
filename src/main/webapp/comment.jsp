<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comment & Reply System</title>
    <link rel="stylesheet" href="style/comment.css">
</head>
<body>

    <div class="container">
        <h2>Comment & Reply Section</h2>
        <div class="comment-box">
            <input type="text" id="commentInput" placeholder="Write a comment...">
            <button onclick="addComment()">Post</button>
        </div>
        <div class="comments" id="commentsContainer"></div>
    </div>

    <script src="style/comment.js">
    </script>

</body>
</html>