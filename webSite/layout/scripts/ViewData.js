var click = 0;
function code(){
    click += 1;
    if(click%2 == 1){
        document.getElementsByClassName("colorscripter-code")[0].style.display="block";
    }else{
        document.getElementsByClassName("colorscripter-code")[0].style.display="none";
    }
}
var click2 = 0;
function code2(){
    click2 += 1;
    console.log(click2);
    if(click2%2 == 1){
        document.getElementsByClassName("colorscripter-code")[1].style.display="block";
    }else{
        document.getElementsByClassName("colorscripter-code")[1].style.display="none";
    }
}

var click3 = 0;
function code3(){
    click3 += 1;
    console.log(click3);
    if(click3%2 == 1){
        document.getElementsByClassName("colorscripter-code")[2].style.display="block";
    }else{
        document.getElementsByClassName("colorscripter-code")[2].style.display="none";
    }
}

var click4 = 0;
function code4(){
    click4 += 1;
    console.log(click4);
    if(click4%2 == 1){
        document.getElementsByClassName("colorscripter-code")[3].style.display="block";
    }else{
        document.getElementsByClassName("colorscripter-code")[3].style.display="none";
    }
}

var click5 = 0;
function code5(){
    click5 += 1;
    console.log(click5);
    if(click5%2 == 1){
        document.getElementsByClassName("colorscripter-code")[4].style.display="block";
    }else{
        document.getElementsByClassName("colorscripter-code")[4].style.display="none";
    }
}

var clicking = 0;
function Rcode(id){
    clicking += 1;
    if(clicking%2 == 1){
        document.getElementById(id).style.display="block";
    }else{
        document.getElementById(id).style.display="none";
    }
}
