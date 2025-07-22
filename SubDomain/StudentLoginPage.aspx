<%@ Page Title="Student Login" Language="C#" MasterPageFile="~/SubDomain/SubDomain.Master" AutoEventWireup="true" CodeBehind="StudentLoginPage.aspx.cs" Inherits="eShikshaNest.SubDomain.StudentLoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!--Ctrl+C Ctrl+V Disable Script S-->
    <script>
        function disableCopy(event) {
            if (event.ctrlKey && event.keyCode === 67) {
                event.preventDefault();
            }
        }
    </script>
    <!--Ctrl+C Ctrl+V Disable Script E-->

    <!--Captcha Code Refresh S-->
    <script>
        function refreshPage() {
            location.reload();
        }
    </script>

    <script type="text/javascript">
        // Function to generate and display a new captcha image
        function refreshCaptcha() {
            // Call your server-side method to regenerate the captcha
            PageMethods.GenerateCaptcha(onSuccess, onError);
        }

        // Callback function for successful captcha refresh
        function onSuccess(result) {
            // Update the captcha image with the new one
            document.getElementById("captchaImage").src = result;
        }

        // Callback function for error during captcha refresh
        function onError(error) {
            alert("An error occurred while refreshing captcha: " + error.get_message());
        }
    </script>
    <!--Captcha Code Refresh E-->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">
        <div class="row">
                <div class="col-md-10 mx-auto">
                        <p class="fw-bold fs-4 text-center" style="font-family: 'Poor Richard'">Student Login</p>
                <hr /> 
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-5">
                        <asp:Label ID="unamelbl" runat="server" CssClass="text-black fw-bold" Text="Username(UNIQUE NUMBER)"></asp:Label><span style="color: red">*</span>
                        <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" placeholder="Username (UNIQUE NUMBER)" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="vlaidUserId" runat="server" ControlToValidate="txtUserId" ErrorMessage="User Id is Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-5">
                        <asp:Label ID="passlbl" runat="server" CssClass="text-black fw-bold" Text=" Password:"></asp:Label><span style="color: red">*</span>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="PassWord is Required!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <center>
                            <label class="fw-bold">Captcha Code:</label><span style="color: red">*</span>
                            <asp:Label ID="captchaCodeLabel" BorderStyle="Groove" BorderWidth="1" BackColor="WhiteSmoke" onkeydown="disableCopy(event)" oncut="return false" oncopy="return false" onpaste="return false" runat="server" CssClass="fw-bold text-center fs-3 form-label"></asp:Label>
                            <span onclick="refreshPage()" class="" onclientclick="refreshCaptcha(); return false;"><i class="fa-solid fa-rotate" style="color: blue"></i></span>
                        </center>
                        <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" placeholder="Type Captcha" onkeyup="capitalizeInput(this)"></asp:TextBox>
                        <br />
                        <center>
                    </div>
                </div>
                <div class="row text-center">
                    <center>
                        <asp:Button ID="btniologin" runat="server" CssClass="btn btn-primary w-25" Text="Login" OnClick="btniologin_Click" />
                        <br />
                        <asp:LinkButton ID="btnBack" runat="server" CssClass="fw-bold text-primary" CausesValidation="false" OnClick="btnBack_Click">Back to Home</asp:LinkButton>
                        <br/>
                    <asp:LinkButton ID="btnForgetPassword" runat="server" CssClass="fw-bold text-primary" CausesValidation="false" OnClick="btnForgetPassword_Click"><i class="fa-solid fa-lock"></i>Forgot Password</asp:LinkButton>
                </div>
            </div>

</asp:Content>
