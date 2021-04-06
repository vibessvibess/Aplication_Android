    package fr.cned.emdsgil.suividevosfrais;
    import android.content.Intent;
    import android.os.Bundle;
    import android.os.StrictMode;
    import android.support.v7.app.AppCompatActivity;
    import android.view.View;
    import android.widget.Button;
    import android.widget.EditText;

    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.Statement;

    public class ConnectionActivity extends AppCompatActivity {

        private static Button btn_send;
        private static EditText pseudo , pass ;
        protected String id_login ;

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.connexion);
            pseudo =(EditText) findViewById(R.id.logintest);
            pass =(EditText) findViewById(R.id.passwordtest);
            btn_send =(Button) findViewById(R.id.cmdValiderConnexion);
            setTitle("GSB : Suivi des frais");

            btn_send.setOnClickListener(new View.OnClickListener() {

                @Override
                public void onClick(View view) {
                    connexion();
                }

            });

            if(android.os.Build.VERSION.SDK_INT > 9){
                StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                StrictMode.setThreadPolicy(policy);
            }

        }

        /**
         * Se loger pour faire les tranferes vers la base de donnée
         * @login
         * @mdpn d'un visiteur
         */
        public void connexion()
        {
                Database obj_DB_Connection=new Database();
                Connection connection=obj_DB_Connection.get_connection();
                PreparedStatement ps=null;
                try {

                    String query="SELECT visiteur.login,visiteur.mdp visiteur.id FROM visiteur WHERE visiteur.login = ? ";
                    ps=connection.prepareStatement(query);
                    ps.setString(1,pseudo.getText().toString());
                    ResultSet rs=ps.executeQuery();
                    id_login = rs.getString("id").toString();
                    if(rs.getString( "mdp" ).equals(pass.getText().toString()))
                    {
                        Nextactivity();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
        }

        public void  Nextactivity()
        {
            Intent intent = new Intent(ConnectionActivity.this ,MainActivity.class);
            startActivity(intent);

        }

    }
