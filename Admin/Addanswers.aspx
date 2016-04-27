<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Addanswers.aspx.cs" Inherits="Admin_answers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>Question</td>
            <td>
                <asp:TextBox ID="txtquestion" runat="server" TextMode="MultiLine" Width="685px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Answer</td>
            <td>
                <asp:TextBox ID="txtanswer" runat="server" TextMode="MultiLine" Width="685px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnaddanswers" class="btn btn-primary dropdown-toggle " runat="server" OnClick="btnadd_Click" Text="ADD Answers" BackColor="Black"  />
&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
     <div class="panel-body">
                            <div class="table-responsive">
              
                                <asp:Panel ID="Panel1" runat="server">   
    <asp:GridView  class="table table-striped table-bordered table-hover" ID="gvmain" runat="server" AutoGenerateColumns="False" DataKeyNames="aid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvmain_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="aid" HeaderText="aid" InsertVisible="False" ReadOnly="True" SortExpression="aid" />
            <asp:BoundField DataField="qid" HeaderText="qid" SortExpression="qid" />
            <asp:BoundField DataField="answer" HeaderText="answer" SortExpression="answer" />
            <asp:BoundField DataField="answeredby" HeaderText="answeredby" SortExpression="answeredby" />
            <asp:BoundField DataField="answeredon" HeaderText="answeredon" SortExpression="answeredon" />
            <asp:CheckBoxField DataField="isactive" HeaderText="isactive" SortExpression="isactive" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [answers]" DeleteCommand="DELETE FROM [answers] WHERE [aid] = @aid" InsertCommand="INSERT INTO [answers] ([qid], [answer], [answeredby], [answeredon], [isactive]) VALUES (@qid, @answer, @answeredby, @answeredon, @isactive)" UpdateCommand="UPDATE [answers] SET [qid] = @qid, [answer] = @answer, [answeredby] = @answeredby, [answeredon] = @answeredon, [isactive] = @isactive WHERE [aid] = @aid">
        <DeleteParameters>
            <asp:Parameter Name="aid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="qid" Type="Int32" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="answeredby" Type="Int32" />
            <asp:Parameter Name="answeredon" Type="DateTime" />
            <asp:Parameter Name="isactive" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="qid" Type="Int32" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="answeredby" Type="Int32" />
            <asp:Parameter Name="answeredon" Type="DateTime" />
            <asp:Parameter Name="isactive" Type="Boolean" />
            <asp:Parameter Name="aid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

                                </asp:Panel> 
                                
                                                       
                                                <%--  <table class="table table-striped table-bordered table-hover">--%>
                                    </div>
         </div>
</asp:Content>

