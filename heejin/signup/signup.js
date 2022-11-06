const sendform = () => {
  const useremail = document.signupform.useremail;
  const userpw = document.signupform.userpw;
  const userpwch = document.signupform.userpwcj;
  const username = document.signupform.username;

  if (userpw.value == "" || username.value == "" || useremail.value == "") {
    alert("폼에 빈칸 없이 모두 입력해주세요.");
    return false;
  }

  if (userpw.value != userpwch.value) {
    alert("비밀번호가 다릅니다.");
    return false;
  }

  return true;
};

const checkId = () => {
  const useremail = document.signupform.useremail;
  const alert = document.querySelector("#alert_idch");

  if (useremail.value == "") {
    alert("이메일을 입력해주세요.");
    return false;
  }
  const xhr = new XMLHttpRequest();
  xhr.open("GET", "./checkId.php?useremail=" + useremail.value, true);
  xhr.onreadystatechange = () => {
    if (xhr.readyState == 4) {
      if (xhr.status == 200) {
        let txt = xhr.responseText.trim();
        console.log(txt);
        if (txt == "O") {
          alert.style.display = "block";
          alert.innerHTML = "사용할 수 있는 이메일입니다.";
        } else {
          alert.style.display = "block";
          alert.style.color = "red";
          alert.innerHTML = "중복된 이메일입니다.";
          useremail.addEventListener("keydown", function () {
            alert.style.display = "none";
          });
        }
      }
    }
  };

  xhr.send();
};
