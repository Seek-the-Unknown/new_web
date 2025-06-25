<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="zh-CN">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>发布新房源</title>--%>

<%--    <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;700&display=swap" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">--%>

<%--    <style>--%>
<%--        /* 确保所有元素都使用 border-box 模型 */--%>
<%--        * {--%>
<%--            box-sizing: border-box;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--        }--%>
<%--        body {--%>
<%--            background-color: #f8f9fa;--%>
<%--            font-family: 'Noto Sans SC', sans-serif;--%>
<%--            color: #333;--%>
<%--        }--%>
<%--        .post-container {--%>
<%--            max-width: 800px;--%>
<%--            margin: 40px auto;--%>
<%--            padding: 20px;--%>
<%--        }--%>
<%--        .form-card {--%>
<%--            background-color: #ffffff;--%>
<%--            padding: 40px;--%>
<%--            border-radius: 12px;--%>
<%--            box-shadow: 0 4px 25px rgba(0,0,0,0.08);--%>
<%--        }--%>
<%--        .form-card h1 {--%>
<%--            text-align: center;--%>
<%--            font-size: 2rem;--%>
<%--            margin-bottom: 2.5rem;--%>
<%--            color: #2c3e50;--%>
<%--        }--%>
<%--        .form-group { margin-bottom: 1.5rem; }--%>
<%--        .form-group label { display: block; font-weight: 500; color: #495057; margin-bottom: 0.5rem; }--%>
<%--        .form-group input[type="text"],--%>
<%--        .form-group input[type="number"],--%>
<%--        .form-group textarea {--%>
<%--            width: 100%;--%>
<%--            padding: 12px 15px;--%>
<%--            border: 1px solid #ced4da;--%>
<%--            border-radius: 8px;--%>
<%--            font-size: 1rem;--%>
<%--        }--%>
<%--        .form-grid {--%>
<%--            display: grid;--%>
<%--            grid-template-columns: 1fr 1fr;--%>
<%--            gap: 1.5rem;--%>
<%--        }--%>
<%--        .file-upload-wrapper {--%>
<%--            position: relative;--%>
<%--            border: 1px dashed #007bff;--%>
<%--            padding: 2rem;--%>
<%--            border-radius: 8px;--%>
<%--            text-align: center;--%>
<%--            width: 100%;--%>
<%--            background-color: #f8f9fa;--%>
<%--        }--%>
<%--        .file-upload-wrapper input[type="file"] { display: none; }--%>
<%--        .file-upload-label { color: #007bff; cursor: pointer; font-weight: 500; }--%>
<%--        .file-upload-label i { margin-right: 8px; }--%>
<%--        #file-list { margin-top: 1rem; font-size: 0.9rem; color: #495057; }--%>
<%--        .file-item {--%>
<%--            background-color: #e9ecef;--%>
<%--            padding: 0.5rem 1rem;--%>
<%--            border-radius: 4px;--%>
<%--            margin-bottom: 0.5rem;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--        }--%>
<%--        .file-item i { margin-right: 8px; color: #6c757d; }--%>
<%--        .submit-btn {--%>
<%--            width: 100%;--%>
<%--            padding: 15px;--%>
<%--            font-size: 1.1rem;--%>
<%--            font-weight: 500;--%>
<%--            color: #fff;--%>
<%--            background: linear-gradient(to right, #007bff, #0056b3);--%>
<%--            border: none;--%>
<%--            border-radius: 8px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>
<%--        @media (max-width: 768px) {--%>
<%--            .form-grid {--%>
<%--                grid-template-columns: 1fr;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="post-container">--%>
<%--    <c:if test="${not empty sessionScope.currentUser}">--%>
<%--        <div class="form-card">--%>
<%--            <h1>填写您的房源信息</h1>--%>
<%--            <form action="${pageContext.request.contextPath}/HousePostServlet" method="post" enctype="multipart/form-data">--%>

<%--                <div class="form-group">--%>
<%--                    <label for="title">标题</label>--%>
<%--                    <input type="text" id="title" name="title" required>--%>
<%--                </div>--%>
<%--                <div class="form-grid">--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="houseType">户型</label>--%>
<%--                        <input type="text" id="houseType" name="houseType" placeholder="例如：三室一厅" required>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="city">城市</label>--%>
<%--                        <input type="text" id="city" name="city" placeholder="例如：上海" required>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-grid">--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="price">价格 (元/月)</label>--%>
<%--                        <input type="number" id="price" name="price" required>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="area">面积 (平方米)</label>--%>
<%--                        <input type="number" step="0.01" id="area" name="area" placeholder="例如: 88.88" required>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-grid">--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="bedrooms">卧室数量</label>--%>
<%--                        <input type="number" id="bedrooms" name="bedrooms" value="1" min="1" required>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="bathrooms">卫生间数量</label>--%>
<%--                        <input type="number" id="bathrooms" name="bathrooms" value="1" min="1" required>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="address">详细地址</label>--%>
<%--                    <input type="text" id="address" name="address" required>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="description">详细描述</label>--%>
<%--                    <textarea id="description" name="description" rows="5"></textarea>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label>房源图片 (可多选)</label>--%>
<%--                    <div class="file-upload-wrapper">--%>
<%--                        <label for="images" class="file-upload-label">--%>
<%--                            <i class="fas fa-cloud-upload-alt"></i> 点击选择或拖拽图片到这里--%>
<%--                        </label>--%>
<%--                        <input type="file" id="images" name="images" multiple accept="image/*">--%>
<%--                    </div>--%>
<%--                    <div id="file-list"></div>--%>
<%--                </div>--%>

<%--                <div class="form-group" style="margin-top: 2.5rem;">--%>
<%--                    <button type="submit" class="submit-btn">确认发布</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--</div>--%>

<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', function() {--%>
<%--        const fileInput = document.getElementById('images');--%>
<%--        const fileListContainer = document.getElementById('file-list');--%>

<%--        if (fileInput && fileListContainer) {--%>
<%--            fileInput.addEventListener('change', () => {--%>
<%--                fileListContainer.innerHTML = '';--%>
<%--                if (fileInput.files.length > 0) {--%>
<%--                    for (const file of fileInput.files) {--%>
<%--                        const fileItem = document.createElement('div');--%>
<%--                        fileItem.className = 'file-item';--%>
<%--                        fileItem.innerHTML = `<i class="fas fa-file-image"></i> ${file.name}`;--%>
<%--                        fileListContainer.appendChild(fileItem);--%>
<%--                    }--%>
<%--                }--%>
<%--            });--%>
<%--        } else {--%>
<%--            console.error('无法找到文件上传元素，请检查 ID 是否为 "images" 和 "file-list"');--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布新房源</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { background-color: #f8f9fa; font-family: 'Noto Sans SC', sans-serif; color: #333; }
        .post-container { max-width: 800px; margin: 40px auto; padding: 20px; }
        .form-card { background-color: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 25px rgba(0,0,0,0.08); }
        h1 { text-align: center; font-size: 2rem; margin-bottom: 2.5rem; color: #2c3e50; }
        .form-group { margin-bottom: 1.5rem; }
        label { display: block; font-weight: 500; color: #495057; margin-bottom: 0.5rem; }
        input[type="text"], input[type="number"], textarea { width: 100%; padding: 12px 15px; border: 1px solid #ced4da; border-radius: 8px; font-size: 1rem; }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; }

        /* --- 文件上传区域样式 --- */
        .file-upload-label {
            display: block; /* 使 label 表现得像一个 div */
            border: 2px dashed #007bff;
            padding: 2.5rem;
            border-radius: 8px;
            text-align: center;
            width: 100%;
            background-color: #f8f9fa;
            color: #007bff;
            cursor: pointer;
            font-weight: 500;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .file-upload-label:hover {
            background-color: #e2e6ea;
            border-color: #0056b3;
        }
        .file-upload-label i { margin-right: 8px; }

        /* 彻底隐藏原生 input[type=file] */
        #images { display: none; }

        /* ===== 新增：文件列表和删除按钮样式 ===== */
        #file-list {
            margin-top: 1rem;
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }
        .file-item {
            background-color: #f0f8ff;
            border: 1px solid #cce6ff;
            border-radius: 8px;
            padding: 10px 15px;
            width: calc(50% - 6px);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .file-info {
            display: flex;
            align-items: center;
            overflow: hidden;
        }
        .file-info i {
            margin-right: 10px;
            color: #3498db;
        }
        .file-name {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 160px;
        }
        .delete-btn {
            background: none;
            border: none;
            color: #e74c3c;
            cursor: pointer;
            font-size: 16px;
            transition: color 0.2s;
            margin-left: 10px;
            padding: 5px;
        }
        .delete-btn:hover {
            color: #c0392b;
        }
        .file-status {
            font-size: 0.9rem;
            margin-top: 8px;
            color: #6c757d;
        }

        .submit-btn {
            width: 100%;
            padding: 15px;
            font-size: 1.1rem;
            color: #fff;
            background: #007bff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .submit-btn:hover {
            background: #0069d9;
        }

        @media (max-width: 768px) {
            .form-grid { grid-template-columns: 1fr; }
            .file-item { width: 100%; }
        }
    </style>
</head>
<body>

<div class="post-container">
    <c:if test="${not empty sessionScope.currentUser}">
        <div class="form-card">
            <h1>填写您的房源信息</h1>
            <form action="${pageContext.request.contextPath}/HousePostServlet" method="post" enctype="multipart/form-data">

                    <%-- 表单字段... --%>
                <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" id="title" name="title" required>
                </div>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="houseType">户型</label>
                        <input type="text" id="houseType" name="houseType" placeholder="例如：三室一厅" required>
                    </div>
                    <div class="form-group">
                        <label for="city">城市</label>
                        <input type="text" id="city" name="city" placeholder="例如：上海" required>
                    </div>
                </div>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="price">价格 (元/月)</label>
                        <input type="number" id="price" name="price" required>
                    </div>
                    <div class="form-group">
                        <label for="area">面积 (平方米)</label>
                        <input type="number" step="0.01" id="area" name="area" placeholder="例如: 88.88" required>
                    </div>
                </div>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="bedrooms">卧室数量</label>
                        <input type="number" id="bedrooms" name="bedrooms" value="1" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="bathrooms">卫生间数量</label>
                        <input type="number" id="bathrooms" name="bathrooms" value="1" min="1" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address">详细地址</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div class="form-group">
                    <label for="description">详细描述</label>
                    <textarea id="description" name="description" rows="5"></textarea>
                </div>


                    <%-- 图片上传区域HTML结构 --%>
                <div class="form-group">
                    <label>房源图片 (可多选)</label>

                    <label for="images" class="file-upload-label">
                        <i class="fas fa-cloud-upload-alt"></i> 点击选择或拖拽图片到这里
                    </label>

                    <input type="file" id="images" name="images" multiple accept="image/*">

                        <%-- 文件列表容器 --%>
                    <div id="file-list"></div>

                        <%-- 状态提示 --%>
                    <div id="file-status" class="file-status"></div>
                </div>

                <div class="form-group" style="margin-top: 2.5rem;">
                    <button type="submit" class="submit-btn">确认发布</button>
                </div>
            </form>
        </div>
    </c:if>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const fileInput = document.getElementById('images');
        const fileListContainer = document.getElementById('file-list');
        const fileStatus = document.getElementById('file-status');

        // 存储已选择文件的数组
        let filesArray = [];

        // 文件输入变化处理
        if (fileInput && fileListContainer) {
            fileInput.addEventListener('change', (event) => {
                // 清除之前的错误状态
                fileStatus.textContent = '';

                const selectedFiles = Array.from(event.target.files);

                // 检查文件数量和类型
                const validFiles = selectedFiles.filter(file => {
                    return file.type.match('image.*') && file.size <= 5 * 1024 * 1024; // 5MB限制
                });

                // 处理无效文件
                if (validFiles.length < selectedFiles.length) {
                    const invalidCount = selectedFiles.length - validFiles.length;
                    fileStatus.textContent = `⚠️ 已忽略 ${invalidCount} 个无效文件（仅支持图片格式且小于5MB）`;
                }

                // 添加新文件到数组
                filesArray = [...filesArray, ...validFiles];

                // 显示文件列表
                renderFileList();
            });
        }

        // 渲染文件列表函数
        function renderFileList() {
            fileListContainer.innerHTML = '';

            // 添加状态提示
            fileStatus.textContent = `已选择 ${filesArray.length} 个文件`;

            // 渲染每个文件项
            filesArray.forEach((file, index) => {
                const fileItem = document.createElement('div');
                fileItem.className = 'file-item';
                fileItem.innerHTML = `
                <div class="file-info">
                    <i class="fas fa-file-image"></i>
                    <span class="file-name" title="${file.name}">${file.name}</span>
                </div>
                <button type="button" class="delete-btn" data-index="${index}">
                    <i class="fas fa-trash-alt"></i>
                </button>
            `;
                fileListContainer.appendChild(fileItem);
            });

            // 添加删除事件监听器
            document.querySelectorAll('.delete-btn').forEach(button => {
                button.addEventListener('click', function() {
                    const index = parseInt(this.getAttribute('data-index'));
                    removeFile(index);
                });
            });
        }

        // 删除文件函数
        function removeFile(index) {
            filesArray.splice(index, 1);
            renderFileList();
        }

        // 拖放功能
        const dropArea = document.querySelector('.file-upload-label');

        // 防止默认拖放行为
        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, preventDefaults, false);
        });

        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }

        // 拖放区域高亮效果
        ['dragenter', 'dragover'].forEach(eventName => {
            dropArea.addEventListener(eventName, highlight, false);
        });

        ['dragleave', 'drop'].forEach(eventName => {
            dropArea.addEventListener(eventName, unhighlight, false);
        });

        function highlight() {
            dropArea.style.borderColor = '#28a745';
            dropArea.style.backgroundColor = '#e8f4ec';
        }

        function unhighlight() {
            dropArea.style.borderColor = '#007bff';
            dropArea.style.backgroundColor = '#f8f9fa';
        }

        // 处理文件拖放
        dropArea.addEventListener('drop', handleDrop, false);

        function handleDrop(e) {
            const dt = e.dataTransfer;
            const files = dt.files;

            if (files.length) {
                fileInput.files = files;

                // 手动触发change事件
                const event = new Event('change');
                fileInput.dispatchEvent(event);
            }
        }
    });
</script>

</body>
</html>