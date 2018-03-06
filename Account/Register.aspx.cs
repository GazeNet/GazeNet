using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using GazeNetOnline;
using System.Web;
using System.Net;
using System.Net.Sockets;
using System.Data.SqlClient;

public partial class Account_Register : Page

{

    protected void CreateUser_Click(object sender, EventArgs e)
    {      
        DatabaseConnect connectionObject = new DatabaseConnect();
        int result = Int32.Parse(connectionObject.userExists(Convert.ToInt64(ID.Text)).ToString());
        if (result != 0)
        {
            string script = "alert(\"User ID is taken"+result+"\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }
        else
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            String IPAdress = "";
            foreach (IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    IPAdress = ip.ToString();
                }
            }
            connectionObject.InsertParticipant(Convert.ToInt64(ID.Text), GenderList.Text, UserName.Text, Date.Text, Job.Text, Email.Text, IPAdress, Password.Text);

            Response.Redirect("Login.aspx");
        }
    }
    bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }
}