/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.HeadlessException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JRViewer;
/**
 *
 * @author achma
 */
public class CetakBuktiRental2 extends javax.swing.JInternalFrame {

    
    Connection connection;
    Statement stat,stat1,stat2;
    ResultSet rs;
    String total, sql, sql1, sql2, idRental;
    
    /**
     * Creates new form CetakBuktiRental
     * @param id
     */
    public CetakBuktiRental2(String id) {
        initComponents();
        koneksi condb = new koneksi();
        condb.Config();
        connection = (Connection) condb.connect;
        stat = (com.mysql.jdbc.Statement) condb.stmt;
        idRental = id;
        Final();
    }


    private void Final() throws HeadlessException {
        try{
            koneksi condb = new koneksi();
            condb.Config();
            connection = (Connection) condb.connect;
            stat = (com.mysql.jdbc.Statement) condb.stmt;
            
            Map prs = new HashMap();            
            InputStream filePath = getClass().getResourceAsStream("/report/SuratRentalLunas.jrxml");
            System.out.println(filePath);
            JasperDesign jd1 = JRXmlLoader.load(filePath);
            
            
            sql = "SELECT\n" +
                    "rental.idRental,\n" +
                    "pelanggan.nama,\n" +
                    "pelanggan.ktp,\n" +
                    "pelanggan.alamat,\n" +
                    "pelanggan.telp,\n" +
                    "mobil.merek,\n" +
                    "mobil.nama AS nama_mobil,\n" +
                    "mobil.jenis,\n" +
                    "mobil.plat,\n" +
                    "rental.jangkaWaktu,\n" +
                    "rental.tglPinjam,\n" +
                    "rental.tglKembali,\n" +
                    "pembayaran.total,\n" +
                    "pembayaran.uangmuka\n" +
                    "FROM\n" +
                    "rental\n" +
                    "INNER JOIN pelanggan ON rental.idPelanggan = pelanggan.idPelanggan\n" +
                    "INNER JOIN mobil ON rental.idMobil = mobil.idMobil\n" +
                    "INNER JOIN pembayaran ON rental.idRental = pembayaran.idRental\n" +
                    "WHERE\n" +
                    "rental.idRental = '"+idRental+"'";
            
            
            JRDesignQuery newQuery = new JRDesignQuery();
            newQuery.setText(sql);
            jd1.setQuery(newQuery);
            JasperReport Jrpt1 = JasperCompileManager.compileReport(jd1);
            JasperPrint jp1 = JasperFillManager.fillReport(Jrpt1, prs,condb.connect);
            JRViewer viewer1 = new net.sf.jasperreports.view.JRViewer(jp1);
            Container c1 = getContentPane();
            c1.setLayout(new BorderLayout());
            c1.add(viewer1);
            
        }catch(JRException e){
            JOptionPane.showMessageDialog(null, e);
        }
    }

    private void First() throws HeadlessException {
        try{
            koneksi condb = new koneksi();
            condb.Config();
            connection = (Connection) condb.connect;
            stat = (com.mysql.jdbc.Statement) condb.stmt;
            
            Map prs = new HashMap();            
            InputStream filePath = getClass().getResourceAsStream("/report/SuratRental.jrxml");
            System.out.println(filePath);
            JasperDesign jd1 = JRXmlLoader.load(filePath);
            
            
            sql = "SELECT\n" +
                    "rental.idRental,\n" +
                    "pelanggan.nama,\n" +
                    "pelanggan.ktp,\n" +
                    "pelanggan.alamat,\n" +
                    "pelanggan.telp,\n" +
                    "mobil.merek,\n" +
                    "mobil.nama AS nama_mobil,\n" +
                    "mobil.jenis,\n" +
                    "mobil.plat,\n" +
                    "rental.jangkaWaktu,\n" +
                    "rental.tglPinjam,\n" +
                    "rental.tglKembali,\n" +
                    "pembayaran.total,\n" +
                    "pembayaran.uangmuka,\n" +
                    "pembayaran.sisabayar,\n" +
                    "pembayaran.`status`\n" +
                    "FROM\n" +
                    "rental\n" +
                    "INNER JOIN pelanggan ON rental.idPelanggan = pelanggan.idPelanggan\n" +
                    "INNER JOIN mobil ON rental.idMobil = mobil.idMobil\n" +
                    "INNER JOIN pembayaran ON rental.idRental = pembayaran.idRental\n" +
                    "WHERE\n" +
                    "rental.idRental = '"+idRental+"'";
            
            JRDesignQuery newQuery = new JRDesignQuery();
            newQuery.setText(sql);
            jd1.setQuery(newQuery);
            JasperReport Jrpt1 = JasperCompileManager.compileReport(jd1);
            JasperPrint jp1 = JasperFillManager.fillReport(Jrpt1, prs,condb.connect);
            JRViewer viewer1 = new net.sf.jasperreports.view.JRViewer(jp1);
            Container c1 = getContentPane();
            c1.setLayout(new BorderLayout());
            c1.add(viewer1);
            
        }catch(JRException e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 959, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 552, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
