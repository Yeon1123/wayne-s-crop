var clicks = 0;
function code(num){
    var num = num;
    clicks += 1;
    if(clicks%2 == 1){
        document.getElementsByClassName("colorscripter-code")[num].style.display="block";
    }else{
        document.getElementsByClassName("colorscripter-code")[num].style.display="none";
    }
}