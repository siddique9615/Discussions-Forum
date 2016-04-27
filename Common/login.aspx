<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CommonMasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Common_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
       
        DISSCUSSION FORUM<br />
        <br />
        <table>
            <tr>
                <td>USER NAME</td>
                <td>
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>PASSWORD</td>
                <td style="margin-left: 40px">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            </table>
        <br />
        <asp:Button ID="btnlogin" class="btn btn-primary dropdown-toggle " runat="server" OnClick="btnlogin_Click" Text="LOG IN" ButtonType="Image" BackColor="#009933" />
    
        <asp:Button ID="btnregister" class="btn btn-primary dropdown-toggle " runat="server" OnClick="btnregister_Click" Text="REGISTER" ButtonType="Image" BackColor="#009933" />
    
    </div>

</asp:Content>

