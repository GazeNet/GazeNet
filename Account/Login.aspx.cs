using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using GazeNetOnline;
using System.Web.Security;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register";
        ForgetPasswordHyperLink.NavigateUrl = "ForgetPassword";

        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            ForgetPasswordHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;

        }
    }

    protected void LogIn(object sender, EventArgs e)
    {
        DatabaseConnect connectionObject = new DatabaseConnect();
        bool result = connectionObject.userExists(Convert.ToInt64(ID.Text));
        if (result != false)
        {
            if (Password.Text.Equals(connectionObject.getUserPassword(Convert.ToInt64(ID.Text))))
            {

                FormsAuthentication.SetAuthCookie(
               this.TextBox_username.Text.Trim(), flase);

                FormsAuthenticationTicket ticket1 =
                   new FormsAuthenticationTicket(
                        1,                                   // version
                        this.TextBox_username.Text.Trim(),   // get username  from the form
                        DateTime.Now,                        // issue time is now
                        DateTime.Now.AddMinutes(10),         // expires in 10 minutes
                        false,      // cookie is not persistent
                        "HR"                              // role assignment is stored
                                                          // in userData
                        );
                HttpCookie cookie1 = new HttpCookie(
                  FormsAuthentication.FormsCookieName,
                  FormsAuthentication.Encrypt(ticket1));
                Response.Cookies.Add(cookie1);

                // 4. Do the redirect. 
                String returnUrl1;
                // the login is successful
                if (Request.QueryString["ReturnUrl"] == null)
                {
                    returnUrl1 = "HRpages/HR_main.aspx";
                    FormsAuthentication.SetAuthCookie(connectionObject.getUserName(Convert.ToInt64(ID.Text)), true);
                    FormsAuthentication.RedirectFromLoginPage(connectionObject.getUserName(Convert.ToInt64(ID.Text)), RememberMe.Checked);
                    FormsAuthentication.RedirectFromLoginPage(connectionObject.getUserName(Convert.ToInt64(ID.Text)), false);
                Response.Redirect("Manage.aspx");

            }
        }
    }

      
   
}