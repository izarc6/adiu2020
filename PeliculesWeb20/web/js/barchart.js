var acumBar;
var espana, argentina;
var actores;
var p2_bar;
var p3_bar;

$(document).ready(function () {
    acumBar = 0;
    espana = 0;
    pintarEsperaBar();
    //pintarEspana();
    //pintarArgentina();
    pintarActores();
});

function pintarEsperaBar() {
    $('#esperaBar').append('<img src="imatges/gif/loading.gif"/>');
}

function pintarActores() {
    result = sessionStorage.getItem("actoresRandom");
    if (result === null) {
        // Mediante las directivas del fichero bdpeliculas podemos conseguir los datos de la BD
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=actoresrandom&par=6",
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                // Lo almacenamos en la sesion
                sessionStorage.setItem("actoresRandom", result);
                
                // Guardamos el valor de result en una variable global
                console.log("Result actores random: " + result);
                actores = JSON.parse(result);

                // Sumamos uno a aCUM para saber si las seis lecturas han acabado
                acumBar++;
                
                cogerActor1();
                cogerActor2();
                cogerActor3();
                cogerActor4();
                cogerActor5();
                cogerActor6();
                
                pintarGraficaBar();
            }});
    } else {
        console.log("DEBUG - barchart - Actores ya presentes en caché!");
        
        // Hay que volver a hacer el parse porque si no los parámetros "nombre0", "nombre1" etc son
        // strings, no identificadores, y entonces las columnas del barchart no tienen etiquetas
        actores = JSON.parse(result);
        acumBar++;
        // Se llama a cogerActor6 para que se pueda pintar el piechart
        cogerActor6();
        pintarGraficaPie();
        pintarGraficaBar();
    }
}

function pintarEspana() {
    result = sessionStorage.getItem("actoresEspana");
    if (result === null) {
        // Mediante las directivas del fichero bdpeliculas podemos conseguir los datos de la BD
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=actorespais&par=esp",
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                // Lo almacenamos en la sesion
                sessionStorage.setItem("actoresEspana", result);
                
                // Guardamos el valor de result en una variable global
                espana = JSON.parse(result);

                // Sumamos uno a aCUM para saber si las tres lecturas han acabado
                acumBar++;
                
                cogerActor1();
                cogerActor2();
                cogerActor3();
                
                pintarGraficaBar();
            }});
    } else {
        espana = result;
        acumBar++;
        pintarGraficaBar();
    }
}

function pintarArgentina() {
    result = sessionStorage.getItem("actoresArgentina");
    if (result === null) {
        // Mediante las directivas del fichero bdpeliculas podemos conseguir los datos de la BD
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=actorespais&par=arg",
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                // Lo almacenamos en la sesion
                sessionStorage.setItem("actoresArgentina", result);
                
                // Guardamos el valor de result en una variable global
                argentina = JSON.parse(result);

                // Sumamos uno a aCUM para saber si las tres lecturas han acabado
                acumBar++;
                
                cogerActor4();
                cogerActor5();
                cogerActor6();
                
                pintarGraficaBar();
            }});
    } else {
        argentina = result;
        acumBar++;
        pintarGraficaBar();
    }
}

function pintarGraficaBar() {
    if (acumBar === 1) {
        $('#esperaBar').empty();
        column();
    }
}

function column() {
    Highcharts.chart('barContainer', {
        chart: {
            backgroundColor: '#F8F9FA',
            type: 'column'
        },
        title: {
            text: 'Número de películas por actor'
        },
        xAxis: {
            categories: [
                actores.nombre0,
                actores.nombre1,
                actores.nombre2,
                actores.nombre3,
                actores.nombre4,
                actores.nombre5
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Número de películas'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b> {point.y:.0f}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
                name: 'Películas',
                data: [1,2,3,4,5,6]
            }]
    });
}
