var acum;
var pelisBrad = 0;
var pelisGeorge = 0;
var pelisMatt = 0;
var pelisRyan = 0;
var pelisChris = 0;
var pelisRobin = 0;
var pelisPaul = 0;

$(document).ready(function () {
    acum = 0;
    pintarEsperaPie();
    getParPerNom("persona");
});

function pintarEsperaPie() {
    $('#esperaPie').append('<img src="imatges/gif/loading.gif"/>');
}

function getParPerNom(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    nombre = decodeURIComponent(results[1].replace(/\+/g, " "));
    $("#nombreactor").html(nombre);
    buscarEdadActor(nombre);
    buscarCantidadPelisActor(nombre);
}

function buscarEdadActor(name) {
    switch (name) {
        case "Brad Pitt":
        {
            result = sessionStorage.getItem("edadBrad");
            break;
        }
        case "George Clooney":
        {
            result = sessionStorage.getItem("edadGeorge");
            break;
        }
        case "Matt Damon":
        {
            result = sessionStorage.getItem("edadMatt");
            break;
        }
        case "Ryan Reynolds":
        {
            result = sessionStorage.getItem("edadRyan");
            break;
        }
        case "Chris Evans":
        {
            result = sessionStorage.getItem("edadChris");
            break;
        }
        case "Robin Williams":
        {
            result = sessionStorage.getItem("edadRobin");
            break;
        }
        case "Paul Walker":
        {
            result = sessionStorage.getItem("edadPaul");
            break;
        }
    }
    if (result == null) {
        // Mediante las directivas del fichero bdpeliculas podemos conseguir los datos de la BD
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=edadactor&par=" + name,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                switch (name) {
                    case "Brad Pitt":
                    {
                        sessionStorage.setItem("edadBrad", result);
                        break;
                    }
                    case "George Clooney":
                    {
                        sessionStorage.setItem("edadGeorge", result);
                        break;
                    }
                    case "Matt Damon":
                    {
                        sessionStorage.setItem("edadMatt", result);
                        break;
                    }
                    case "Ryan Reynolds":
                    {
                        sessionStorage.setItem("edadRyan", result);
                        break;
                    }
                    case "Chris Evans":
                    {
                        sessionStorage.setItem("edadChris", result);
                        break;
                    }
                    case "Robin Williams":
                    {
                        sessionStorage.setItem("edadRobin", result);
                        break;
                    }
                    case "Paul Walker":
                    {
                        sessionStorage.setItem("edadPaul", result);
                        break;
                    }
                }
                console.log(result);
                var obj = JSON.parse(result);
                console.log(obj);
                $("#nacimiento").html(obj.nace);
                if (obj.muere < 0) {
                    $("#muerte").html("---");
                } else {
                    $("#muerte").html(obj.muere);
                }
            }});
    } else {
        var obj = JSON.parse(result);
        $("#nacimiento").html(obj.nace);
        if (obj.muere < 0) {
            $("#muerte").html("---");
        } else {
            $("#muerte").html(obj.muere);
        }
    }
}

function buscarCantidadPelisActor(name) {
    switch (name) {
        case "Brad Pitt":
        {
            result = sessionStorage.getItem("pelisBrad");
            break;
        }
        case "George Clooney":
        {
            result = sessionStorage.getItem("pelisGeorge");
            break;
        }
        case "Matt Damon":
        {
            result = sessionStorage.getItem("pelisMatt");
            break;
        }
        case "Ryan Reynolds":
        {
            result = sessionStorage.getItem("pelisRyan");
            break;
        }
        case "Chris Evans":
        {
            result = sessionStorage.getItem("pelisChris");
            break;
        }
        case "Robin Williams":
        {
            result = sessionStorage.getItem("pelisRobin");
            break;
        }
        case "Paul Walker":
        {
            result = sessionStorage.getItem("pelisPaul");
            break;
        }
    }
    acum = sessionStorage.getItem("acum");
    if (result == null) {
        // Mediante las directivas del fichero bdpeliculas podemos conseguir los datos de la BD
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=pelisdepersona&par=" + name,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                switch (name) {
                    case "Brad Pitt":
                    {
                        sessionStorage.setItem("pelisBrad", result);
                        pelisBrad = parseInt(result);
                        break;
                    }
                    case "George Clooney":
                    {
                        sessionStorage.setItem("pelisGeorge", result);
                        pelisGeorge = parseInt(result);
                        break;
                    }
                    case "Matt Damon":
                    {
                        sessionStorage.setItem("pelisMatt", result);
                        pelisMatt = parseInt(result);
                        break;
                    }
                    case "Ryan Reynolds":
                    {
                        sessionStorage.setItem("pelisRyan", result);
                        pelisRyan = parseInt(result);
                        break;
                    }
                    case "Chris Evans":
                    {
                        sessionStorage.setItem("pelisChris", result);
                        pelisChris = parseInt(result);
                        break;
                    }
                    case "Robin Williams":
                    {
                        sessionStorage.setItem("pelisRobin", result);
                        pelisRobin = parseInt(result);
                        break;
                    }
                    case "Paul Walker":
                    {
                        sessionStorage.setItem("pelisPaul", result);
                        pelisPaul = parseInt(result);
                        break;
                    }
                }
                // Sumamos uno a aCUM para saber si las tres lecturas han acabado
                acum++;
                sessionStorage.setItem("acum", acum);
                $("#npeliculas").html(parseInt(result));
                pintarGraficaPie();
            }});
    } else {
        $("#npeliculas").html(parseInt(result));
        sessionStorage.setItem("acum", acum);
        pintarGraficaPie();
    }
}

function pintarGraficaPie() {
    if (acum > 0) {
        verificarCache();
        $('#esperaPie').empty();
        pie();
    }
}

function verificarCache() {
    result = sessionStorage.getItem("pelisBrad");
    if (result != null) {
        pelisBrad = parseInt(result);
    }
    result = sessionStorage.getItem("pelisGeorge");
    if (result != null) {
        pelisGeorge = parseInt(result);
    }
    result = sessionStorage.getItem("pelisMatt");
    if (result != null) {
        pelisMatt = parseInt(result);
    }
    result = sessionStorage.getItem("pelisRyan");
    if (result != null) {
        pelisRyan = parseInt(result);
    }
    result = sessionStorage.getItem("pelisChris");
    if (result != null) {
        pelisChris = parseInt(result);
    }
    result = sessionStorage.getItem("pelisRobin");
    if (result != null) {
        pelisRobin = parseInt(result);
    }
    result = sessionStorage.getItem("pelisPaul");
    if (result != null) {
        pelisPaul = parseInt(result);
    }
}

function pie() {
    Highcharts.chart('pieContainer', {
        chart: {
            backgroundColor: '#F8F9FA',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Películas de los actores en comparación'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b><br>({point.y}, {point.percentage:.1f}%)'
                }
            }
        },
        series: [{
                name: 'Películas',
                colorByPoint: true,
                data: [{
                        name: 'Brad Pitt',
                        y: pelisBrad
                    }, {
                        name: 'George Clooney',
                        y: pelisGeorge
                    }, {
                        name: 'Matt Damon',
                        y: pelisMatt
                    }, {
                        name: 'Ryan Reynolds',
                        y: pelisRyan
                    }, {
                        name: 'Chris Evans',
                        y: pelisChris
                    }, {
                        name: 'Robin Williams',
                        y: pelisRobin
                    }, {
                        name: 'Paul Walker',
                        y: pelisPaul
                    }]
            }]
    });
}


