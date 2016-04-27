<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserMasterPage.master" AutoEventWireup="true" CodeFile="IAnsweredQuestions.aspx.cs" Inherits="User_IAnsweredQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:GridView class="table table-striped table-bordered table-hover" ID="gvmain" runat="server" AutoGenerateColumns="False" DataKeyNames="aid" DataSourceID="SqlDataSource1" Width="746px">
        <Columns>
            <asp:BoundField DataField="aid" HeaderText="aid" InsertVisible="False" ReadOnly="True" SortExpression="aid" />
            <asp:BoundField DataField="qid" HeaderText="qid" SortExpression="qid" />
            <asp:BoundField DataField="question" HeaderText="question" SortExpression="question" />
            <asp:BoundField DataField="answer" HeaderText="answer" SortExpression="answer" />
            <asp:BoundField DataField="answeredon" HeaderText="answeredon" SortExpression="answeredon" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT answers.aid, answers.qid, questions.question, answers.answer, answers.answeredon FROM answers INNER JOIN questions ON answers.qid = questions.qid WHERE (answers.answeredby = @answeredby)">
        <SelectParameters>
            <asp:SessionParameter Name="answeredby" SessionField="lid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


     <br />



</asp:Content>



