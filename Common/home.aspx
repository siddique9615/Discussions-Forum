<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CommonMasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Common_MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 770px;
        }
        .auto-style4 {
            width: 480px;
        text-align: right;
    }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                    <asp:Button ID="btnback" class="btn btn-primary dropdown-toggle " runat="server" OnClick="btnback_Click" Text="BACK" BackColor="Black" />
    
    
        
    
    
        <table class="auto-style1" style="width:100%">
            <tr>
                <td class="auto-style4">
                  
                    <asp:GridView  class="table table-striped table-bordered table-hover" ID="gvmain1" runat="server" AutoGenerateColumns="False" DataKeyNames="qid" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="100%">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Image" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("qid") %>'></asp:Label>

                                            </td>
                                            
                                            <td>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("question") %>'></asp:Label>

                                                 </td></tr>
                                        <tr>
                                            <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("category") %>'></asp:Label>

                                            </td>
                                           
                                            <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Posted by  <asp:Label ID="Label1" runat="server" Text='<%# Bind("username") %>'></asp:Label> &nbsp; On 
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("postedon") %>'></asp:Label>


                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                          <%--  <asp:TemplateField HeaderText="qid" InsertVisible="False" SortExpression="qid">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("qid") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="question" SortExpression="question">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="category" SortExpression="category">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="username" SortExpression="username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    postedby
                                </HeaderTemplate>
                                <ItemTemplate>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="postedon" SortExpression="postedon">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("postedon") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [questions] WHERE [qid] = @qid" InsertCommand="INSERT INTO [questions] ([question], [cid], [postedby], [postedon], [isactive]) VALUES (@question, @cid, @postedby, @postedon, @isactive)" SelectCommand="SELECT questions.qid, questions.question, categories.category, login.username, questions.postedon FROM questions INNER JOIN login ON questions.postedby = login.lid INNER JOIN categories ON questions.cid = categories.cid" UpdateCommand="UPDATE [questions] SET [question] = @question, [cid] = @cid, [postedby] = @postedby, [postedon] = @postedon, [isactive] = @isactive WHERE [qid] = @qid">
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
                        <UpdateParameters>
                            <asp:Parameter Name="question" Type="String" />
                            <asp:Parameter Name="cid" Type="Int32" />
                            <asp:Parameter Name="postedby" Type="Int32" />
                            <asp:Parameter Name="postedon" Type="DateTime" />
                            <asp:Parameter Name="isactive" Type="Boolean" />
                            <asp:Parameter Name="qid" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
              
                <td class="auto-style4">
                    <asp:GridView class="table table-striped table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="aid" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:TemplateField>
                                 <ItemTemplate>
                                      <table>
                                          <tr>
                                              <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("aid") %>'></asp:Label>

                                              </td>
                                             
                                              <td>
                                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("question") %>'></asp:Label>

                                              </td>
                                          </tr>
                                          <tr>
                                              <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("answer") %>'></asp:Label>

                                              </td>
                                            
                                              <td>                                           
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Answered by <asp:Label ID="Label1" runat="server" Text='<%# Bind("username") %>'></asp:Label> &nbsp; On
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("answeredon") %>'></asp:Label>
                                                   
                                              </td>
                                          </tr>
                                      </table>
                                      </ItemTemplate>
                            </asp:TemplateField>
<%--                                 </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="aid" InsertVisible="False" SortExpression="aid">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("aid") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("aid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="question" SortExpression="question">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("question") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="answer" SortExpression="answer">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("answer") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("answer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="username" SortExpression="username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderTemplate>
                                    answeredby
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="answeredon" SortExpression="answeredon">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("answeredon") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("answeredon") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT answers.aid, questions.question, answers.answer, login.username, answers.answeredon FROM answers INNER JOIN login ON answers.answeredby = login.lid INNER JOIN questions ON answers.qid = questions.qid"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    
        <br />
    
    
    
    <br />
    <br />
    <br />
    
    </asp:Content>

