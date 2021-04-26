/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;


/**
 *
 * @author nmahadev
 */
public class DBConnect {

  // connection string
  private String driver = "com.mysql.jdbc.Driver";
  private String url = "jdbc:mysql://localhost:3306/office_algorithm";
  private String user = "mahadev";
  private String pwd = "mahadev";

  // JDBC variables and methods
  private Connection conn = null;
  private Statement stm = null;
  private Statement stm1 = null;
  private PreparedStatement pstm = null;
  private ResultSet rst = null;
  private ResultSetMetaData rsmd = null;
  private ResultSet rst1 = null;
  private ResultSetMetaData rsmd1 = null;

  //method to connect to database
  private String openDB() {
    String message = "Opened";
    try {
      Class.forName(driver); // loads the driver into memory.
      conn = DriverManager.getConnection(url, user, pwd);
      stm = conn.createStatement();
      stm1 = conn.createStatement();
    } catch (Exception e) {
      return e.getMessage();
    }
    return message;
  }

  private String closeDB() {
    String message = "Closed";
    try {
      stm.close();
      conn.close();
    } catch (Exception e) {
      message = e.getMessage();
    }
    return message;
  }

  // method to execute update
  public String updateDB(String sql, String print) {
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        stm.executeUpdate(sql);
        closeDB();
        if (print.equals("yes")){
          return "<div class='container'><h5>Update is Successful</h5></div>";   
        }
        return "";
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
  
  // Business logic: Method to verify password. Avoids SQL injection
  // Returns the column values requested in a array of Strings.
  public String[] isPwdValid(String sql, String user, String pwd) {
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        pstm = conn.prepareStatement(sql);
        pstm.setString(1, user);
        pstm.setString(2, pwd);
        rst = pstm.executeQuery();
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        String[] result = new String[count];
        int records = 0;
        while (rst.next()) {
          records++;
          for (int i = 0; i < count; i++) {
            result[i] = rst.getString(i + 1);
          }
        }
        closeDB();
        if (records == 0) {
          result[0] = "Error: Invalid Credentials";
        }
      return result;
      } catch (Exception e) {
        String[] result = new String[1];
        result[0] = "Error: " + e.getMessage();
        return result;
      }
    } else {
      String[] result = new String[1];
      result[0] = "Error: " + message;
      return result;
    }
  }
  
  public String returnSupplierStatus(String sql){
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        
        String status = "";
        while (rst.next()){
          status = rst.getString("Approval");
        }
        return status;
    
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
  }
  
  public String returnStockID(String name){
    String message = openDB();
    String sql = "SELECT StockID FROM `stock` WHERE Name='"+name+"'";
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        
        String id = "";
        while (rst.next()){
          id = rst.getString("StockID");
        }
        return id;
    
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
    
  }
  
  public String createStockTable(String id){
    String message = openDB();
    String sql = "SELECT Name, Category, Cost, Quantity FROM `stock` "
            + "INNER JOIN `supplierstock` "
            + "ON stock.StockID = supplierstock.StockID "
            + "WHERE SupplierID='"+id+"'"
            + "ORDER BY Category, Name, Cost";
    String html = "<div class='container'>"
            + "<table class='table'>"
            + "<thead>"
            + "<tr>"
            + "<th>Name</th>"
            + "<th>Category</th>"
            + "<th>Price</th>"
            + "<th>Quantity</th>"
            + "</tr>"
            + "</thead>"
            + "<tbody>";
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        
        while (rst.next()){
          String name = rst.getString("Name");
          String category = rst.getString("Category");
          String price = rst.getString("Cost");
          int quant= rst.getInt("Quantity");
          
          html += "<tr>"
                  + "<td>"+name+"</td>"
                  + "<td>"+category+"</td>"
                  + "<td>"+price+"</td>";
          if (quant == 0){
            html += "<td class='text-danger'>SOLD OUT</td></tr>";
          } else if (quant <= 3){
            html += "<td class='text-warning'>"+quant+" - LOW SUPPLIES</td></tr>";
          
          }else {
            html += "<td class='text-success'>"+quant+"</td></tr>";
          }
        }
        html += "</tbody></table></div>";
        return html;
    
      } catch (Exception e) {
        return e.getMessage();
      }
    } else {
      return message;
    }
    
  }
  
  // Method to create a drowdown list of the query.  Has HTML code to go between 
  // the <select> tag in HTML.  First column represents
  // the values and the the rest the list elements
  public String createHTMLDropdown(String sql) {
    String html = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int count = rsmd.getColumnCount();
        while (rst.next()) {
          html += "<option value='"+rst.getString(1)+"'>";
          for (int i=2; i <= count; i++)
            html += rst.getString(i)+" ";
          html += "</option>";
        }
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
  }
  
  public String createShipmentDropdown(String id){
    String html = "<select name='stockSelect' id='stockSelect'>";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        String sql = "SELECT Name, Quantity FROM `stock` "
                + "INNER JOIN `supplierstock` "
                + "ON stock.StockID = supplierstock.StockID " 
                + "WHERE SupplierID='"+id+"' " 
                + "ORDER BY Name";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        while (rst.next()) {
          
          if (rst.getInt("Quantity") > 5){
            // green
            html += "<option value='"+rst.getString("Name")+"'>"
                  + ""+rst.getString("Name")+" -- <span class='text-success'>"+rst.getInt("Quantity")+" Left </span>"
                  + "</option>";
            
          } else if (rst.getInt("Quantity") <= 2){
            // red
            if (rst.getInt("Quantity") <= 0){
              html += "<option value='"+rst.getString("Name")+"'>"
                  + ""+rst.getString("Name")+" -- <span class='text-danger'>SOLD OUT</span>"
                  + "</option>";
            } else {
              html += "<option value='"+rst.getString("Name")+"'>"
                  + ""+rst.getString("Name")+" -- <span class='text-danger'>"+rst.getInt("Quantity")+" Left </span>"
                  + "</option>";
            }           
          } else {
            // yellow
            html += "<option value='"+rst.getString("Name")+"'>"
                  + ""+rst.getString("Name")+" -- <span class='text-warning'>"+rst.getInt("Quantity")+" Left </span>"
                  + "</option>";
            
          }
        }
        html += "</select>";
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
    
  }
  
  public String createShipment(String name, String quant, String date, String id) {
    String html = "";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        String sql ="SELECT StockID FROM `stock` WHERE Name='"+name+"'";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        String stockID = "";
        while (rst.next()) {
          stockID = rst.getString("StockID");
        }
        String sql2 = "INSERT INTO `supplierorder` VALUES (0,'"+id+"','Added','"+date+"')";
        String sql3 = "SELECT sOrderID FROM `supplierorder` WHERE status='Added'";
        stm.executeUpdate(sql2);
        rst = stm.executeQuery(sql3);
        String orderID = "";
        while (rst.next()){
          orderID = rst.getString("sOrderID");
        }
        String sql4 = "INSERT INTO `supplierorderstock` VALUES (0,'"+orderID+"','"+stockID+"','"+quant+"')";
        stm.executeUpdate(sql4);
        String sql5 = "UPDATE `supplierorder` SET status='Processing' WHERE sOrderID='"+orderID+"'";
        stm.executeUpdate(sql5);
        html +="<p>Order submitted!</p>";
        
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
  }
  
  public String createOrderHistory(String id) {
    String html = "<div class='container'><div class='orderSection'>";
    ArrayList<String> requests = new ArrayList();
    ArrayList<String> pastOrders = new ArrayList();
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        String sql = "SELECT sOrderID, status FROM `supplierorder` WHERE SupplierID='"+id+"' ORDER BY shipmentDate";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        while (rst.next()){
          String temp = rst.getString("sOrderID");
          String tempStatus = rst.getString("status");
          if (tempStatus.equals("Requested")){
            requests.add(temp);
          } else {
            pastOrders.add(temp);
          }
        }
        html +="<h4 class='inputLabel'>Order History:</h4><br>";
        if (pastOrders.isEmpty()){
          html += "<p>No Previous Orders!</p>";
        } else {
          int x = 1;
          for (String i : pastOrders){
            String sql1 = "SELECT shipmentDate, status "
                    + "FROM `supplierorder`"
                    + "WHERE sOrderID='"+i+"'";
            String sql2 = "SELECT Name, supplierorderstock.quantity "
                      + "FROM `supplierorderstock` "
                      + "INNER JOIN stock "
                      + "ON supplierorderstock.StockID = stock.StockID "
                      + "WHERE supplierorderstock.sOrderID="+i+"";
            rst = stm.executeQuery(sql1);
            rsmd = rst.getMetaData();
            while (rst.next()){
              String date = rst.getString("shipmentDate");
              String status = rst.getString("status");
              if (status.equals("Processing")){
                html += "<div class='order'><br><p>Order #"+x+": "+date+" --> <span class='text-warning'>"+status+"</span> </p>";    
              } else if (status.equals("Shipped")){
                html += "<div class='order'><br><p>Order #"+x+": "+date+" --> <span class='text-primary'>"+status+"</span> </p>";   
              } else if (status.equals("Cancelled")){
                html += "<div class='order'><br><p>Order #"+x+": "+date+" --> <span class='text-danger'>"+status+"</span> </p>";   
              } else if (status.equals("Rejected")){
                html += "<div class='order'><br><p>Order #"+x+": "+date+" --> <span class='text-danger'>"+status+"</span> </p>";   
              } else if (status.equals("Recieved")){
                html += "<div class='order'><br><p>Order #"+x+": "+date+" --> <span class='text-success'>"+status+"</span> </p>";   
              } else {
                html += "<div class='order'><br><p>Order #"+x+": "+date+" --> "+status+" </p>";   
              }
              x += 1; 
            }
            rst = stm.executeQuery(sql2);
            rsmd = rst.getMetaData();
            html += "<ul>";
            while (rst.next()){
              String itemName = rst.getString("Name");
              String itemQuant = rst.getString("supplierorderstock.quantity");
              html += "<li> " + itemName + " -- " + itemQuant + " sent </li>";
            }
            html += "</ul></div><br>";
            
          }
        }
        // Change Order Process
        html += "</div><br><div class='container orderSection'>"
                + "<h4 class='inputLabel'>Change Order Process:</h4>"
                + "<form action='supplierProcessingAction.jsp'><br>"
                + "<select class='custome-select' name='orderSelect' id='orderSelect'>";
        String sql3 = "SELECT sOrderID, status FROM `supplierorder` WHERE supplierID='"+id+"'";
        rst = stm.executeQuery(sql3);
        rsmd = rst.getMetaData();
        int x = 1;
        while (rst.next()) {
          String status = rst.getString("status");
          if (status.equals("Requested") || status.equals("Recieved")){
            // pass
          } else {
            html += "<option value='"+rst.getString("sOrderID")+"'>"
                  + "Order #"+x+""
                  + "</option>";
            x += 1; 
          }
          
        }
        html += "</select> <select class='custome-select' name='statusSelect' id='statusSelect'>"
                + "<option value='Shipped'>Shipped</option>"
                + "<option value='Processing'>Processing</option>"
                + "<option value='Cancelled'>Cancelled</option>"
                + "</select><br>"
                + "<button type='submit' class='button submitButton'>Submit</button></form></div>";

        // Order Requests
        html += "<br><br><div class='container orderSection'><h4 class='inputLabel'>Order Requests:</h4><br>";
        if (requests.isEmpty()){
          html += "<p>No Current Order Requests</p>";
        }else {
            int y = 1;
            for (String j : requests){
              String sql1 = "SELECT shipmentDate, status "
                    + "FROM `supplierorder`"
                    + "WHERE sOrderID='"+j+"'";
              String sql2 = "SELECT Name, supplierorderstock.quantity "
                      + "FROM `supplierorderstock` "
                      + "INNER JOIN stock "
                      + "ON supplierorderstock.StockID = stock.StockID "
                      + "WHERE supplierorderstock.sOrderID="+j+"";
              rst = stm.executeQuery(sql1);
              rsmd = rst.getMetaData();
              while (rst.next()){
                String date = rst.getString("shipmentDate");
                String status = rst.getString("status");
                html += "<div class='order'><br><p>Request #"+y+": "+date+" --> <span class='text-info'>"+status+"</span> </p>";
                x += 1; 
              }
              rst = stm.executeQuery(sql2);
              rsmd = rst.getMetaData();
              html += "<ul>";
              while (rst.next()){
                String itemName = rst.getString("Name");
                String itemQuant = rst.getString("supplierorderstock.quantity");
                html += "<li> " + itemName + " -- " + itemQuant + " Requested </li>";
              }
              html += "</ul>";
              html += "<form action='supplierFulfillAction.jsp'><br>"
                    + "<input type='text' hidden name='id' id='id' value='"+j+"'>"
                    + "<label class='inputLabel'>Action:   </label>"
                    + "<select name='fulfill' id='fulfill'>"
                    + "<option value='Processing'>Fulfill</option>"
                    + "<option value='Rejected'>Reject</option>"
                    + "</select><br>"
                    + "<label class='inputLabel'>Estimated Shipping Date:   </label>"
                    + "<input type='date' id='newDate' name='newDate' value='2021-04-25'><br>"
                    + "<button class='button submitButton' type='submit'>Submit</button>"
                    + "</form><br>"
                    + "</div><br>";
            }
        }
        html += "</div>";
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
  }
  
  public String createShipmentStatusDropdown(String id){
    String html = "<select name='orderSelect' id='orderSelect'>";
    String message = openDB();
    if (message.equals("Opened")) {
      try {
        String sql = "SELECT sOrderID, status FROM `supplierorder` WHERE supplierID='"+id+"'";
        rst = stm.executeQuery(sql);
        rsmd = rst.getMetaData();
        int x = 1;
        while (rst.next()) {
          String status = rst.getString("status");
          if (status.equals("Requested") || status.equals("Recieved")){
            // pass
          } else {
            html += "<option value='"+rst.getString("sOrderID")+"'>"
                  + "Order #"+x+""
                  + "</option>";
            x += 1; 
          }
          
        }
        html += "</select> <select name='statusSelect' id='statusSelect'>"
                + "<option value='Shipped'>Shipped</option>"
                + "<option value='Processing'>Processing</option>"
                + "<option value='Cancelled'>Cancelled</option>"
                + "</select>";
        return html;
      }
      catch (Exception e) {
        return e.getMessage();
      }
    }
    else
      return message;
    
  }

 
}

