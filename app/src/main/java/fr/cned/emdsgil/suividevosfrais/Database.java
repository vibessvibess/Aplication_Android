package fr.cned.emdsgil.suividevosfrais;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

/***
 *  Created by Sogui on .
 */
public class Database {


    /**
     * se connecter à la base de donne distante
     * @return
     */
    public Connection get_connection(){
        Connection connection=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/gsb_frais","root","root");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }


    /***
     * ajouter les fiches hors forfait
     * @param idvisiteur
     * @param mois
     * @param libelle
     * @param date
     * @param montant
     */

    public void addhorforfait(String idvisiteur , String mois,String libelle ,String date ,double montant )
    {
        Database obj_DB_Connection=new Database();
        Connection connection=obj_DB_Connection.get_connection();
        try {

            PreparedStatement pa = connection.prepareStatement("INSERT INTO fichefrais (idvisiteur,mois,nbjustificatifs,montantvalide,datemodif,idetat) VALUES (?,?,0,?,now(),'CR');"
                    + " ");
            PreparedStatement ps = connection.prepareStatement("INSERT INTO lignefraishorsforfait VALUES (null,?, ?,?, ?, ?);"
                    + " ");
            pa.setString(1,idvisiteur);
            pa.setString(2,mois);
            pa.setDouble(3,montant);


            ps.setString(1,idvisiteur);
            ps.setString(2,mois);
            ps.setString(3,libelle);
            ps.setString(4,date);
            ps.setDouble(5,montant);
            pa.executeUpdate();
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * ajouter des frais forfait
     * @param km
     * @param rep
     * @param nui
     * @param etp
     * @param idvisiteur
     * @param mois
     */
    public void addfraisForfait(int km,int rep, int nui, int etp ,String idvisiteur,String mois )
    {
        Database obj_DB_Connection=new Database();
        Connection connection=obj_DB_Connection.get_connection();
        boolean p=true;
        try {

            PreparedStatement pa = connection.prepareStatement("INSERT INTO fichefrais (idvisiteur,mois,nbjustificatifs,montantvalide,datemodif,idetat) VALUES (?,?,0,0,now(),'CR');"
                    + " ");
            PreparedStatement ps = connection.prepareStatement("INSERT INTO lignefraisforfait (idvisiteur,mois,idfraisforfait,quantite) VALUE(?, ?, ?, 10);"
                    + " ");
            pa.setString(1,idvisiteur);
            pa.setString(2,mois);
            pa.executeUpdate();

            ps.setString(1,idvisiteur);
            ps.setString(2,mois);

            int p1 =0;
            for(int i=0 ;i<4 ;i++)
            {
                if(i==0)
                {
                    p1=km;
                }
                if(i==1)
                {
                    p1=rep;
                }if(i==2)
            {
                p1=nui;
            }if(i==3)
            {
                p1=etp;
            }

                ps.setInt(3,p1);
                ps.executeUpdate();
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @param idvisiteur
     * @param mois
     * @return true or false
     */
    public boolean verifForfait(String idvisiteur,String mois)
    {
        Database obj_DB_Connection=new Database();
        Connection connection=obj_DB_Connection.get_connection();
        boolean p=true;
        try {

            PreparedStatement pa = connection.prepareStatement("SELECT * FROM lignefraisforfait WHERE lignefraisforfait.idvisiteur = ? AND lignefraisforfait.mois = ? ");
            pa.setString(1,idvisiteur);
            pa.setString(2,mois);
            ResultSet rs =pa.executeQuery();
            if(rs.next()!=true){
                p=false;

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return p;
    }

    /**
     * mettre à jour les fiche forfait si celle-ci existe pas sinon add
     * @param qte
     * @param idvisiteur
     * @param mois
     * @param p
     */
    public void majfraisHDDforfait(int qte ,String idvisiteur,String mois,String p )
    {
        Database obj_DB_Connection=new Database();
        Connection connection=obj_DB_Connection.get_connection();
            try {



                PreparedStatement ps = connection.prepareStatement("UPDATE lignefraisforfait SET lignefraisforfait.quantite = ? WHERE lignefraisforfait.idvisiteur = ? AND lignefraisforfait.mois = ? AND lignefraisforfait.idfraisforfait = ? ");
                ps.setInt(1,qte);
                ps.setString(2,idvisiteur);
                ps.setString(3,mois);
                for(int i=0; i<4;i++)
                {
                    if(i==0)
                    {
                        p="KM";
                    }
                    if(i==1)
                    {
                        p="REP";
                    }if(i==2)
                {
                    p="NUI";
                }if(i==3)
                {
                    p="ETP";
                }
                    ps.setString(4,p);
                    ps.executeUpdate();
                }


            } catch (Exception e) {
                System.out.println(e);
            }
    }


}
