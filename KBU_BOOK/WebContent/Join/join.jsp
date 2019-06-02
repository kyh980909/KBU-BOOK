<%--
  Created by IntelliJ IDEA.
  User: yongho
  Date: 2019-05-31
  Time: 02:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>KBU BOOK</title>
    <style>
        @import "../css/style.css";

        body {
            background-color: rgba(69, 255, 57, 0.06);
        }
    </style>
    <link href="css/bootstrap-4.0.0.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">

        function check_pwd() //비밀번호 조건
        {

            //HTML의 form name="boardWriteForm"
            //유효성체크하고 싶은 값의 id, name="content_pwd", maxlength="16"

            var pwd = document.getElementsByName("pwd").value;

            if (pwd.value.length < 8) {
                alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
                return false;
            }

            if (!pwd.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
                alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
                return false;
            }

            return true;
        }

        function getTypeCheck(s, spc) {
            var i;

            for (i = 0; i < s.length; i++) {
                if (spc.indexOf(s.substring(i, i + 1)) < 0) {
                    return false;
                }
            }

            return true;
        }

        function check_Num(obj, n) {  //학번 입력 조건
            var re = /[^0-9]/gi;
            var NUM = "0123456789";
            var str_space = /\s/;

            if (n == undefined || n == null) {
                var n = "";
                var n2 = "";
            } else {
                if (n == "") {
                    var n = "";
                    var n2 = "";
                } else {
                    var n = eval(n);
                    var n2 = n;
                }
            }

            if (!getTypeCheck(obj.value, NUM)) {
                alert("학번은 숫자만 입력 가능 합니다!");

                obj.value = obj.value.replace(re, "");
                obj.value = n2;

                obj.focus();

                return false;
            }
        }

        function check_id(inputid) { //id중복 확인
            if (inputid.id.value == "") {
                alert("아이디를 입력하세요! (error:1)");
                return false;
            } else if ((inputid.id.value < "0" || inputid.id.value > "9") && (inputid.id.value < "A" || inputid.id.value > "Z") && (inputid.id.value < "a" || inputid.id.value > "z")) {
                alert("아이디는 한글 및 특수문자는 사용할 수 없습니다!\n 다시 확인후 입력을 해주시기 바랍니다!!");
                return false;
            }
            url = "id_check.jsp?id=" + inputid.id.value; //url+사용자 입력 id값 조회
            window.open(url, "id_check", "toolbar=no, location=center, status=no, resizable=no, width=500, height=300");  //팝업창을 통해 중복 아이디를 확인 가능!
        }

        function check_join() {
            var form = document.form;
            if (form.idcheck.value != "check_id") {
                alert("아이디 중복 확인을 하셔야 회원가입 할 수 있습니다.");
                return false;
            }
        }

        function inputid_check() { // 아이디 입력창에 값 입력시 hidden에 idUncheck를 저장한다. 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때 다시 중복체크를 하기 위해서이다.
            document.form.idcheck.value = "idUncheck";
        }

        function check_tel(inputtel) {
            if ((inputtel.phone_num.value < "0" || inputtel.phone_num.value > "9") && (inputtel.phone_num.value == "+")) {
                alert("전화번호는 숫자, +(국가번호) 이외 입력할 수 없습니다.");
                return false;
            }

        }
    </script>

</head>
<body onload="document.form.std_id.focus();"> <!--페이지가 로딩되면 바로 학번 입력이 가능한 상태가 됨-->
<div id="main">
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>

    <form action="/Join/Signup_Join.jsp" name="form" method="post" onsubmit="return check_join()" onreset="">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <p align="center"><img src="../img/Join.png" alt='이미지' align="center"/></p>
        <hr class="hr"></hr>

        <fieldset><p align="center">학번: <input type="text" placeholder="학번을 입력해주세요!" minlength="9" maxlength="9"
                                               onKeyUp="check_Num(this, '');" onChange="check_Num(this, '');"
                                               class="text-form" name="std_id" required> <input type="button"
                                                                                                value="학번확인"></p>
        </fieldset>
        <!--name="" 값만 DB에서 읽을수 있다. -->

        <p>아이디: <input type="text" size="50" value="" placeholder="아이디 입력후 중복확인을 해주세요." name="id" class="text-form"
                       onkeydown="inputid_check()" required> <input type="button" value="중복확인"
                                                                    onclick="check_id(this.form)"> <input type="hidden"
                                                                                                          name="idcheck"
                                                                                                          value="idUncheck">
        </p>
        <p>비밀번호: <input type="password" size="50" value="" minlength="4" placeholder="사용할 비밀번호를 정확히 입력하시오." name="pwd"
                        class="text-form" onkeyup="check_pwd(this)" onchange="check_pwd(this)" required></p>
        <p>학교이메일: <input type="text" value="" name="email" class="text-form" required>@<select name="email2">
            <option selected>bible.ac.kr</option>
            <option>stu.bible.ac.kr</option>
        </select></p>
        <p>휴대전화번호: <input type="tel" name="phone_num" class="text-form" onchange="check_tel(this.form)" required></p>
        <p align="center"><input type="button" value="Home" onClick="location.href='../index.jsp'"> <input type="reset"
                                                                                                           value="다시 쓰기">
            <input type="submit" value="회원가입"></p>


    </form>
</div>
</body>
</html>