<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/eShikshaNest.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="eShikshaNest.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <!--ANNOUNCEMENTS SECTION STARTS-->
    <div class="bg-warning py-2 px-3 text-dark">
    <marquee behavior="scroll" direction="left" scrollamount="5" onmouseover="this.stop();" onmouseout="this.start();">
        📢 Announcement: Term II exams start from 15th July | 🎓 Submit assignments before 10th July | 📝 Attendance reports updated till June 21st
    </marquee>
</div>

    <!--ANNOUNCEMENTS SECTION ENDS-->
    <!--LIVE UPDATES SECTION STARTS-->
    <div class="card">
        <div class="card-body">
 <div class="container-fluid mt-4">
    <div class="row">
        <div class="col-md-12">
            <h4 class="fw-bold text-primary"><img src="Assets/Homepage/LIVE.svg" height="40" /> Live Updates</h4>
            <hr style="width: 10%" class="border border-primary border-1 opacity-25">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">🗓️ Hall Ticket download available for Term 2 exams.<img src="Assets/Homepage/blinking_new.gif" /></li>
                <li class="list-group-item">📢 Final marksheets to be digitally signed by 30th June.<img src="Assets/Homepage/blinking_new.gif" /></li>
                <li class="list-group-item">💼 Parent login access is now enabled for class-wise result view.<img src="Assets/Homepage/blinking_new.gif" /></li>
            </ul>
        </div>
    </div>
</div>
                </div>
</div>

    <!--LIVE UPDATES SECTION ENDS-->
    <!--HOME SECTION STARTS-->
            <div class="container-fluid mt-2">
        <div class="row text-center">
            <div class="col-md-4">
                <img src="Assets/HomePage/BONE.svg" alt="ContentImgone" height="150" width="150" />
            </div>
        
      
     <div class="col-md-4">
         <img src="Assets/HomePage/BTWO.svg" alt="ContentImgone" height="150" width="150" />
     </div>

        
     <div class="col-md-4">
         <img src="Assets/HomePage/BTHREE.svg" alt="ContentImgone" height="150" width="150" />
     </div>
</div>
        <div class="row text-center">
            <div class="col-md-10 mx-auto">
    <div class=" text-black fs-5 fw-bold mt-4">
 <span class="fw-bolder">
    "Empowering Education, One Click at a Time"

     </span>
        </div>
</div>
            </div>
        </div>
    <!--HOME SECTION ENDS-->
     <!-- ***** Main Banner Area Start ***** -->
<!--   <section class="section main-banner" id="top" data-section="section1">
      <video autoplay muted loop id="bg-video">
          <source src="Assets/Homepage/course-video.mp4" type="video/mp4" />
      </video>

      <div class="video-overlay header-text">
          <div class="caption">
              <h6>eShiksha Growth Nest</h6>
              <h2><em>Your</em> Classroom</h2>
              <div class="main-button">
                  <div class="scroll-to-section"><a href="#section2">Discover more</a></div>
              </div>
          </div>
      </div>
  </section>-->
  <!-- ***** Main Banner Area End ***** -->
    <!--FOOTER LINKS STARTS-->
            <hr class="border border-danger border-1 opacity-50">
    <div class="container-fluid mt-2">
         <div class="row">
             <div class="col-md-4 ">
                 <h4 class="fw-bold">Terms & Policies</h4>
                 <hr style="width: 20%" class="border border-primary border-1 opacity-25">
                 <ul class="list-unstyled">
                     <li><a href="Disclaimer.aspx" style="text-decoration: none" class="text-black"><i class="fa-solid fa-chevron-right"></i>&#160;&#160;Disclaimer</a></li>
                     <li><a href="TermsConditions.aspx" style="text-decoration: none" class="text-black "><i class="fa-solid fa-chevron-right"></i>&#160;&#160;Terms & Conditions</a></li>
                     <li><a href="PrivacyPolicy.aspx" style="text-decoration: none" class="text-black "><i class="fa-solid fa-chevron-right"></i>&#160;&#160;Privacy Policy</a></li>
                     <li><a href="HyperLinkPolicy.aspx" style="text-decoration: none" class="text-black"><i class="fa-solid fa-chevron-right"></i>&#160;&#160;HyperLink Policy</a></li>
                     <li><a href="CopyRightPolicy.aspx" style="text-decoration: none" class="text-black "><i class="fa-solid fa-chevron-right"></i>&#160;&#160;Copyright Policy</a></li>
                     
                     <li><a href="OurConcept.aspx" style="text-decoration: none" class="text-black"><i class="fa-solid fa-chevron-right"></i>&#160;&#160;Our Concept</a></li>
                     <li><a href="WhyUs.aspx" style="text-decoration: none" class="text-black"><i class="fa-solid fa-chevron-right"></i>&#160;&#160;Why Us</a></li>
                 </ul>
             </div>
             <div class="col-md-4">
                 <h4 class="fw-bold">Download Links</h4>
                 <hr style="width: 20%" class="border border-primary border-1 opacity-25">
                 <ul class="list-unstyled">
                     <li><a href="HomePage.aspx" class="nav-link text-primary"><i class="fa-solid fa-arrow-up-right-from-square"></i>&#160;&#160;<u>Home</u></a></li>
                     <li><a href="https://www.mscepune.in/" target="_blank" class="nav-link text-primary"><i class="fa-solid fa-arrow-up-right-from-square"></i>&#160;&#160;<u>Downloads and Information Brochure's</u> </a></li>

                     <li><a href="https://www.mscepune.in/gcc/index_gct.html" target="_blank" class="nav-link text-primary"><i class="fa-solid fa-arrow-up-right-from-square"></i>&#160;&#160;<u>Admin Portal</u></a></li>
                     <li><a href="https://deledexam.in//" target="_blank" class="nav-link text-primary"><i class="fa-solid fa-arrow-up-right-from-square"></i>&#160;&#160;<u>Examinar & Moderator Portal</u></a></li>
                     <li><a href="https://www.mscepuppss.in/" target="_blank" class="nav-link text-primary"><i class="fa-solid fa-arrow-up-right-from-square"></i>&#160;&#160;<u>School Admin Portal</u></a></li>
                     <li><a href="https://nmmsmsce.in/" target="_blank" class="nav-link text-primary"><i class="fa-solid fa-arrow-up-right-from-square"></i>&#160;&#160;<u>Chair Person's Portal</u></a></li>
                    
                 </ul>

             </div>
             <div class="col-md-4">

                 <h4 class="fw-bold">Contact</h4>
                 <hr style="width: 20%" class="border border-primary border-1 opacity-25">
                 <p>
                     <b>Vikas Anant Pawar,<br />
                         Survey Number: 658,<br />
                         Matoshri Niwas,Near Vithal Mandir,<br />
                         Gram Panchayat Sonwadi, Sonwadi
                         <br />
                      Daund, Pune, Maharashtra, India 413801 
                     </b>
                 </p>
                 <p>
                     <i class="fa-solid fa-phone-volume"></i>&nbsp;&nbsp;Mobile No - +91 8797879696<br>
                     <i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;Email ID - vikas2101pawar@gmail.com
                 </p>
             </div>
             </div>
        </div>
    <!--FOOTER LINKS ENDS-->
</asp:Content>
