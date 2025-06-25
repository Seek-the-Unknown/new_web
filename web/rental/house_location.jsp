<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布房源 - 公寓租房网</title>
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
        }

        .header {
            background-color: white;
            padding: 15px 5%;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #0066ff;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .post-title {
            font-size: 28px;
            margin-bottom: 30px;
            text-align: center;
        }

        .post-form {
            background: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .form-section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            color: #0066ff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="date"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
        }

        .checkbox-item input {
            margin-right: 8px;
        }

        .image-upload {
            border: 2px dashed #ddd;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
        }

        .image-upload:hover {
            border-color: #0066ff;
        }

        .image-upload i {
            font-size: 48px;
            color: #0066ff;
            margin-bottom: 15px;
        }

        .submit-btn {
            background: #0066ff;
            color: white;
            border: none;
            padding: 14px 30px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s;
            display: block;
            margin: 40px auto 0;
        }

        .submit-btn:hover {
            background: #0052cc;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="header">
    <div class="logo">公寓租房网</div>
</div>

<div class="container">
    <h1 class="post-title">发布您的房源</h1>

    <form class="post-form" action="${pageContext.request.contextPath}/HousePostServlet" method="post" enctype="multipart/form-data">
        <!-- 基本信息 -->
        <div class="form-section">
            <h2 class="section-title">基本信息</h2>

            <div class="form-group">
                <label for="title">房源标题 *</label>
                <input type="text" id="title" name="title" placeholder="例如：朝阳公园旁精装两居室" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="type">房源类型 *</label>
                    <select id="type" name="type" required>
                        <option value="">请选择</option>
                        <option value="apartment">公寓</option>
                        <option value="villa">别墅</option>
                        <option value="shared">合租</option>
                        <option value="studio">单间</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="price">月租金(元) *</label>
                    <input type="number" id="price" name="price" min="0" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="bedrooms">卧室数量 *</label>
                    <input type="number" id="bedrooms" name="bedrooms" min="0" required>
                </div>

                <div class="form-group">
                    <label for="bathrooms">卫生间数量 *</label>
                    <input type="number" id="bathrooms" name="bathrooms" min="0" required>
                </div>

                <div class="form-group">
                    <label for="area">面积(㎡) *</label>
                    <input type="number" id="area" name="area" min="0" step="0.1" required>
                </div>
            </div>
        </div>

        <!-- 位置信息 -->
        <div class="form-section">
            <h2 class="section-title">位置信息</h2>

            <div class="form-row">
                <div class="form-group">
                    <label for="province">省份 *</label>
                    <select id="province" name="province" required>
                        <option value="">请选择</option>
                        <option value="北京">北京</option>
                        <option value="上海">上海</option>
                        <option value="广东">广东</option>
                        <!-- 其他省份 -->
                    </select>
                </div>

                <div class="form-group">
                    <label for="city">城市 *</label>
                    <select id="city" name="city" required>
                        <option value="">请选择</option>
                        <option value="北京">北京</option>
                        <option value="上海">上海</option>
                        <option value="广州">广州</option>
                        <!-- 其他城市 -->
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="address">详细地址 *</label>
                <input type="text" id="address" name="address" placeholder="例如：朝阳区朝阳公园路8号" required>
            </div>
        </div>

        <!-- 房源详情 -->
        <div class="form-section">
            <h2 class="section-title">房源详情</h2>

            <div class="form-group">
                <label>房源照片 *</label>
                <div class="image-upload" onclick="document.getElementById('images').click()">
                    <i class="fas fa-cloud-upload-alt"></i>
                    <p>点击或拖拽上传照片(最多10张)</p>
                    <input type="file" id="images" name="images" multiple accept="image/*" style="display: none;" required>
                </div>
            </div>

            <div class="form-group">
                <label for="description">房源描述 *</label>
                <textarea id="description" name="description" placeholder="详细描述您的房源，例如装修情况、家具家电、周边环境等" required></textarea>
            </div>

            <div class="form-group">
                <label>房源设施</label>
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" id="wifi" name="facilities" value="wifi">
                        <label for="wifi">Wi-Fi</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="aircon" name="facilities" value="aircon">
                        <label for="aircon">空调</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="heating" name="facilities" value="heating">
                        <label for="heating">暖气</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="tv" name="facilities" value="tv">
                        <label for="tv">电视</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="fridge" name="facilities" value="fridge">
                        <label for="fridge">冰箱</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="washer" name="facilities" value="washer">
                        <label for="washer">洗衣机</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="kitchen" name="facilities" value="kitchen">
                        <label for="kitchen">厨房</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="elevator" name="facilities" value="elevator">
                        <label for="elevator">电梯</label>
                    </div>
                </div>
            </div>
        </div>

        <!-- 租赁信息 -->
        <div class="form-section">
            <h2 class="section-title">租赁信息</h2>

            <div class="form-row">
                <div class="form-group">
                    <label for="available_date">可租日期 *</label>
                    <input type="date" id="available_date" name="available_date" required>
                </div>

                <div class="form-group">
                    <label for="min_lease">最短租期(月) *</label>
                    <select id="min_lease" name="min_lease" required>
                        <option value="1">1个月</option>
                        <option value="3">3个月</option>
                        <option value="6">6个月</option>
                        <option value="12">12个月</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="deposit">押金(月租金)</label>
                <select id="deposit" name="deposit">
                    <option value="1">1个月</option>
                    <option value="2" selected>2个月</option>
                    <option value="3">3个月</option>
                </select>
            </div>

            <div class="form-group">
                <label>看房方式</label>
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" id="online" name="viewing" value="online">
                        <label for="online">线上看房</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" id="appointment" name="viewing" value="appointment" checked>
                        <label for="appointment">预约看房</label>
                    </div>
                </div>
            </div>
        </div>

        <button type="submit" class="submit-btn">发布房源</button>
    </form>
</div>

<script>
    // 实时显示选择的图片数量
    document.getElementById('images').addEventListener('change', function(e) {
        const files = e.target.files;
        const uploadDiv = document.querySelector('.image-upload');

        if(files.length > 0) {
            uploadDiv.innerHTML = `<i class="fas fa-check-circle"></i>
                                      <p>已选择 ${files.length} 张照片</p>`;

            if(files.length > 10) {
                alert('最多只能上传10张照片');
                e.target.value = '';
                uploadDiv.innerHTML = `<i class="fas fa-cloud-upload-alt"></i>
                                          <p>点击或拖拽上传照片(最多10张)</p>`;
            }
        }
    });

    // 省份城市联动
    document.getElementById('province').addEventListener('change', function() {
        const citySelect = document.getElementById('city');
        citySelect.innerHTML = '<option value="">请选择</option>';

        // 这里可以添加实际的省份城市联动逻辑
        // 示例: 如果选择北京，则添加北京的区
        if(this.value === '北京') {
            const districts = ['东城区', '西城区', '朝阳区', '海淀区', '丰台区'];
            districts.forEach(district => {
                citySelect.add(new Option(district, district));
            });
        }
    });
</script>
</body>
</html>