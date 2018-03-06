using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class DatabaseConnect
{
    private MySqlConnection connection;
    private string server;
    private string database;
    private string uid;
    private string password;

    public MySqlConnection Connection { get => connection; set => connection = value; }

    public DatabaseConnect()
    {
        Initialize();
    }
    private void Initialize()
    {
        server = "localhost";
        database = "gazenet";
        uid = "root";
        password = "zehra61.95";
        string connectionString;
        connectionString = "SERVER=" + server + ";" + "DATABASE=" +
        database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";";

        connection = new MySqlConnection(connectionString);
    }

    public object userExists(string text)
    {
        throw new NotImplementedException();
    }

    private bool OpenConnection()
    {
        try
        {
            connection.Open();
            return true;
        }
        catch (MySqlException ex)
        {
            switch (ex.Number)
            {
                case 0:
                    //0: Cannot connect to server.
                    break;

                case 1045:
                    //1045: Invalid user name and/or password. 
                    break;
            }
            return false;
        }
    }
    private bool CloseConnection()
    {
        try
        {
            connection.Close();
            return true;
        }
        catch (MySqlException ex)
        {
            //exception message
            return false;
        }
    }
    public void InsertParticipant(long participantID, String gender, String participantName, String date, String job, String participantMail, String IPAdress, String participantPassword)
    {
        string query = "INSERT INTO Participant (PARTICIPANT_ID,PARTICIPANT_GENDER,PARTICIPANT_NAME,PARTICIPANT_BIRTHDAY," +
            "PARTICIPANT_JOB,PARTICIPANT_MAIL,IP_ADRESS ,PARTICIPANT_PASSWORD)" +
            " VALUES(" + participantID + ",'" + gender + "','" + participantName + "','" + date + "','" + job + "'" +
            ",'" + participantMail + "','" + IPAdress + "','" + participantPassword + "')";

        //open connection

        if (this.OpenConnection() == true)
        {
            //create command and assign the query and connection from the constructor
            MySqlCommand cmd = new MySqlCommand(query, connection);

            //Execute command
            cmd.ExecuteNonQuery();

            //close connection
            this.CloseConnection();
        }
    }
    public bool userExists(long ID)
    {
        MySqlCommand cmd = new MySqlCommand("Select count(*) from Participant where PARTICIPANT_ID= "+ID,this.Connection);
        Connection.Open();
        var result = cmd.ExecuteScalar();
        Connection.Close();
        if(result != null)
        return true;

        return false;
        
    }
    public string getUserName(long ID)
    {
        MySqlCommand cmd = new MySqlCommand("Select PARTICIPANT_NAME from Participant where PARTICIPANT_ID= " + ID, this.Connection);
        Connection.Open();
        MySqlDataReader reader;
        reader = cmd.ExecuteReader();
        string result = "";
        
        if (reader.Read())
        {
            result = reader.GetString("Participant_NAME").ToString();
        }
        Connection.Close();
        return result;
    }
    public String getUserPassword(long ID)
    {
        MySqlCommand cmd = new MySqlCommand("Select PARTICIPANT_PASSWORD from Participant where PARTICIPANT_ID= " + ID, this.Connection);
        Connection.Open();
        MySqlDataReader reader;
        reader = cmd.ExecuteReader();
        string result="";
        
        if (reader.Read())
        {
            result = reader.GetString("Participant_Password").ToString();
        }
        Connection.Close();
        return result;
    }
}