<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="PostNewQuestion.aspx.cs" Inherits="Common_PostNewQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Post New Question :-<br />
    <table>
        <tr>
            <td>Category</td>
            <td>
                <asp:DropDownList ID="ddlcategory" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Question</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtquestion" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnaddquestion" runat="server" Text="Add Question" />
</asp:Content>

