function temperatureG() {
    var temperature = document.form.inputG.value;
    var viewdata;
    if(temperature < 15){
        var raise = 26 - temperature;
        viewdata = "It takes 18 to 20 days to germinate.";
    }else if(temperature < 20){
        var drop = temperature - 32;
        viewdata = "It takes 8 to 10 days to germinate.";
    }else if(temperature > 20){
        viewdata = "It takes 4 to 6 days to germinate.";
    }else{
        viewdata = "Invalid input.";
    }
    document.form.viewG.value = viewdata;
}

function temperatureN() {
    var temperature = document.form1.inputN.value;
    var viewdata;
    if(temperature < 26){
        var raise = 26 - temperature;
        viewdata = "The temperature is too low. Raise " + raise + " °C.";
    }else if(temperature > 32){
        var drop = temperature - 32;
        viewdata = "The temperature is too high. Drop " + drop + " °C.";
    }else if(temperature >= 26 && temperature <= 32){
        viewdata = "This temperature is pleasant.";
    }else{
        viewdata = "Invalid input.";
    }
    document.form1.viewN.value = viewdata;
}

function temperatureS() {
    var temperature = document.form2.inputS.value;
    var viewdata;
    if(temperature < 35){
        var raise = 35 - temperature;
        viewdata = "The temperature is too low. Raise " + raise + " °C.";
    }else if(temperature > 38){
        var drop = temperature - 38;
        viewdata = "The temperature is too high. Drop " + drop + " °C.";
    }else if(temperature >= 35 && temperature <= 38){
        viewdata = "This temperature is pleasant.";
    }else{
        viewdata = "Invalid input.";
    }
    document.form2.viewS.value = viewdata;
}

function moistureB() {
    var moisture = document.form3.inputB.value;
    var viewdata;
    if(moisture < 150){
        var raise = 150 - moisture;
        viewdata = "The moisture is too low. Need " + raise + " mm more.";
    }else if(moisture >= 150){
        viewdata = "This moisture is pleasant.";
    }else{
        viewdata = "Invalid input.";
    }
    document.form3.viewB.value = viewdata;
}

function moistureM() {
    var moisture = document.form4.inputM.value;
    var viewdata;
    if(moisture < 90){
        var raise = 90 - moisture;
        viewdata = "The moisture is too low. Need " + raise + " mm more.";
    }else if(moisture > 120){
        var drop = moisture - 120;
        viewdata = "The moisture is too high. Give " + drop + " mm less.";
    }else if(moisture >= 90 && moisture <= 120){
        viewdata = "This moisture is pleasant.";
    }else{
        viewdata = "Invalid input.";
    }
    document.form4.viewM.value = viewdata;
}

