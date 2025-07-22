<%@ Page Title="Why" Language="C#" MasterPageFile="~/eShikshaNest.Master" AutoEventWireup="true" CodeBehind="WhyUs.aspx.cs" Inherits="eShikshaNest.WhyUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container my-5">
    <div class="text-center mb-4">
        <h2 class="fw-bold">Why Choose <span class="text-primary">eShiksha Nest Academy</span>?</h2>
    </div>

    <div class="row g-4">
        <div class="col-md-6">
            <div class="p-3 border rounded bg-light h-100">
                <h5 class="fw-semibold">User-Friendly Interface</h5>
                <p>Designed for ease of use across all age groups and technical skill levels.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="p-3 border rounded bg-light h-100">
                <h5 class="fw-semibold">Scalable Solution</h5>
                <p>Suitable for schools, colleges, and coaching institutes of any size.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="p-3 border rounded bg-light h-100">
                <h5 class="fw-semibold">Secure and Reliable</h5>
                <p>Built with robust security protocols to protect user data and ensure trust.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="p-3 border rounded bg-light h-100">
                <h5 class="fw-semibold">24/7 Support</h5>
                <p>Dedicated customer support to resolve queries and ensure smooth operations.</p>
            </div>
        </div>
    </div>
</section>

<section class="container my-5 text-center">
    <h3 class="fw-bold mb-3">Get Started Today</h3>
    <p class="fs-5">
        Transform your educational institution with <strong>eShiksha Nest Academy</strong>.
        Contact us for a demo or visit our portal to explore how we can empower your academic journey.
    </p>

    <div class="mt-4">
        <a href="ContactUs.aspx" class="btn btn-primary me-2">Schedule a Demo</a>
        <a href="ContactUs.aspx" class="btn btn-outline-secondary">Contact Us</a>
    </div>
</section>

<section class="container text-center my-4">
    <blockquote class="blockquote fs-4">
        <p><em>"Empowering Education, One Click at a Time"</em></p>
        <footer class="blockquote-footer mt-2">
            <strong>eShiksha Nest Academy</strong> – Where Learning Meets Innovation.
        </footer>
    </blockquote>
</section>

</asp:Content>
