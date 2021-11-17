const doc = document;
doc.addEventListener("DOMContentLoaded",()=>{

    doc.querySelector("div.btn_input").addEventListener("click", (e) => {

        let idName = e.target.id;

        if(idName === "join"){
            location.href=`${rootPath}/join`;
        }

    });
});

doc.querySelector("button#login").addEventListener("click", (e)=>{

    let inputID = doc.querySelector("input#user");
    let inputPW = doc.querySelector("input#pw");

    if(inputID.value === "" || inputID.value == null){

        alert("ID를 입력하세요 !!")
        inputID.focus();

        return false;
    }
    if(inputPW.value === "" || inputPW.value == null){

        alert("비밀번호를 입력하세요 !!")
        inputPW.focus();

        return false;
    }

    doc.querySelector("form#login").submit();
})