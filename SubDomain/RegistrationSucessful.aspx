<%@ Page Title="Registraion Completed" Language="C#" MasterPageFile="~/SubDomain/SubDomain.Master" AutoEventWireup="true" CodeBehind="RegistrationSucessful.aspx.cs" Inherits="eShikshaNest.SubDomain.RegistrationSucessful" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-2">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <label class="fw-bold">Unique Number:</label>
                    <asp:Label ID="lblRollNumber" runat="server" CssClass="fs-5 text-success fw-bold" /><br />
                <hr class="border border-danger border-1 opacity-50">
                <label class="fw-bold">Name:</label>
<asp:Label ID="lblName" runat="server" CssClass="fs-5 fw-bold" /><br />
                 <hr class="border border-danger border-1 opacity-50">
                <label class="fw-bold">Email Number:</label>
<asp:Label ID="lblEmail" runat="server" CssClass="fs-6" /><br />
                 <hr class="border border-danger border-1 opacity-50">
                <label class="fw-bold">Mobile Number:</label>
<asp:Label ID="lblMobile" runat="server" CssClass="fs-6" /><br />
                 <hr class="border border-danger border-1 opacity-50">
                  <label class="fw-bold">Password:</label>
                <asp:Label ID="labelPassword" runat="server"  CssClass="fs-5 fw-bold" /><br />
                 <hr class="border border-danger border-1 opacity-50">
                <label class="fw-bold">
                    Your Password has been sent to mail used while registraion!
                </label>
                 <hr class="border border-danger border-1 opacity-50">
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
   <div class="row">
        <div class="col-md-12 text-center">
            <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Text="Close" CssClass="btn btn-danger" PostBackUrl="~/HomePage.aspx"/>
            <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-info"  OnClick="btnSubmit_Click" />
        </div>
    </div>

</asp:Content>
