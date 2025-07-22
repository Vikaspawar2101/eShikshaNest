<%@ Page Title="Student Dashboard" Language="C#" MasterPageFile="~/SubDomain/SubDomain.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="eShikshaNest.SubDomain.StudentDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container mt-4">
        <h2 class="text-center">Welcome, <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label></h2>
        <hr />
         <asp:LinkButton ID="lnkFormFilling" runat="server" CssClass="btn btn-success mb-3" PostBackUrl="~/SubDomain/FormFilling.aspx" Visible="false">
    ➕ Fill Admission/Exam Form
</asp:LinkButton>
         <asp:LinkButton ID="lnkLogout" runat="server" CssClass="btn btn-danger mb-3" OnClick="lnkLogout_Click">
             Logout
         </asp:LinkButton>
         <div class="row">
             <div class="col-md-6">
                    <!-- Profile Card -->
   <div class="card mb-3">
       <div class="card-header fw-bold bg-danger-subtle">Profile Summary</div>
       <div class="card-body row">
           <div class="col-md-4">
               <img src="../Assets/Homepage/studentProfile.svg" class="img-fluid rounded" style="max-height: 150px;" />
           </div>
           <div class="col-md-8">
               <p><strong>Student ID:</strong> <asp:Label ID="lblStudentID" runat="server" /></p>
               <p><strong>Standard:</strong> <asp:Label ID="lblStandard" runat="server" /></p>
               <p><strong>Division:</strong> <asp:Label ID="lblDivision" runat="server" /></p>
               <p><strong>Academic Year:</strong> <asp:Label ID="lblAcademicYear" runat="server" /></p>
           </div>
       </div>
   </div>

             </div>
             <div class="col-md-6">
                  <!-- Academic Overview -->
 <div class="card mb-3">
     <div class="card-header fw-bold bg-danger-subtle">Academic Progress</div>
     <div class="card-body">
         <asp:GridView ID="gvMarks" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
             <Columns>
                 <asp:BoundField DataField="Subject" HeaderText="Subject" />
                 <asp:BoundField DataField="Marks" HeaderText="Marks" />
                 <asp:BoundField DataField="Grade" HeaderText="Grade" />
             </Columns>
         </asp:GridView>
     </div>
 </div>
             </div>
         </div>
     
       <hr class="border border-primary border-3 opacity-75">
        

        <!-- Homework Section -->
        <div class="card mb-3">
            <div class="card-header fw-bold bg-danger-subtle">Homework</div>
            <div class="card-body">
                <asp:Repeater ID="rptHomework" runat="server">
                    <HeaderTemplate><ul class="list-group"></HeaderTemplate>
                    <ItemTemplate>
                        <li class="list-group-item">
                            <strong><%# Eval("Subject") %>:</strong> <%# Eval("Description") %>
                            <span class="float-end text-muted">Due: <%# Eval("DueDate", "{0:dd MMM yyyy}") %></span>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate></ul></FooterTemplate>
                </asp:Repeater>
            </div>
        </div><hr class="border border-primary border-3 opacity-75">
          <div class="row">
     <div class="col-md-6">
         <!-- Notices -->
<div class="card mb-3">
    <div class="card-header fw-bold bg-danger-subtle">Notices</div>
    <div class="card-body">
        <asp:BulletedList ID="bltNotices" runat="server" CssClass="list-group"></asp:BulletedList>
    </div>
</div>
     </div>
      <div class="col-md-6">
              <!-- Downloads -->
    <div class="card mb-3">
        <div class="card-header fw-bold bg-danger-subtle">Downloads</div>
        <div class="card-body">
            <asp:Repeater ID="rptDownloads" runat="server">
                <ItemTemplate>
                    <p><%# Eval("Title") %> - <a href='<%# Eval("FilePath") %>' class="btn btn-sm btn-primary" >Download</a></p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>
      </div>
 </div>
        

        
</asp:Content>
