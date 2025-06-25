<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>修改房源信息</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; margin: 2em; background-color: #f4f4f9; }
        .form-container { max-width: 800px; margin: auto; padding: 2em; border: 1px solid #ccc; border-radius: 8px; background-color: #fff; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 1.5em; }
        label { display: block; margin-bottom: .5em; font-weight: 600; }
        input[type="text"], input[type="number"], textarea, input[type="file"] { width: 100%; padding: .8em; border: 1px solid #ccc; border-radius: 4px; }
        input[type="submit"] { padding: .8em 1.5em; background-color: #28a745; color: white; border: none; cursor: pointer; border-radius: 4px; font-size: 1em; }
        .current-images { margin-top: 1em; }
        .image-preview { display: inline-block; margin: 10px; text-align: center; }
        .image-preview img { max-width: 150px; max-height: 150px; border: 1px solid #ddd; padding: 5px; border-radius: 4px; }
        .image-preview label { font-size: 0.9em; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>修改房源信息</h2>
    <%-- 必须添加 enctype="multipart/form-data" 才能上传文件 --%>
    <form action="${pageContext.request.contextPath}/user/editHouse" method="post" enctype="multipart/form-data">
        <input type="hidden" name="houseId" value="${house.id}">

        <%-- 基本信息表单 --%>
        <div class="form-group">
            <label for="title">标题:</label>
            <input type="text" id="title" name="title" value="${house.title}" required>
        </div>
        <%-- ... 您可以在此添加其他文本字段，如价格、地址等 ... --%>
        <div class="form-group">
            <label for="description">描述:</label>
            <textarea id="description" name="description" rows="5">${house.description}</textarea>
        </div>

        <hr>

        <%-- 当前图片管理 --%>
        <div class="form-group">
            <label>当前图片 (勾选表示要删除):</label>
            <div class="current-images">
                <c:if test="${not empty house.imagePaths}">
                    <c:forEach var="imgPath" items="${fn:split(house.imagePaths, ',')}">
                        <div class="image-preview">
                                <%-- 注意：图片路径需要正确配置才能显示 --%>
                            <img src="${pageContext.request.contextPath}/${imgPath}" alt="房源图片">
                            <br>
                            <input type="checkbox" name="deleteImages" value="${imgPath}" id="img_${fn:replace(imgPath, '.', '_')}">
                            <label for="img_${fn:replace(imgPath, '.', '_')}">删除</label>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${empty house.imagePaths}">
                    <p>暂无图片</p>
                </c:if>
            </div>
        </div>

        <%-- 上传新图片 --%>
        <div class="form-group">
            <label for="newImages">上传新图片 (可多选):</label>
            <input type="file" id="newImages" name="newImages" multiple>
        </div>

        <input type="submit" value="保存全部更改">
    </form>
    <c:if test="${not empty error}">
        <p style="color:red; margin-top: 1em;">${error}</p>
    </c:if>
</div>
</body>
</html>