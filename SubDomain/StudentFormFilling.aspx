<%@ Page Title="Form Filling" Language="C#" MasterPageFile="~/SubDomain/SubDomain.Master" AutoEventWireup="true" CodeBehind="StudentFormFilling.aspx.cs" Inherits="eShikshaNest.SubDomain.StudentFormFilling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-2">
        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="card">
                    <div class="card-header fw-bold alert alert-danger fs-4">
                        Student Main Form.
                    </div>
                    <div class="card-body">
                        <!-- Basic info Starts I-->
                        <div class="row">
                            <div class="col-md-4">
                                <label class="fw-bold">
                                    Student Name:
                                </label>
                                <span style="color: red;">*</span>
                                <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold">
                                    Mother's Name:
                                </label>
                                <span style="color: red;">*</span>
                                <asp:TextBox ID="txtMotherName" runat="server" CssClass="form-control" placeholder="Mother's Name"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold">
                                    Date of Birth:
                                </label>
                                <span style="color: red;">*</span>
                                <asp:TextBox ID="txtDoB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                         <!-- Basic info Ends I-->
                        <hr />
                         <!-- Basic info Starts II-->
                        <div class="row">
                            <div class="col-md-4">
                                <label>CASTE CATEGORY</label><span style="color: red;">*</span>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                    <asp:ListItem>SELECT CASTE</asp:ListItem>
                                    <asp:ListItem>GEN</asp:ListItem>
                                    <asp:ListItem>SC</asp:ListItem>
                                    <asp:ListItem>ST</asp:ListItem>
                                    <asp:ListItem>VJ-A</asp:ListItem>
                                    <asp:ListItem>NT-B</asp:ListItem>
                                    <asp:ListItem>NT-C</asp:ListItem>
                                    <asp:ListItem>NT-D</asp:ListItem>
                                    <asp:ListItem>OBC</asp:ListItem>
                                    <asp:ListItem>SBC</asp:ListItem>
                                    <asp:ListItem>SEBC</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <!-- Basic info Ends II-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
