var clicks = 0;
function rcode(){
    clicks += 1;
    if(clicks%2 == 1){
        block();
    }else{
        none();
    }
}
function none(){
    document.getElementsByClassName("colorscripter-code")[0].style.display="none";
}
function block(){
    document.getElementsByClassName("colorscripter-code")[0].style.display="block";
}