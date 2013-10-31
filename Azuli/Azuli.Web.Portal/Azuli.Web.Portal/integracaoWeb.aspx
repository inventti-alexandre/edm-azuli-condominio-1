<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="integracaoWeb.aspx.cs" Inherits="Azuli.Web.Portal.integracaoWeb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
<legend class="accordionContent">Integração WEB - Recibo - Control Water</legend>
 <p>
        <br />
        <asp:FileUpload ID="fupProject" runat="server" />
    </p>
    <hr />
    <p>
        <asp:Button ID="btnCheck" runat="server" meta:resourcekey="btnCheck" 
            onclick="btnCheck_Click" />
    </p>
    <p>
        <asp:CustomValidator ID="cvErrorMessage" runat="server" Display="None"></asp:CustomValidator>
    </p>
    <p>
        <asp:Label ID="lblDescTotalRead" runat="server" Text="Total projects read: " meta:resourcekey="lblDescTotalRead" ></asp:Label>
        <asp:Label ID="lblTotalRead" runat="server" Text="0"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="grdProjects" runat="server"  CssClass="GridView" 
            EditRowStyle-CssClass="GridViewEdit" PagerStyle-CssClass="GridViewPager" 
            PageSize="20" AutoGenerateColumns="False" Width="98%" 
            ondatabound="grdProjects_DataBound" 
            onrowdatabound="grdProjects_RowDataBound" 
            EmptyDataText="There is no project to be updated/inserted"
            meta:resourcekey="grdProjects">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server" Checked="True" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="YearBase" HeaderText="YearBase" meta:resourcekey="YearBase" />
                <asp:BoundField DataField="ProjectType" HeaderText="ProjectType" meta:resourcekey="ProjectType" />
                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" meta:resourcekey="ProjectName" />
                <asp:BoundField DataField="SubProjectName" HeaderText="SubProjectName" meta:resourcekey="SubProjectName" />
                <asp:BoundField DataField="Status" HeaderText="Project Status" meta:resourcekey="Status" />
                <asp:BoundField DataField="ErrorMessage" HeaderText="Status" meta:resourcekey="ErrorMessage"  />
            </Columns>
            <PagerStyle CssClass="GridViewPager"></PagerStyle>
            <EditRowStyle CssClass="GridViewEdit"></EditRowStyle>
        </asp:GridView>
    </p>
    <p>
        <asp:Button ID="cmdSave" runat="server" Text="Save" meta:resourcekey="cmdSave" 
            onclick="cmdSave_Click" Enabled="False"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="cmdQueue" runat="server" onclick="cmdQueue_Click"  meta:resourcekey="cmdQueue"
            Text="Queue" />
    </p>
    <p>
        <asp:Label ID="lblSaved" runat="server" meta:resourcekey="lblSaved" Text="Dados armazenados com sucesso" 
            Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
        </fieldset>

</asp:Content>
