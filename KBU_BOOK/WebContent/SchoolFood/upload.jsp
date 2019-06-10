<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-06-10
  Time: 09:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>KBU BOOK</title>
    <script>
        function checkForm() {
            if (upload.file.value == "") {
                alert("파일을 업로드해주세요.");
                return false;
            } else if(!checkFileType(upload.file.value)) {
                alert("엑셀파일만 업로드 해주세요.");
                return false;
            }
            document.upload.submit();
        }
        function checkFileType(filePath){
            var fileLen = filePath.length;
            var fileFormat = filePath.substring(fileLen - 5);
            fileFormatfileFormat = fileFormat.toLowerCase();

            if (fileFormat == ".xlsx"){
                return true;
            } else{
                return false;
            }
        }
    </script>

</head>

<body>
<div style="text-align: center">
    <br>
    <h1>
        한국성서대 식단표 업로드 페이지
    </h1>
</div>
<br><br>
<div style="margin-left: 40%">
    <form action="/SchoolFood/uploadPro.jsp" name="upload" method="POST" enctype="multipart/form-data">
        <input type="file" name="file" size="20" />
        <br>
        <input type="submit" onclick="checkForm();" value="전송">
    </form>
</div>
</body>
</html>