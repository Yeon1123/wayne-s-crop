var clicks = 0;
function code(){
    clicks += 1;
    if(clicks%2 == 1){
        document.getElementsByClassName("colorscripter-code")[0].style.display="block";
    }else{
        document.getElementsByClassName("colorscripter-code")[0].style.display="none";
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
