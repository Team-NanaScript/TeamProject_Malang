
    const doc = document
    let bYes = false

    const value_check = (element)=> {
        if (element.value === "") {
            alert(element + "를 입력하세요!!")
            element.focus();
            bYes = true
            return false
        }
    }

    doc.querySelector("button#join").addEventListener("click", ()=>{

    let id = doc.querySelector("input#user");
    let pw = doc.querySelector("input#pw");
    let check = doc.querySelector("input#check");
    let name = doc.querySelector("input#name");
    let tel = doc.querySelector("input#tel");
    let nickname = doc.querySelector("input#nickname");

    const element_array = [name,nickname, id, pw, check, tel ];

    bYes = false
    element_array.forEach((element)=>{
        if(!bYes){
            value_check(element)
        }
    })

        if(!bYes){
            if(id.value.length < 2) {
                alert("ID는 2글자 이상 입력하세요!!")
                id.focus();
                return false;
            }if(pw.value.length < 6){
                alert("비밀번호는 6자 이상 입력하세요!!")
                pw.focus();
                return false;
            }if(check.value != pw.value){
                alert("비밀번호가 다릅니다")
                pw.focus();
                return false;
            }if(check.value.length < 6) {
                alert("비밀번호 확인은 6자 이상 입력하세요!!")
                pw.focus();
                return false;
            }

            doc.querySelector("form#join").submit();
        }
})
