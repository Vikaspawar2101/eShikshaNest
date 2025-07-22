<%@ Page Title="Student Registration" Language="C#" MasterPageFile="~/SubDomain/SubDomain.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="eShikshaNest.SubDomain.StudentRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <div class="container-fluid mt-2">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header fw-bold alert alert-success fs-4">
                        Important Instructions
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item" style="font-family:Britannic">1. 
        Name and other details entered by the applicant need
        to be the same as in the <strong>Educational Documents.</strong></li>  
                          
                        <li class="list-group-item" style="font-family:Britannic">2. 
        Applicant can log in to the admission portal
        through their registered email address, only.</li>
                        <li class="list-group-item" style="font-family:Britannic">3.
        Applicant must use his own active email address.</li>
                        <li class="list-group-item" style="font-family:Britannic">4. 
          The Email address provided by the applicant
          must be functional and the applicant must
          have access to it throughout the admission process.
                        </li>
                        <li class="list-group-item" style="font-family:Britannic">5. 
          Applicants are encouraged to use latest version of 
          Google Chrome web browser for filling the application form.
                        </li>
                        <li class="list-group-item" style="font-family:Britannic">6. 
All information entered must be accurate and verifiable; any discrepancy may lead to rejection of the application.
</li>
<li class="list-group-item" style="font-family:Britannic">7. 
Do not refresh or press the cancel button while filling the form to avoid data loss.
</li>
                        <li class="list-group-item" style="font-family:Britannic">8. 
All '<span style="color: red;">*</span>' marked field's are required.
</li>

                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header fw-bold alert alert-success fs-4">
                        Student Registration Form.
                    </div>
                    <div class="card-body">
                       
                        <div class="row">
                            <div class="col-md-4">
                                <label class="fw-bold">Firstname:</label><span style="color: red;">*</span>
                                <hr class="border border-success border-1 opacity-75">
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Firstname" ToolTip="Firstname of candidate as per Educational documents" onkeyup="capitalizeInput(this)"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold">Middlename:</label><span style="color: red;">*</span>
                                <hr class="border border-success border-1 opacity-75">
                                <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" placeholder="Middlename" ToolTip="Middlename of candidate as per Educational documents" onkeyup="capitalizeInput(this)"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold">Lastname:</label><span style="color: red;">*</span>
                                <hr class="border border-success border-1 opacity-75">
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Lastname" ToolTip="Lastname of candidate as per Educational documents" onkeyup="capitalizeInput(this)"></asp:TextBox>
                            </div>
                        </div>
                        <hr class="border border-danger border-1 opacity-50">
                        <div class="row">
                            <div class="col-md-6">
                                <label class="fw-bold">Email Address:</label><span style="color: red;">*</span>
                                <hr class="border border-success border-1 opacity-75">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                                    placeholder="Email Address" TextMode="Email"
                                    ToolTip="Please use your own email as this will be used for all official communication" onkeyup="capitalizeInput(this)">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="validEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Email is Required" ForeColor="Red" Display="Dynamic" >
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Invalid email address." ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-6">
                                <label class="fw-bold">Re-Enter Email Address:</label><span style="color: red;">*</span>
                                <hr class="border border-success border-1 opacity-75">
                                <asp:TextBox ID="txtVerifyEmail" runat="server" CssClass="form-control"
                                    placeholder="Re-Enter Email Address" TextMode="Email" onkeyup="capitalizeInput(this)">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="vlaidEmail" runat="server" ControlToValidate="txtVerifyEmail"
                                    ErrorMessage="Email is Required" ForeColor="Red" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txtVerifyEmail"
                                    ErrorMessage="Invalid email address." ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$">
                                </asp:RegularExpressionValidator>

                                <!-- CompareValidator to ensure both emails match -->
                                <asp:CompareValidator ID="cvEmailMatch" runat="server"
                                    ControlToCompare="txtEmail" ControlToValidate="txtVerifyEmail"
                                    ErrorMessage="Email addresses do not match." Operator="Equal" Type="String"
                                    ForeColor="Red" Display="Dynamic">
                                </asp:CompareValidator>
                            </div>
                        </div>

                        <hr class="border border-danger border-1 opacity-50">
                        <div class="row">
                            <div class="col-md-6">
                                <label class="fw-bold">Mobile Number:</label><span style="color: red;">*</span>
                                <hr class="border border-success border-1 opacity-75">
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"
                                    MaxLength="10" placeholder="Mobile Number" TextMode="Phone">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile"
                                    ErrorMessage="Mobile number is required" ForeColor="Red" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile"
                                    ErrorMessage="Enter a valid 10-digit mobile number" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^[6-9]\d{9}$">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-6">
                                <label class="fw-bold">Re-Enter Mobile Number:</label><span style="color: red;">*</span>
                                <hr class="border border-success border-1 opacity-75">
                                <asp:TextBox ID="txtVerifyMobile" runat="server" CssClass="form-control"
                                    MaxLength="10" placeholder="Re-Enter Mobile Number" TextMode="Phone">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvVerifyMobile" runat="server" ControlToValidate="txtVerifyMobile"
                                    ErrorMessage="Re-entering mobile number is required" ForeColor="Red" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revVerifyMobile" runat="server" ControlToValidate="txtVerifyMobile"
                                    ErrorMessage="Enter a valid 10-digit mobile number" ForeColor="Red" Display="Dynamic"
                                    ValidationExpression="^[6-9]\d{9}$">
                                </asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="cvMobileMatch" runat="server"
                                    ControlToCompare="txtMobile" ControlToValidate="txtVerifyMobile"
                                    ErrorMessage="Mobile numbers do not match" Operator="Equal" Type="String"
                                    ForeColor="Red" Display="Dynamic">
                                </asp:CompareValidator>
                            </div>
                        </div>

                        <hr class="border border-danger border-1 opacity-50">
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
                        <hr class="border border-danger border-1 opacity-50">
                         <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:Button ID="btnCancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="btn btn-danger"  PostBackUrl="~/HomePage.aspx"/>
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-info"  OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
