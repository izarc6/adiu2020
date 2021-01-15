var lat = [];
var lon = [];
var noms = [];
var boolCheck = [];
var es = 0, fr = 1, us = 2, it = 3, ar = 4, au = 5, ca = 6, de = 7, pt = 8;

$(document).ready(function () {
    for (i = 0; i < 9; i++) {
        boolCheck[i] = false;
    }

    pintarMapa();

    console.log("Se ha cargado");
});

// He añadido el parámetro de país ya que, el profe no lo tenía y cuando hacía 
// una consulta, la propia base de datos devolvía la primera referencia que encontraba
function checkbox(pais, lloc)
{
    tempo = "http://localhost:8080/PeliculesWeb20/bdpeliculas?op=gpspoblacion&par=" + lloc + "&pais=" + pais;
    $.ajax({url: tempo,
        success: function (result) {

            switch (pais) {
                case 'es':
                    if (boolCheck[es]) {
                        boolCheck[es] = false;
                    } else {
                        lat[es] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[es] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[es] = lloc;
                        boolCheck[es] = true;
                    }
                    break;

                case 'fr':
                    if (boolCheck[fr]) {
                        boolCheck[fr] = false;
                    } else {
                        lat[fr] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[fr] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[fr] = lloc;
                        boolCheck[fr] = true;
                    }
                    break;

                case 'us':
                    if (boolCheck[us]) {
                        boolCheck[us] = false;
                    } else {
                        lat[us] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[us] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[us] = lloc;
                        boolCheck[us] = true;
                    }
                    break;

                case 'it':
                    if (boolCheck[it]) {
                        boolCheck[it] = false;
                    } else {
                        lat[it] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[it] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[it] = lloc;
                        boolCheck[it] = true;
                    }
                    break;

                case 'ar':
                    if (boolCheck[ar]) {
                        boolCheck[ar] = false;
                    } else {
                        lat[ar] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[ar] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[ar] = lloc;
                        boolCheck[ar] = true;
                    }
                    break;

                case 'au':
                    if (boolCheck[au]) {
                        boolCheck[au] = false;
                    } else {
                        lat[au] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[au] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[au] = lloc;
                        boolCheck[au] = true;
                    }
                    break;

                case 'ca':
                    if (boolCheck[ca]) {
                        boolCheck[ca] = false;
                    } else {
                        lat[ca] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[ca] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[ca] = lloc;
                        boolCheck[ca] = true;
                    }
                    break;

                case 'de':
                    if (boolCheck[de]) {
                        boolCheck[de] = false;
                    } else {
                        lat[de] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[de] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[de] = lloc;
                        boolCheck[de] = true;
                    }
                    break;

                case 'pt':
                    if (boolCheck[pt]) {
                        boolCheck[pt] = false;
                    } else {
                        lat[pt] = parseFloat(result.substring(result.indexOf("lat':") + 5, result.indexOf("},{")));
                        lon[pt] = parseFloat(result.substring(result.indexOf("lon':") + 5, result.indexOf("}]}")));
                        noms[pt] = lloc;
                        boolCheck[pt] = true;
                    }
                    break;
            }

            pintarMapa();
        }});
}

function pintarMapa() {
    variables = "[";
    for (i = 0; i < 9; i++) {
        if (boolCheck[i]) {
            variables = variables + "{\"name\": \"" + noms[i] + "\", \"lat\": " + lat[i] + ", \"lon\": " + lon[i] + "},";
        }
    }
    variables = variables.substring(0, variables.length - 1) + "]";
    
    if (variables.length === 1) {
        variables = null;
    }

    Highcharts.mapChart('mapContainer', {
        chart: {
            backgroundColor: '#F8F9FA',
            map: 'custom/world'
        },
        title: {
            text: 'Mapa del mundo'
        },
        mapNavigation: {
            enabled: true
        },
        tooltip: {
            headerFormat: '',
            pointFormat: '<b>{point.name}</b><br>Lat: {point.lat}, Lon: {point.lon}'
        },
        series: [{
                // Use the gb-all map with no data as a basemap
                name: 'Basemap',
                borderColor: '#A0A0A0',
                nullColor: 'rgba(200, 200, 200, 0.3)',
                showInLegend: false
            }, {
                name: 'Separators',
                type: 'mapline',
                nullColor: '#707070',
                showInLegend: false,
                enableMouseTracking: false
            }, {
                // Specify points using lat/lon
                type: 'mappoint',
                name: 'Capitales',
                color: Highcharts.getOptions().colors[1],
                data: JSON.parse(variables)
            }]
    });
}