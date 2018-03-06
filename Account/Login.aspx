<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <div class="form-group">
                      
                        <asp:Label runat="server" CssClass="col-md-2 control-label">User ID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="ID" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                         <asp:Label runat="server" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                        </div>
                    </div>
                     
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Login" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Sign up</asp:HyperLink>
                    Not have an accont
                </p>
                 <p>
                    <asp:HyperLink runat="server" ID="ForgetPasswordHyperLink" ViewStateMode="Disabled">Forget Password</asp:HyperLink>
                    Forget your password?
                </p>
          
            </section>
        </div>
    </div>
</asp:Content>

