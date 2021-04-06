package fr.cned.emdsgil.suividevosfrais;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.support.v7.app.AppCompatActivity;

public class SyncActivity extends AppCompatActivity {

    private Integer anneesync;
    private Integer k;
    private Integer moissync;
    Integer joursync;
    String motifsync;
    double montantsync;
    private static Button btn_send;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sync);
        Global.changeAfficheDate((DatePicker) findViewById(R.id.datSync), false) ;
        setTitle("GSB : Suivi des frais");
        btn_send =(Button) findViewById(R.id.cmdTransfert);
        btn_send.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                transferez();
            }

        });

    }

    public void transferez()
    {

        anneesync = ((DatePicker)findViewById(R.id.datSync)).getYear() ;
        moissync = ((DatePicker)findViewById(R.id.datSync)).getMonth() + 1 ;
        // récupération de la qte correspondant au mois actuel
         sendHorsforfait(anneesync.toString(),moissync.toString());
         sendforfait(moissync.toString());

        Nextactivity();
    }

    /**
     * envoie des frais forfait à la bd
     * @param mois
     */
    public void sendforfait(String mois )
    {
        Database db = new Database();
        ConnectionActivity cn = new ConnectionActivity();
        String id_login = cn.id_login;
        Integer km ;
        Integer rep;
        Integer nui;
        Integer etp;
        Integer key = anneesync*100+moissync ;

        km = Global.listFraisMois.get(key).getKm();
        rep =Global.listFraisMois.get(key).getRepas();
        nui =Global.listFraisMois.get(key).getNuitee();
        etp =Global.listFraisMois.get(key).getEtape();
        if(!db.verifForfait(id_login,mois))
        {
            db.addfraisForfait(km,rep,nui,etp,id_login,mois);

        }
        else
        {
            majforfait(mois);

        }
    }

    /**
     * mettre à jour les frais forfait
     * @param mois
     */
    public void majforfait(String mois)
    {
        Database db = new Database();
        ConnectionActivity cn = new ConnectionActivity();
        String id_login = cn.id_login;
        Integer km ;
        Integer rep;
        Integer nui;
        Integer etp;
        Integer key = anneesync*100+moissync ;
        km = Global.listFraisMois.get(key).getKm();
        rep =Global.listFraisMois.get(key).getRepas();
        nui =Global.listFraisMois.get(key).getNuitee();
        etp =Global.listFraisMois.get(key).getEtape();
        db.majfraisHDDforfait(km,id_login,mois,"KM");
        db.majfraisHDDforfait(etp,id_login,mois,"ETP");
        db.majfraisHDDforfait(rep,id_login,mois,"REP");
        db.majfraisHDDforfait(nui,id_login,mois,"NUI");
    }

    /**
     * envoie des frais hors forfait à la bd
     * @param anne
     * @param mois
     */
    public void sendHorsforfait(String anne , String mois )
    {
        Database db = new Database();
        ConnectionActivity cn = new ConnectionActivity();
        String id_login = cn.id_login;
        String date;
        k = 0 ;
        Integer key = anneesync*100+moissync ;
        while (!Global.listFraisMois.isEmpty()) {
            joursync = Global.listFraisMois.get(key).getLesFraisHf().get(k).getJour() ;
            motifsync = Global.listFraisMois.get(key).getLesFraisHf().get(k).getMotif() ;
            montantsync = Global.listFraisMois.get(key).getLesFraisHf().get(k).getMontant() ;
            date =joursync.toString()+"-"+moissync.toString()+"-"+anneesync.toString();
            db.addhorforfait(id_login,moissync.toString(),motifsync.toString(),date,montantsync);
            Global.listFraisMois.get(key).getLesFraisHf().remove(k);
            k++;
        }
    }


    public void  Nextactivity()
    {
        Intent intent = new Intent(SyncActivity.this ,MainActivity.class);
        startActivity(intent);

    }

}
