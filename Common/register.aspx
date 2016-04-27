<%@ Page Title="" Language="C#" MasterPageFile="~/Common/CommonMasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Common_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     &nbsp;Sign up for New Account<br />
        <table>
            <tr>
                <td>Profile Name:</td>
                <td>
                    <asp:TextBox ID="txtprofilename" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td>
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Profile Pic</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <asp:RadioButtonList ID="rblgender" runat="server" DataSourceID="SqlDataSource1" DataTextField="gender" DataValueField="gid">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>E-Mail:</td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Confirm Password</td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtcnfmpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Contact No:</td>
                <td>
                    <asp:TextBox ID="txtcontactno" runat="server" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Is Active</td>
                <td>
                    <asp:CheckBox ID="cbisactive" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="SUBMIT" ButtonType="Image" />
        &nbsp;&nbsp;<asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="LOG IN" ButtonType="Image" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
       
      
    <asp:Panel ID="Panel1" runat="server">
      <asp:GridView ID="gvmain" runat="server" AutoGenerateColumns="False" DataKeyNames="lid" DataSourceID="SqlDataSource3" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="lid" HeaderText="lid" InsertVisible="False" ReadOnly="True" SortExpression="lid" />
                <asp:BoundField DataField="profilename" HeaderText="profilename" SortExpression="profilename" />
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
            <asp:TemplateField HeaderText="profilepic">
                <ItemTemplate>
                     <%--<asp:Image src="Handler2.ashx?lid=<%#Eval("lid") %>"  ID="Image1" runat="server" height="100px" width="100px" alt="abu"  />--%>
                    <img src="../Handler2.ashx?lid=<%#Eval("lid") %>" height="100px" width="100px" alt="abu"   />
        
                </ItemTemplate> 
            </asp:TemplateField>

                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="cnfmpassword" HeaderText="cnfmpassword" SortExpression="cnfmpassword" />
                <asp:BoundField DataField="gid" HeaderText="gid" SortExpression="gid" />
                <asp:BoundField DataField="contactno" HeaderText="contactno" SortExpression="contactno" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="rollid" HeaderText="rollid" SortExpression="rollid" />
                <asp:BoundField DataField="createdon" HeaderText="createdon" SortExpression="createdon" />
                <asp:CheckBoxField DataField="isactive" HeaderText="isactive" SortExpression="isactive" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mycon %>" DeleteCommand="DELETE FROM [login] WHERE [lid] = @lid" InsertCommand="INSERT INTO [login] ([profilename], [username], [profilepic], [email], [password], [cnfmpassword], [gid], [contactno], [address], [rollid], [createdon], [isactive]) VALUES (@profilename, @username, @profilepic, @email, @password, @cnfmpassword, @gid, @contactno, @address, @rollid, @createdon, @isactive)" SelectCommand="SELECT * FROM [login]" UpdateCommand="UPDATE [login] SET [profilename] = @profilename, [username] = @username, [profilepic] = @profilepic, [email] = @email, [password] = @password, [cnfmpassword] = @cnfmpassword, [gid] = @gid, [contactno] = @contactno, [address] = @address, [rollid] = @rollid, [createdon] = @createdon, [isactive] = @isactive WHERE [lid] = @lid">
            <DeleteParameters>
                <asp:Parameter Name="lid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="profilename" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="profilepic" Type="Object" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="cnfmpassword" Type="String" />
                <asp:Parameter Name="gid" Type="Int32" />
                <asp:Parameter Name="contactno" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="rollid" Type="Int32" />
                <asp:Parameter Name="createdon" Type="DateTime" />
                <asp:Parameter Name="isactive" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="profilename" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="profilepic" Type="Object" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="cnfmpassword" Type="String" />
                <asp:Parameter Name="gid" Type="Int32" />
                <asp:Parameter Name="contactno" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="rollid" Type="Int32" />
                <asp:Parameter Name="createdon" Type="DateTime" />
                <asp:Parameter Name="isactive" Type="Boolean" />
                <asp:Parameter Name="lid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </asp:Panel>
</asp:Content>

