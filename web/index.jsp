<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--    <title>用户登录</title>--%>
<%--    <style>--%>
<%--        /* 全局重置 */--%>
<%--        * { box-sizing: border-box; margin: 0; padding: 0; }--%>
<%--        body {--%>
<%--            font-family: 'Helvetica Neue', Arial, sans-serif;--%>
<%--            background: linear-gradient(135deg, #6B73FF 0%, #ff9900 100%);--%>
<%--            display: flex; align-items: center; justify-content: center;--%>
<%--            height: 100vh;--%>
<%--        }--%>
<%--        .login-card {--%>
<%--            background: #fff;--%>
<%--            padding: 2rem;--%>
<%--            border-radius: 1rem;--%>
<%--            box-shadow: 0 10px 30px rgba(0,0,0,0.1);--%>
<%--            width: 100%; max-width: 400px;--%>
<%--        }--%>
<%--        .login-card h1 {--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 1.5rem;--%>
<%--            color: #333;--%>
<%--            font-size: 1.75rem;--%>
<%--        }--%>
<%--        .input-group { margin-bottom: 1rem; }--%>
<%--        .input-group label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 0.5rem;--%>
<%--            color: #555;--%>
<%--            font-size: 0.9rem;--%>
<%--        }--%>
<%--        .input-group input {--%>
<%--            width: 100%;--%>
<%--            padding: 0.75rem 1rem;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 0.5rem;--%>
<%--            font-size: 1rem;--%>
<%--            transition: border-color 0.3s;--%>
<%--        }--%>
<%--        .input-group input:focus { border-color: #6B73FF; outline: none; }--%>
<%--        .remember-me {--%>
<%--            display: flex; align-items: center;--%>
<%--            margin-bottom: 1rem;--%>
<%--        }--%>
<%--        .remember-me input { margin-right: 0.5rem; }--%>
<%--        .captcha-group { display: flex; align-items: center; }--%>
<%--        .captcha-group input { flex: 1; }--%>
<%--        .captcha-group img {--%>
<%--            margin-left: 0.5rem;--%>
<%--            height: 40px;--%>
<%--            cursor: pointer;--%>
<%--            border-radius: 0.5rem;--%>
<%--        }--%>
<%--        .captcha-group .reload {--%>
<%--            margin-left: 0.5rem;--%>
<%--            font-size: 0.9rem;--%>
<%--            color: #6B73FF;--%>
<%--            text-decoration: none;--%>
<%--        }--%>
<%--        .login-btn {--%>
<%--            width: 100%;--%>
<%--            padding: 0.75rem;--%>
<%--            background: #6B73FF;--%>
<%--            color: #fff;--%>
<%--            border: none;--%>
<%--            border-radius: 0.5rem;--%>
<%--            font-size: 1rem;--%>
<%--            cursor: pointer;--%>
<%--            transition: background 0.3s;--%>
<%--        }--%>
<%--        .login-btn:hover { background: #5A63E5; }--%>
<%--        .links {--%>
<%--            display: flex; justify-content: space-between;--%>
<%--            margin-top: 1rem;--%>
<%--        }--%>
<%--        .links a {--%>
<%--            color: #6B73FF;--%>
<%--            font-size: 0.85rem;--%>
<%--            text-decoration: none;--%>
<%--        }--%>
<%--        .links a:hover { text-decoration: underline; }--%>
<%--    </style>--%>
<%--    <script>--%>
<%--        function reloadCaptcha() {--%>
<%--            document.getElementById('captchaImg').src =--%>
<%--                '${pageContext.request.contextPath}/image?d=' + Date.now();--%>
<%--        }--%>
<%--        function checkCaptchaForm(form) {--%>
<%--            if (!form.checkcode.value.trim()) {--%>
<%--                alert('请输入验证码');--%>
<%--                form.checkcode.focus();--%>
<%--                return false;--%>
<%--            }--%>
<%--            return true;--%>
<%--        }--%>
<%--        window.onload = function() {--%>
<%--            var err = '${error}';--%>
<%--            if (err && err.indexOf('验证码') !== -1) {--%>
<%--                alert(err);--%>
<%--                reloadCaptcha();--%>
<%--            }--%>
<%--        };--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="login-card">--%>
<%--    <h1>欢迎登录</h1>--%>
<%--    <form action="${pageContext.request.contextPath}/Lzs_login"--%>
<%--          method="post"--%>
<%--          onsubmit="return checkCaptchaForm(this)">--%>

<%--        <div class="input-group">--%>
<%--            <label for="username">用户名</label>--%>
<%--            <input id="username" type="text" name="username"--%>
<%--                   placeholder="请输入用户名" required />--%>
<%--        </div>--%>

<%--        <div class="input-group">--%>
<%--            <label for="password">密码</label>--%>
<%--            <input id="password" type="password" name="password"--%>
<%--                   placeholder="请输入密码" required />--%>
<%--        </div>--%>

<%--        <div class="remember-me">--%>
<%--            <input type="checkbox" name="rememberMe" id="rememberMe" />--%>
<%--            <label for="rememberMe">记住我</label>--%>
<%--        </div>--%>

<%--        <div class="input-group captcha-group">--%>
<%--            <input type="text" name="checkcode" maxlength="4"--%>
<%--                   placeholder="验证码" />--%>
<%--            <img id="captchaImg"--%>
<%--                 src="${pageContext.request.contextPath}/image?d=${pageContext.session.id}"--%>
<%--                 alt="验证码"--%>
<%--                 onclick="reloadCaptcha()"--%>
<%--                 title="点击换一张" />--%>
<%--            <a href="javascript:reloadCaptcha()" class="reload">换一张</a>--%>
<%--        </div>--%>

<%--        <button type="submit" class="login-btn">登 录</button>--%>

<%--        <div class="links">--%>
<%--            <a href="${pageContext.request.contextPath}/register.jsp">注册账号</a>--%>
<%--            <a href="${pageContext.request.contextPath}/forgotPassword.jsp">忘记密码？</a>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%--&lt;%&ndash;${pageContext.request.contextPath}&ndash;%&gt;--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <!-- Icon Library for Copy Icon and Password Toggle -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* --- CSS Reset & Global Styles --- */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --primary-color: #6366F1; /* Indigo */
            --primary-hover-color: #4F46E5;
            --light-gray-color: #F9FAFB; /* Lighter gray for a cleaner look */
            --medium-gray-color: #D1D5DB;
            --dark-gray-color: #4B5563;
            --text-color: #1F2937;
            --card-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --success-color: #10B981;
        }

        body {
            font-family: 'Inter', 'Helvetica Neue', Arial, sans-serif;
            background-color: var(--light-gray-color);
            background: linear-gradient(-45deg, #eef2ff, #f9fafb, #e0e7ff);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: var(--text-color);
            overflow: hidden;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* --- Login Card --- */
        .login-card {
            position: relative;
            z-index: 2;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 2.5rem;
            border-radius: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: var(--card-shadow);
            width: 100%;
            max-width: 420px;
            animation: fade-in 0.5s ease-out;
        }

        @keyframes fade-in {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-card h1 {
            text-align: center;
            margin-bottom: 2rem;
            color: var(--text-color);
            font-size: 1.8rem;
            font-weight: 600;
        }

        /* --- Input & Form Elements --- */
        .input-group { margin-bottom: 1.25rem; }

        .input-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--dark-gray-color);
            font-size: 0.875rem;
            font-weight: 500;
        }

        .input-group input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid var(--medium-gray-color);
            border-radius: 0.5rem;
            font-size: 1rem;
            background-color: #fff;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .input-group input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px color-mix(in srgb, var(--primary-color) 20%, transparent);
        }

        /* --- Password Input with Toggle --- */
        .password-wrapper {
            position: relative;
        }

        #password {
            padding-right: 3rem; /* Make space for the icon */
        }

        .password-toggle-btn {
            position: absolute;
            top: 50%;
            right: 0.5rem;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            padding: 0.5rem;
            color: var(--dark-gray-color);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .password-toggle-btn:hover {
            color: var(--primary-color);
        }


        /* --- Remember Me & Links --- */
        .options-grid {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .remember-me {
            display: flex;
            align-items: center;
            user-select: none;
        }

        .remember-me label {
            color: var(--dark-gray-color);
            font-size: 0.9rem;
            cursor: pointer;
        }

        .remember-me input[type="checkbox"] {
            appearance: none; -webkit-appearance: none;
            height: 1.25em; width: 1.25em;
            background-color: #fff;
            border: 1px solid var(--medium-gray-color);
            border-radius: 0.25rem;
            margin-right: 0.6rem;
            cursor: pointer;
            display: grid; place-content: center;
            transition: all 0.2s;
        }
        .remember-me input[type="checkbox"]:focus { box-shadow: 0 0 0 3px color-mix(in srgb, var(--primary-color) 20%, transparent); }
        .remember-me input[type="checkbox"]::before {
            content: ''; width: 0.75em; height: 0.75em;
            transform: scale(0);
            transition: 120ms transform ease-in-out;
            box-shadow: inset 1em 1em var(--primary-color);
            clip-path: polygon(14% 44%, 0 65%, 50% 100%, 100% 16%, 80% 0%, 43% 62%);
        }
        .remember-me input[type="checkbox"]:checked { background-color: var(--primary-color); border-color: var(--primary-color); }
        .remember-me input[type="checkbox"]:checked::before { transform: scale(1); box-shadow: inset 1em 1em #fff; }

        .links a, .gemini-tool-btn {
            color: var(--primary-color);
            font-size: 0.875rem;
            text-decoration: none;
            font-weight: 500;
        }
        .links a:hover, .gemini-tool-btn:hover { text-decoration: underline; color: var(--primary-hover-color); }

        /* --- Captcha --- */
        .captcha-group { display: flex; align-items: center; gap: 0.75rem; }
        .captcha-group input { flex-grow: 1; }
        .captcha-group img { height: 45px; cursor: pointer; border-radius: 0.5rem; border: 1px solid var(--medium-gray-color); }
        .captcha-group .reload { font-size: 0.875rem; color: var(--primary-color); text-decoration: none; font-weight: 500; transition: color 0.2s; }
        .captcha-group .reload:hover { color: var(--primary-hover-color); text-decoration: underline; }

        /* --- Buttons --- */
        .login-btn {
            width: 100%; padding: 0.8rem; background: var(--primary-color);
            color: #fff; border: none; border-radius: 0.5rem;
            font-size: 1rem; font-weight: 600; cursor: pointer;
            transition: background-color 0.2s, transform 0.2s, box-shadow 0.2s;
            margin-top: 0.5rem;
        }
        .login-btn:hover { background: var(--primary-hover-color); box-shadow: var(--card-shadow); transform: translateY(-2px); }
        .login-btn:active { transform: translateY(-1px); }

        .gemini-tool-btn {
            background: none;
            border: none;
            cursor: pointer;
            padding: 0;
        }

        /* --- Footer Links --- */
        .footer-links { text-align: center; margin-top: 1.5rem; }

        /* --- Gemini Password Suggester Modal --- */
        .modal-overlay {
            position: fixed; top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            display: flex; align-items: center; justify-content: center;
            z-index: 1000;
            opacity: 0; visibility: hidden;
            transition: opacity 0.3s, visibility 0.3s;
        }
        .modal-overlay.visible { opacity: 1; visibility: visible; }
        .modal {
            background: #fff; padding: 2rem; border-radius: 1rem;
            box-shadow: var(--card-shadow);
            width: 90%; max-width: 480px;
            transform: scale(0.95);
            transition: transform 0.3s;
        }
        .modal-overlay.visible .modal { transform: scale(1); }
        .modal-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem; }
        .modal-header h2 { font-size: 1.25rem; }
        .close-modal-btn { background: none; border: none; font-size: 1.5rem; cursor: pointer; color: var(--dark-gray-color); }

        .modal-body .loading, .modal-body .result { min-height: 80px; display: flex; align-items: center; justify-content: center; }
        .loading-spinner { border: 4px solid var(--light-gray-color); border-top: 4px solid var(--primary-color); border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite; }
        @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }

        .password-display {
            display: flex; align-items: center; justify-content: space-between;
            background: var(--light-gray-color);
            padding: 1rem; border-radius: 0.5rem;
            word-break: break-all;
        }
        .password-text { font-family: monospace; font-size: 1.1rem; font-weight: 600; }
        .copy-btn {
            background: none; border: none; cursor: pointer;
            color: var(--dark-gray-color); font-size: 1.2rem;
            margin-left: 1rem; transition: color 0.2s;
        }
        .copy-btn:hover { color: var(--primary-color); }
        .copy-success { font-size: 0.8rem; color: var(--success-color); margin-top: 0.5rem; text-align: center; opacity: 0; transition: opacity 0.3s;}
    </style>
</head>
<body>
<div class="login-card">
    <h1>欢迎登录</h1>
    <form action="${pageContext.request.contextPath}/Lzs_login"
          method="post"
          onsubmit="return checkCaptchaForm(this)">

        <div class="input-group">
            <label for="username">用户名</label>
            <input id="username" type="text" name="username" placeholder="请输入用户名" required />
        </div>

        <div class="input-group">
            <label for="password">密码</label>
            <!-- New wrapper for password input and toggle button -->
            <div class="password-wrapper">
                <input id="password" type="password" name="password" placeholder="请输入密码" required />
                <button type="button" class="password-toggle-btn" id="togglePasswordBtn">
                    <i class="fa-regular fa-eye"></i>
                </button>
            </div>
        </div>

        <div class="options-grid">
            <div class="remember-me">
                <input type="checkbox" name="rememberMe" id="rememberMe" />
                <label for="rememberMe">记住我</label>
            </div>
            <div class="links">
                <a href="${pageContext.request.contextPath}/forgotPassword.jsp">忘记密码？</a>
            </div>
        </div>

        <div class="input-group">
            <label for="checkcode">验证码</label>
            <div class="captcha-group">
                <input id="checkcode" type="text" name="checkcode" maxlength="4" placeholder="验证码" />
                <img id="captchaImg" src="${pageContext.request.contextPath}/image?d=${pageContext.session.id}" alt="验证码" onclick="reloadCaptcha()" title="点击换一张" />
                <a href="javascript:reloadCaptcha()" class="reload">换一张</a>
            </div>
        </div>

        <button type="submit" class="login-btn">登 录</button>

        <div class="footer-links">
            <a href="${pageContext.request.contextPath}/register.jsp">注册账号</a>
            <span style="margin: 0 10px;">|</span>
            <button type="button" class="gemini-tool-btn" id="suggestPasswordBtn">
                <i class="fa-solid fa-wand-magic-sparkles"></i> 密码建议
            </button>
        </div>
    </form>
</div>

<!-- Gemini API Password Suggester Modal -->
<div class="modal-overlay" id="passwordModal">
    <div class="modal">
        <div class="modal-header">
            <h2>安全密码建议</h2>
            <button class="close-modal-btn" id="closeModalBtn">&times;</button>
        </div>
        <div class="modal-body">
            <div class="loading" id="modalLoading">
                <div class="loading-spinner"></div>
            </div>
            <div class="result" id="modalResult" style="display: none;">
                <div class="password-display">
                    <span id="passwordText" class="password-text"></span>
                    <button type="button" class="copy-btn" id="copyPasswordBtn" title="复制密码">
                        <i class="fa-regular fa-copy"></i>
                    </button>
                </div>
            </div>
            <p class="copy-success" id="copySuccessMessage">已复制到剪贴板!</p>
        </div>
    </div>
</div>


<script>
    // --- Existing Script Logic ---
    function reloadCaptcha() {
        document.getElementById('captchaImg').src = '${pageContext.request.contextPath}/image?d=' + Date.now();
    }

    function checkCaptchaForm(form) {
        if (!form.checkcode.value.trim()) {
            alert('请输入验证码');
            form.checkcode.focus();
            return false;
        }
        return true;
    }

    window.onload = function() {
        var err = '${error}';
        if (err && err.indexOf('验证码') !== -1) {
            alert(err);
            reloadCaptcha();
        } else if (err) {
            alert(err);
        }
    };

    // --- NEW: Password Toggle Logic ---
    const passwordInput = document.getElementById('password');
    const togglePasswordBtn = document.getElementById('togglePasswordBtn');

    togglePasswordBtn.addEventListener('click', function() {
        // Toggle the type attribute
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        // Toggle the icon
        const icon = this.querySelector('i');
        icon.classList.toggle('fa-eye');
        icon.classList.toggle('fa-eye-slash');
    });

    // --- Gemini API and Modal Logic ---
    const suggestPasswordBtn = document.getElementById('suggestPasswordBtn');
    const passwordModal = document.getElementById('passwordModal');
    const closeModalBtn = document.getElementById('closeModalBtn');
    const modalLoading = document.getElementById('modalLoading');
    const modalResult = document.getElementById('modalResult');
    const passwordText = document.getElementById('passwordText');
    const copyPasswordBtn = document.getElementById('copyPasswordBtn');
    const copySuccessMessage = document.getElementById('copySuccessMessage');

    const openModal = () => passwordModal.classList.add('visible');
    const closeModal = () => passwordModal.classList.remove('visible');

    suggestPasswordBtn.addEventListener('click', () => {
        openModal();
        suggestPassword();
    });
    closeModalBtn.addEventListener('click', closeModal);
    passwordModal.addEventListener('click', (e) => {
        if (e.target === passwordModal) {
            closeModal();
        }
    });

    async function suggestPassword() {
        modalResult.style.display = 'none';
        modalLoading.style.display = 'flex';
        copySuccessMessage.style.opacity = '0';

        const prompt = "Generate a highly secure, memorable password. It should be 14-16 characters long, containing a mix of uppercase letters, lowercase letters, numbers, and special symbols (like !@#$%^&*). Provide only the password string, with no explanation.";
        let chatHistory = [{ role: "user", parts: [{ text: prompt }] }];
        const payload = { contents: chatHistory };
        const apiKey = ""; // API Key will be injected by the environment.
        const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}`;

        try {
            const response = await fetch(apiUrl, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            });

            if (!response.ok) {
                throw new Error(`API Error: ${response.statusText}`);
            }

            const result = await response.json();

            if (result.candidates && result.candidates.length > 0 &&
                result.candidates[0].content && result.candidates[0].content.parts &&
                result.candidates[0].content.parts.length > 0) {
                const text = result.candidates[0].content.parts[0].text.trim();
                passwordText.textContent = text;
            } else {
                throw new Error("Invalid response structure from API.");
            }
        } catch (error) {
            console.error("Gemini API call failed:", error);
            passwordText.textContent = "生成失败，请稍后再试。";
        } finally {
            modalLoading.style.display = 'none';
            modalResult.style.display = 'block';
        }
    }

    copyPasswordBtn.addEventListener('click', () => {
        const textToCopy = passwordText.textContent;
        const textArea = document.createElement("textarea");
        textArea.value = textToCopy;
        textArea.style.position="fixed";
        document.body.appendChild(textArea);
        textArea.focus();
        textArea.select();
        try {
            document.execCommand('copy');
            copySuccessMessage.style.opacity = '1';
            setTimeout(() => { copySuccessMessage.style.opacity = '0'; }, 2000);
        } catch (err) {
            console.error('Fallback: Oops, unable to copy', err);
        }
        document.body.removeChild(textArea);
    });

</script>
</body>
</html>
<%--${pageContext.request.contextPath}--%>
