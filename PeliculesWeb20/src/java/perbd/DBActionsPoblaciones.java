/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package perbd;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

/**
 *
 * @author dsst
 */
public class DBActionsPoblaciones {

    public String getGPSPoblacion(String par, String pais) {
        DBConnection con = new DBConnection();
        String res = "{'gpspoblacion':[";
        try {
            con.open();
            Statement st1, st2;
            st1 = con.getConection().createStatement();
            st2 = con.getConection().createStatement();
            String sqlq = "select * from poblaciones where poblacion like '" + par + "' and pais like '" + pais + "';";
            ResultSet rs = st1.executeQuery(sqlq);
            String aux;
            float lat, lon;
            if (rs.next()) {
                lat = rs.getFloat("lat");
                lon = rs.getFloat("lon");
                aux = "";
                aux = aux + "{'lat':" + lat + "}";
                aux = aux + ",";
                aux = aux + "{'lon':" + lon + "}";
                res = res + aux;
            }
            res = res + "]}";
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
        return res;
    }

    public String getActoresPais(String nombrePais) {
        DBConnection con = new DBConnection();
        String res = "{";
        try {
            con.open();
            Statement st1, st2;
            st1 = con.getConection().createStatement();
            st2 = con.getConection().createStatement();
            String sqlq = "select * from personapais where pais like '" + nombrePais + "';";
            ResultSet rs = st1.executeQuery(sqlq);
            String aux;
            String idActor;
            String nombreActor;
            int contador = 0;
            while (rs.next()) {
                idActor = rs.getString("nconst");
                sqlq = "select * from namebasics where nconst like '" + idActor + "';";
                ResultSet rs2 = st2.executeQuery(sqlq);
                if (rs2.next()) {
                    nombreActor = rs2.getString("primaryname");
                    aux = "";
                    aux = aux + "\"nombre" + contador + "\":\"" + nombreActor + "\"";
                    res = res + aux + ", ";
                    contador++;
                }
            }
            res = res.substring(0, res.length() - 2);   // quito la última coma
            res = res + "}";
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
        return res;
    }
}
