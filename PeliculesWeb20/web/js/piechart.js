var acum2;
var p1 = 0;
var p2 = 0;
var p3 = 0;
var edades = [];

$(document).ready(function () {
    acum2 = 0;
    pintarEsperaPie();
    console.log("DEBUG - Cargada página con piechart.");
});

function pintarEsperaPie() {
    $('#esperaPie').append('<img src="imatges/gif/loading.gif"/>');
}

function cogerActor1() {    
    result = sessionStorage.getItem("p1_01");

    if (result === null) {
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=edadactorbienhecho&par=" + actores.nombre0,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                edades.push(parseInt(result));
                acum2++;
                contarEdades();
            }});
    } else {
        acum2++;
        contarEdades();
    }
    console.log("DEBUG - piechart - Cogido actor 1 (" + actores.nombre0 + ")");
}

function cogerActor2() {
    result = sessionStorage.getItem("p1_01");

    if (result === null) {
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=edadactorbienhecho&par=" + actores.nombre1,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                edades.push(parseInt(result));
                acum2++;
                contarEdades();
            }});
    } else {
        acum2++;
        contarEdades();
    }
    console.log("DEBUG - piechart - Cogido actor 2 (" + actores.nombre1 + ")");
}

function cogerActor3() {
    result = sessionStorage.getItem("p1_01");

    if (result === null) {
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=edadactorbienhecho&par=" + actores.nombre2,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                edades.push(parseInt(result));
                acum2++;
                contarEdades();
            }});
    } else {
        acum2++;
        contarEdades();
    }
    console.log("DEBUG - piechart - Cogido actor 3 (" + actores.nombre2 + ")");
}

function cogerActor4() {
    result = sessionStorage.getItem("p1_01");

    if (result === null) {
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=edadactorbienhecho&par=" + actores.nombre3,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                edades.push(parseInt(result));
                acum2++;
                contarEdades();
            }});
    } else {
        acum2++;
        contarEdades();
    }
    console.log("DEBUG - piechart - Cogido actor 4 (" + actores.nombre3 + ")");
}

function cogerActor5() {
    result = sessionStorage.getItem("p1_01");

    if (result === null) {
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=edadactorbienhecho&par=" + actores.nombre4,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                edades.push(parseInt(result));
                acum2++;
                contarEdades();
            }});
    } else {
        acum2++;
        contarEdades();
    }
    console.log("DEBUG - piechart - Cogido actor 5 (" + actores.nombre4 + ")");
}

function cogerActor6() {
    result = sessionStorage.getItem("p1_01");

    if (result === null) {
        console.log("ES NULL");
        $.ajax({url: "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=edadactorbienhecho&par=" + actores.nombre5,
            success: function (result) { // Cuando la funcion sale bien nos devuelve result
                edades.push(parseInt(result));
                acum2++;
                contarEdades();
            }});
    } else {
        console.log("cogerActor6 NO ES NULL");
        p1 = parseInt(result);
        p2 = parseInt(sessionStorage.getItem("p2_01"));
        p3 = parseInt(sessionStorage.getItem("p3_01"));
        acum2++;
        contarEdades();
    }
    console.log("DEBUG - piechart - Cogido actor 6 (" + actores.nombre5 + ")");
}

function contarEdades() {
    console.log("DEBUG - piechart - En contarEdades");
    if (sessionStorage.getItem("p1_01") === null) {
        if (acum2 === 6) {
            for (var i = 0; i < edades.length; i++) {
                console.log("El valor " + i + " es: " + edades[i]);
                if (edades[i] < 30) {
                    p1++;
                } else if (edades[i] < 60) {
                    p2++;
                } else {
                    p3++;
                }
            }

            // Lo almacenamos en la sesion
            sessionStorage.setItem("p1_01", p1);
            sessionStorage.setItem("p2_01", p2);
            sessionStorage.setItem("p3_01", p3);
            console.log("DEBUG - piechart - contarEdades - Guardados datos en almacenamiento de sesión");

        }
    } else {
        console.log("DEBUG - piechart - contarEdades - Los tres valores ya existen!");
        p1 = parseInt(sessionStorage.getItem("p1_01"));
        p2 = parseInt(sessionStorage.getItem("p2_01"));
        p3 = parseInt(sessionStorage.getItem("p3_01"));
    }

    pintarGraficaPie();

}

function pintarGraficaPie() {
    $('#esperaPie').empty();
    pie();
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
            text: 'Edad de los actores por conjuntos'
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
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
                name: 'Edades',
                colorByPoint: true,
                data: [{
                        name: '< 30',
                        y: p1,
                        sliced: true,
                        selected: true
                    }, {
                        name: 'entre 30 y 60',
                        y: p2
                    }, {
                        name: '> 60',
                        y: p3
                    }]
            }]
    });
}