<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="_3T_Employee.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<style>
    :root { --primary:#4f46e5; --primary-dark:#3730a3; --ink:#172033; --muted:#64748b; --line:#e2e8f0; }
    * { box-sizing:border-box; }
    body { margin:0; background:#f3f6fd; color:var(--ink); font-family:'Segoe UI',Tahoma,sans-serif; }
    .registration-container { min-height:100vh; display:flex; justify-content:center; align-items:center; padding:55px 18px; background:linear-gradient(125deg,#eef2ff,#f8fafc,#dbeafe,#ede9fe); background-size:300% 300%; animation:backgroundShift 16s ease infinite; position:relative; overflow:hidden; }
    .registration-container::before,.registration-container::after { content:''; position:absolute; width:340px; height:340px; border-radius:50%; filter:blur(12px); opacity:.32; pointer-events:none; animation:float 9s ease-in-out infinite; }
    .registration-container::before { background:#a5b4fc; top:-160px; left:-100px; }
    .registration-container::after { background:#93c5fd; bottom:-190px; right:-90px; animation-delay:-4s; }
    .registration-card { position:relative; z-index:1; width:100%; max-width:550px; padding:42px; background:rgba(255,255,255,.94); border:1px solid rgba(255,255,255,.9); border-radius:22px; box-shadow:0 22px 65px rgba(45,55,110,.13),0 2px 10px rgba(45,55,110,.04); animation:cardEnter .7s cubic-bezier(.2,.8,.2,1) both; transition:box-shadow .35s,transform .35s; }
    .registration-card:hover { box-shadow:0 28px 75px rgba(45,55,110,.17); transform:translateY(-3px); }
    .form-title { margin:0 0 9px; text-align:center; font-size:30px; letter-spacing:-.8px; font-weight:750; color:#1e1b4b; }
    .form-subtitle { margin:0 0 30px; text-align:center; color:var(--muted); font-size:14px; line-height:1.6; }
    .form-table { width:100%; border-collapse:separate; border-spacing:0 5px; }
    .form-table td { padding:9px 0; vertical-align:middle; }
    .form-table td:first-child { width:112px; font-size:14px; font-weight:650; color:#334155; }
    .form-table td:nth-child(2) { min-width:0; }
    .form-control { display:block; width:100%; min-height:46px; padding:12px 14px; border:1px solid #dbe2ed; border-radius:10px; outline:none; background:#f8faff; color:#243047; font:inherit; font-size:14px; transition:border-color .25s,box-shadow .25s,background .25s,transform .25s; }
    .form-control::placeholder { color:#94a3b8; }
    .form-control:hover { border-color:#a5b4fc; background:#fff; }
    .form-control:focus { border-color:#6366f1; background:#fff; box-shadow:0 0 0 4px rgba(99,102,241,.13); transform:translateY(-1px); }
    select.form-control { cursor:pointer; }
    .gender-list { color:#475569; font-size:14px; }
    .gender-list td { padding:5px 13px 5px 0 !important; white-space:nowrap; width:auto !important; font-weight:400 !important; }
    .gender-list label { margin-left:5px; cursor:pointer; transition:color .2s; }
    .gender-list label:hover { color:var(--primary); }
    .gender-list input { accent-color:var(--primary); cursor:pointer; width:15px; height:15px; vertical-align:middle; }
    .file-control { display:block; width:100%; max-width:100%; padding:10px; border:1.5px dashed #a5b4fc; border-radius:10px; background:#f8faff; color:#64748b; font-size:13px; transition:background .25s,border-color .25s,box-shadow .25s; }
    .file-control:hover,.file-control:focus { background:#eef2ff; border-color:var(--primary); box-shadow:0 0 0 3px rgba(99,102,241,.09); }
    .file-control::file-selector-button { margin-right:12px; padding:9px 12px; border:0; border-radius:7px; background:#e0e7ff; color:#4338ca; font-weight:650; cursor:pointer; transition:background .2s,transform .2s; }
    .file-control::file-selector-button:hover { background:#c7d2fe; }
    .btn-save { display:block; width:100%; margin-top:16px; padding:14px 18px; border:0; border-radius:10px; background:linear-gradient(120deg,#4f46e5,#6366f1,#4338ca); background-size:200% 100%; color:white; font-size:15px; font-weight:700; letter-spacing:.2px; cursor:pointer; box-shadow:0 7px 18px rgba(79,70,229,.22); transition:background-position .35s,transform .25s,box-shadow .25s; }
    .btn-save:hover { background-position:100% 0; transform:translateY(-2px); box-shadow:0 11px 24px rgba(79,70,229,.33); }
    .btn-save:active { transform:translateY(0) scale(.99); }
    .btn-save:focus-visible { outline:3px solid #a5b4fc; outline-offset:3px; }
    #lblmsg { display:block; max-width:1100px; margin:18px auto; padding:0 16px; font-size:14px; font-weight:600; text-align:center; }
    #GridView1 { width:calc(100% - 36px); max-width:1100px; margin:24px auto 45px; border:1px solid var(--line) !important; border-collapse:separate; border-spacing:0; border-radius:14px; overflow:hidden; background:white; box-shadow:0 12px 35px rgba(30,41,59,.08); font-size:13px; animation:cardEnter .8s ease both; }
    #GridView1 th { padding:16px 13px; background:#312e81; color:white; font-size:12px; font-weight:700; letter-spacing:.3px; text-align:left; border:0 !important; }
    #GridView1 td { padding:13px; border:0 !important; border-bottom:1px solid #edf0f6 !important; color:#475569; text-align:left; transition:background .2s; }
    #GridView1 tr:nth-child(odd):not(:first-child) { background:#f8faff; }
    #GridView1 tr:hover:not(:first-child) td { background:#eef2ff; }
    #GridView1 tr:last-child td { border-bottom:0 !important; }
    #GridView1 img { width:50px; height:50px; border-radius:9px; object-fit:cover; border:2px solid #e0e7ff; transition:transform .25s; }
    #GridView1 img:hover { transform:scale(1.12); }
    #GridView1 a { display:inline-block; padding:7px 12px; border-radius:7px; text-decoration:none; font-size:12px; font-weight:700; background:#e0e7ff; color:#4338ca; transition:background .2s,transform .2s; }
    #GridView1 a:hover { background:#c7d2fe; transform:translateY(-1px); }
    #GridView1 td:last-child a { background:#fee2e2; color:#b91c1c; }
    #GridView1 td:last-child a:hover { background:#fecaca; }
    @keyframes backgroundShift { 0%,100% { background-position:0% 50%; } 50% { background-position:100% 50%; } }
    @keyframes float { 0%,100% { transform:translateY(0); } 50% { transform:translateY(24px); } }
    @keyframes cardEnter { from { opacity:0; transform:translateY(25px); } to { opacity:1; transform:translateY(0); } }
    @media(max-width:700px) { #GridView1 { display:block; overflow-x:auto; width:calc(100% - 24px); white-space:nowrap; } #GridView1 th,#GridView1 td { padding:11px 10px; } }
    @media(max-width:480px) { .registration-container { padding:28px 12px; } .registration-card { padding:26px 19px; border-radius:16px; } .form-title { font-size:25px; } .form-subtitle { margin-bottom:20px; } .form-table tr { display:block; margin-bottom:8px; } .form-table>tbody>tr>td { display:block; width:100% !important; padding:5px 0; } .gender-list td { display:table-cell !important; width:auto !important; } .form-control { min-height:44px; } }
    @media(prefers-reduced-motion:reduce) { *,*::before,*::after { animation:none !important; transition:none !important; scroll-behavior:auto !important; } }
</style>

<div class="registration-container">

    <div class="registration-card">

        <h1 class="form-title">Registration Form</h1>

        <p class="form-subtitle">
            Please fill in your details to create an account
        </p>

        <table class="form-table">

            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="txtnm" runat="server"
                        CssClass="form-control"
                        placeholder="Enter your full name">
                    </asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txteml" runat="server"
                        TextMode="Email"
                        CssClass="form-control"
                        placeholder="Enter your email address">
                    </asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Gender:</td>
                <td>
                  <%--  <asp:RadioButtonList ID="rdbgen"
                        runat="server"
                        RepeatDirection="Horizontal"
                        CssClass="gender-list">

                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>

                    </asp:RadioButtonList>--%>
                    <asp:RadioButton ID="rdbmale" runat="server" Text="Male"/>

                    <asp:RadioButton ID="rdbfmale" runat="server" Text="Female"/>

                </td>
            </tr>

            <tr>
                <td>City:</td>
                <td>
                    <asp:DropDownList ID="drpct"
                        runat="server"
                        CssClass="form-control">

                        <asp:ListItem Text="-- Select City --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Rajkot" Value="Rajkot"></asp:ListItem>
                        <asp:ListItem Text="Ahmedabad" Value="Ahmedabad"></asp:ListItem>
                        <asp:ListItem Text="Surat" Value="Surat"></asp:ListItem>
                        <asp:ListItem Text="Vadodara" Value="Vadodara"></asp:ListItem>
                        <asp:ListItem Text="Jamnagar" Value="Jamnagar"></asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Mobile:</td>
                <td>
                    <asp:TextBox ID="txtmbl"
                        runat="server"
                        TextMode="Phone"
                        MaxLength="10"
                        CssClass="form-control"
                        placeholder="Enter 10-digit mobile number">
                    </asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Image:</td>
                <td>
                    <asp:FileUpload ID="flpimg"
                        runat="server"
                        CssClass="file-control"
                        accept="image/*" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnreg"
                        runat="server"
                        Text="Save Registration"
                        CssClass="btn-save" OnClick="btnreg_Click" />
                </td>
            </tr>

        </table>

    
    </div>

</div>
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        <br />
        <center>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="50" Width="50" ImageUrl='<%# Eval("Image") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>

    </form>
</body>
</html>




