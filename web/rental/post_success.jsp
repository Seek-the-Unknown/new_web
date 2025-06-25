<%--
  Created by IntelliJ IDEA.
  User: Lzs
  Date: 2025/4/30
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>发布成功 - 公寓租房网</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Helvetica Neue', Arial, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .success-container {
            background: white;
            border-radius: 8px;
            padding: 40px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }

        .success-icon {
            font-size: 60px;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .success-title {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .success-message {
            margin-bottom: 30px;
            color: #666;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .btn {
            padding: 12px 25px;
            border-radius: 30px;
            font-size: 16px;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-primary {
            background: #0066ff;
            color: white;
        }

        .btn-primary:hover {
            background: #0052cc;
        }

        .btn-secondary {
            background: #f1f1f1;
            color: #333;
        }

        .btn-secondary:hover {
            background: #e1e1e1;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="success-container">
    <div class="success-icon">
        <i class="fas fa-check-circle"></i>
    </div>
    <h2 class="success-title">房源发布成功!</h2>
    <p class="success-message">您的房源已成功提交，我们的团队会尽快审核。审核通过后，您的房源将在平台上展示。</p>

    <div class="action-buttons">
        <a href="index.jsp" class="btn btn-primary">返回首页</a>
        <a href="house_post.jsp" class="btn btn-secondary">继续发布</a>
    </div>
</div>
</body>
</html>