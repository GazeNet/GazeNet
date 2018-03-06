<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Label runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Create new Account.</h4>
        <hr />
        
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label"><strong>TCK.NO</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ID" AssociatedControlID="ID" TextMode="Number" CssClass="form-control" />  
                 <asp:RequiredFieldValidator runat=server 
                  ControlToValidate =ID CssClass ="text-danger"> *User ID is required.
        </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label"><strong>User Name</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" AssociatedControlID="UserName" CssClass="form-control" />   
                <asp:RequiredFieldValidator runat=server 
                  ControlToValidate =UserName CssClass ="text-danger"> *User name is required.
        </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server"  CssClass="col-md-2 control-label"><strong>Gender</strong></asp:Label>
            <div class="col-md-10">
                 <asp:RadioButtonList id="GenderList" runat="server">
                      <asp:ListItem Selected="True">Male</asp:ListItem>
                      <asp:ListItem>Female</asp:ListItem>
                      <asp:ListItem>Other</asp:ListItem>
                 </asp:RadioButtonList>
                 
            </div>
        </div>
       
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label"><strong>Birthday</strong></asp:Label>
            <div class="col-md-10">
              <asp:TextBox ID="Date" runat="server" AssociatedControlID="Date" Text='<%# Bind("DateofBirth") %>' TextMode="Date"></asp:TextBox>    
                 <asp:RequiredFieldValidator runat=server 
                  ControlToValidate =Date CssClass ="text-danger"> *Birth date is required.
        </asp:RequiredFieldValidator>
            </div>
        </div>
         <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label"><strong>Job</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" AssociatedControlID="Job" ID="Job" CssClass="form-control" />     
                <asp:RequiredFieldValidator runat=server 
                  ControlToValidate =Job CssClass ="text-danger"> *Job is required.
        </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label"><strong>Mail Adress</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" AssociatedControlID="Email" TextMode="Email" ID="Email" CssClass="form-control" />    
                <asp:RequiredFieldValidator runat=server 
                  ControlToValidate =Job CssClass ="text-danger"> *E-mail is required.
        </asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="regexEmailValid" CssClass ="text-danger" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Email" >*Invalid Email Format</asp:RegularExpressionValidator>                                
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label"><strong>Password</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" AssociatedControlID="Password" ID="Password" TextMode="Password" CssClass="form-control" />  
                <asp:RequiredFieldValidator runat=server 
                  ControlToValidate =Password  CssClass ="text-danger"> *Password is required.
        </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat=server display=dynamic
            ControlToValidate=Password
            errormessage="Password must be 8-12 nonblank characters." 
            validationexpression="[^\s]{8,12}" />

            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label"><strong>Confirm Password</strong></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" AssociatedControlID="ConfirmPassword" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />   
                 <asp:RequiredFieldValidator runat=server 
                  ControlToValidate =ConfirmPassword CssClass ="text-danger"> *Confirm Password is required.
        </asp:RequiredFieldValidator>
                 <asp:CompareValidator runat=server
            controltovalidate=ConfirmPassword
            controltocompare=Password 
            errormessage="Passwords do not match." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" ID="CreteUser"  OnClick=CreateUser_Click Text="Sign Up" CssClass="btn btn-default" ValidateRequestMode="Enabled" />
            </div>
        </div>
    </div>
</asp:Content>

