package bean;

import java.sql.*;
import perbd.DBConnection;

public class LoginDao {

    public static boolean validate(LoginBean bean) {
        boolean status = false;
        DBConnection con = new DBConnection();

        try {
            con.open();

            Connection conn = con.getConection();
            
            PreparedStatement ps = conn.prepareStatement(
                    "select * from usuarios where user=? and passwd=?");

            ps.setString(1, bean.getUser());
            ps.setString(2, bean.getPass());
            
            System.out.println(bean.getUser());
            System.out.println(bean.getPass());

            ResultSet rs = ps.executeQuery();
            
            //bean.setName(rs.getString(3));
            status = rs.next();

        } catch (Exception e) {
        }

        return status;
    }
}
