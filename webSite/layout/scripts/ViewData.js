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

var clicking = 0;
function Rcode(id){
    clicking += 1;
    if(clicking%2 == 1){
        document.getElementById(id).style.display="block";
    }else{
        document.getElementById(id).style.display="none";
    }
}

function includeHTML() {
    var z, i, elmnt, file, xhttp;
    /* Loop through a collection of all HTML elements: */
    z = document.getElementsByTagName("*");
    for (i = 0; i < z.length; i++) {
        elmnt = z[i];
        /*search for elements with a certain atrribute:*/
        file = elmnt.getAttribute("../images/demo/View%20Data/accurate");
        if (file) {
            /* Make an HTTP request using the attribute value as the file name: */
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4) {
                    if (this.status == 200) {elmnt.innerHTML = this.responseText;}
                    if (this.status == 404) {elmnt.innerHTML = "Page not found.";}
                    /* Remove the attribute, and call this function once more: */
                    elmnt.removeAttribute("../images/demo/View%20Data/accurate");
                    includeHTML();
                }
            }
            xhttp.open("GET", file, true);
            xhttp.send();
            /* Exit the function: */
            return;
        }
    }
}
