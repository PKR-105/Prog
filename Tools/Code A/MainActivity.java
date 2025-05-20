package com.example.environmentmonitoringsystempart1_cloudserver;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;


import android.os.AsyncTask;
import android.util.Log;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {


    private String TAG = MainActivity.class.getSimpleName();
    private ListView lv;
    ArrayList<HashMap<String, String>> contactList;
    Button ViewDATA,DisableDATA;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        contactList = new ArrayList<>();
        lv = (ListView) findViewById(R.id.list);

        ViewDATA=(Button)findViewById(R.id.ViewData);
        DisableDATA=(Button)findViewById(R.id.DisableData);

        DisableDATA.setOnClickListener(new OnClickListener(){
            public void onClick(View v){

                contactList.clear();
                lv.setAdapter(null);
            }
        });

        ViewDATA.setOnClickListener(new OnClickListener(){
            public void onClick(View v){

                new GetContacts().execute();
            }
        });
    }



    private class GetContacts extends AsyncTask<Void, Void, Void> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            Toast.makeText(MainActivity.this,"Plz Wait Data is downloading ........",Toast.LENGTH_LONG).show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            HttpHandler sh = new HttpHandler();
            String url = "https://api.thingspeak.com/channels/2184183/feeds.json?api_key=XFBA3SYW9UAECU80&results=10";
            String jsonStr = sh.makeServiceCall(url);

            Log.e(TAG, "Response from url: " + jsonStr);

            try {
                JSONObject jsonObj = new JSONObject(jsonStr);

                JSONArray contacts = jsonObj.getJSONArray("feeds");

                for (int i = 0; i < contacts.length(); i++) {
                    JSONObject c = contacts.getJSONObject(i);
                    String created_at = c.getString("created_at");
                    String entry_id = c.getString("entry_id");
                    String field1 = c.getString("field1");
                    String field2 = c.getString("field2");
                    String field3 = c.getString("field3");
                    String field4 = c.getString("field4");
                    String field5 = c.getString("field5");
                    


                    HashMap<String, String> contact = new HashMap<>();

                    contact.put("created_at", created_at);
                    contact.put("entry_id", entry_id);
                    contact.put("field1", field1);
                    contact.put("field2", field2);
                    contact.put("field3", field3);
                    contact.put("field4", field4);
                    contact.put("field5", field5);

                    contactList.add(contact);
                }
            } catch (final JSONException e) {
                Log.e(TAG, "Json parsing error: " + e.getMessage());
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Json parsing error: " + e.getMessage(),
                                Toast.LENGTH_LONG).show();
                    }
                });

            }

            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            ListAdapter adapter = new SimpleAdapter(MainActivity.this, contactList,
                    R.layout.list_item, new String[]{ "created_at","entry_id", "field1", "field2", "field3", "field4", "field5"},
                    new int[]{R.id.t1, R.id.t2, R.id.t3, R.id.t4, R.id.t5, R.id.t6, R.id.t7});
            lv.setAdapter(adapter);
        }


    }

}