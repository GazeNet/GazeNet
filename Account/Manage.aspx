<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Account_Manage" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>    
    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">                                        
                <asp:PlaceHolder runat="server" ID="changePasswordHolder" Visible="false">
                    <p>Login as <strong></strong> .</p>
                    <div class="form-horizontal">
                        <h4>Change Password</h4>
                        <div class="form-group">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" CssClass="col-md-2 control-label">Current Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />                               
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" CssClass="col-md-2 control-label">New Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />                 
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm New Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />                               
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" Text="Change Password" OnClick="SetPassword_Click" CssClass="btn btn-default"  />
                            </div>
                        </div>
                    </div>
                </asp:PlaceHolder>
            </section>        
        </div>
    </div>

</asp:Content>
