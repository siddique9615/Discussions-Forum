<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="categories.aspx.cs" Inherits="Admin_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    CATEGORIES</p>
<table>
    <tr>
        <td>Category</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="cid">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [categories]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
<asp:TextBox ID="txtinsert" runat="server"></asp:TextBox>
<asp:Button ID="btninsert" class="btn btn-primary dropdown-toggle " runat="server" OnClick="btninsert_Click" Text="INSERT" BackColor="Black" />
<br />
</asp:Content>

