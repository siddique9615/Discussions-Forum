<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="Addquestions.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>CATEGORY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                <asp:DropDownList ID="ddlcategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="cid" AutoPostBack="True" AppendDataBoundItems="True">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [categories]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>QUESTION</td>
            <td>
                <asp:TextBox ID="txtquestion" runat="server" TextMode="MultiLine" Width="624px"></asp:TextBox>
            &nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <br />
    <asp:Button class="btn btn-primary dropdown-toggle " ID="btnaddquestion" runat="server" OnClick="btnaddquestion_Click" Text="ADD QUESTION" BackColor="#009933" />
    &nbsp;&nbsp;
    <br />
     <br />
    <asp:Panel ID="Panel1" runat="server">

    <asp:GridView class="table table-striped table-bordered table-hover" ID="gvmain" runat="server" AutoGenerateColumns="False" DataKeyNames="qid" DataSourceID="SqlDataSource2" >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="qid" HeaderText="qid" InsertVisible="False" ReadOnly="True" SortExpression="qid" />
            <asp:BoundField DataField="question" HeaderText="question" SortExpression="question" />
            <asp:BoundField DataField="cid" HeaderText="cid" SortExpression="cid" />
            <asp:BoundField DataField="postedby" HeaderText="postedby" SortExpression="postedby" />
            <asp:BoundField DataField="postedon" HeaderText="postedon" SortExpression="postedon" />
            <asp:CheckBoxField DataField="isactive" HeaderText="isactive" SortExpression="isactive" />
            <asp:TemplateField></asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [questions] WHERE ([postedby] = @postedby)" DeleteCommand="DELETE FROM [questions] WHERE [qid] = @qid" InsertCommand="INSERT INTO [questions] ([question], [cid], [postedby], [postedon], [isactive]) VALUES (@question, @cid, @postedby, @postedon, @isactive)" UpdateCommand="UPDATE [questions] SET [question] = @question, [cid] = @cid, [postedby] = @postedby, [postedon] = @postedon, [isactive] = @isactive WHERE [qid] = @qid">
        <DeleteParameters>
            <asp:Parameter Name="qid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="cid" Type="Int32" />
            <asp:Parameter Name="postedby" Type="Int32" />
            <asp:Parameter Name="postedon" Type="DateTime" />
            <asp:Parameter Name="isactive" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="postedby" SessionField="lid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="cid" Type="Int32" />
            <asp:Parameter Name="postedby" Type="Int32" />
            <asp:Parameter Name="postedon" Type="DateTime" />
            <asp:Parameter Name="isactive" Type="Boolean" />
            <asp:Parameter Name="qid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </asp:Panel>

</asp:Content>

