﻿<%@ Page Title="Trade Handling" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TradeHandling.aspx.cs" Inherits="Construction_Asset_Management_System.TradeHandling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/checkbox.css" rel="stylesheet" type="text/css" />
    <h4 class="well text-center" style="padding: 8px">Worker List with Trades</h4>
    <div class="row text-center">
        <div class="col-sm-12 form-inline">
            <div class="input-group">
                <asp:TextBox ID="_txtSearch" runat="server" CssClass="form-control" />
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" ID="_btnSearch" CssClass="btn btn-info" OnClick="_btnSearch_Click"><span class="glyphicon glyphicon-search"></span> Search</asp:LinkButton>
                </span>
            </div>
            <asp:LinkButton runat="server" ID="_btnAdd" CssClass="btn btn-info " OnClick="_btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> Add</asp:LinkButton>
            <asp:LinkButton runat="server" ID="_btnShowList" CssClass="btn btn-info" OnClick="_btnShowList_Click" Visible="false"><span class="glyphicon glyphicon-list-alt"></span> Show Full List</asp:LinkButton>
            <%--<asp:LinkButton runat="server" ID="_btnNoReq" CssClass="btn btn-info" Visible="false" OnClick="_btnNoReq_Click"><span class="glyphicon glyphicon-list-alt"></span> Show Full List</asp:LinkButton>--%>
        </div>
    </div>
    <br />
    <asp:ListView ID="_listviewTradeHandling" runat="server" DataSourceID="DataSourceTradeHandling" DataKeyNames="WORKERID" GroupItemCount="3" OnItemDataBound="_listviewTradeHandling_ItemDataBound">
        <%--<AlternatingItemTemplate>
            <td runat="server" style="">WORKERID:
                <asp:Label Text='<%# Eval("WORKERID") %>' runat="server" ID="WORKERIDLabel" /><br />
                WORKERNAME:
                <asp:Label Text='<%# Eval("WORKERNAME") %>' runat="server" ID="WORKERNAMELabel" /><br />
                LABORTYPENAME:
                <asp:Label Text='<%# Eval("LABORTYPENAME") %>' runat="server" ID="LABORTYPENAMELabel" /><br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="">WORKERID:
                <asp:Label Text='<%# Eval("WORKERID") %>' runat="server" ID="WORKERIDLabel1" /><br />
                WORKERNAME:
                <asp:TextBox Text='<%# Bind("WORKERNAME") %>' runat="server" ID="WORKERNAMETextBox" /><br />
                LABORTYPENAME:
                <asp:TextBox Text='<%# Bind("LABORTYPENAME") %>' runat="server" ID="LABORTYPENAMETextBox" /><br />
                <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><br />
                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
            </td>
        </EditItemTemplate>--%>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <%--<EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>--%>
        <GroupTemplate>
            <div runat="server" id="itemPlaceholderContainer">
                <div runat="server" id="itemPlaceholder">
                </div>
            </div>
        </GroupTemplate>
        <%--<InsertItemTemplate>
            <td runat="server" style="">WORKERNAME:
                <asp:TextBox Text='<%# Bind("WORKERNAME") %>' runat="server" ID="WORKERNAMETextBox" /><br />
                LABORTYPENAME:
                <asp:TextBox Text='<%# Bind("LABORTYPENAME") %>' runat="server" ID="LABORTYPENAMETextBox" /><br />
                <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><br />
                <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
            </td>
        </InsertItemTemplate>--%>
        <ItemTemplate>
            <div class="col-sm-4">
                <asp:Panel ID="Panel1" runat="server">
                    <div runat="server" style="" class="well">
                        <asp:Image runat="server" ImageUrl='<%# Eval("WORKERIMAGE") %>' CssClass="img-responsive img-thumbnail center-block" AlternateText="Not Available" Width="100" Height="100" />
                        <label class="control-label">ID:</label>
                        <asp:Label Text='<%# Eval("WORKERID") %>' runat="server" ID="WORKERIDLabel" /><br />
                        <label class="control-label">Worker Name:</label>
                        <asp:Label Text='<%# Eval("WORKERNAME") %>' runat="server" ID="WORKERNAMELabel" /><br />
                        <label class="control-label">Labor Career type:</label>
                        <asp:Label Text='<%# Eval("LABORTYPENAME") %>' runat="server" ID="LABORTYPENAMELabel" /><br />
                        <label class="control-label text-info">Trade List</label>
                        <asp:BulletedList ID="_bulletWorkerTrade" runat="server" DataSourceID="DataSourceWorkerTradeListBox" DataTextField="TRADENAME" Height="200" CssClass="" BulletStyle="Square"></asp:BulletedList>
                        <asp:SqlDataSource runat="server" ID="DataSourceWorkerTradeListBox" ConnectionString='<%$ ConnectionStrings:ConnString_WEB_ASSET_DB %>' SelectCommand="SELECT TRADENAME FROM TRADE JOIN WORKERTRADE ON TRADE.TRADEID=WORKERTRADE.TRADEID WHERE WORKERTRADE.WORKERID = @WORKERID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="WORKERIDLabel" PropertyName="Text" Name="WORKERID" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <div class="text-center">
                            <asp:HyperLink ID="_hyperlinkWorkerEdit" runat="server" NavigateUrl='<%#"~/Worker_CRUD.aspx?id="+Eval("WORKERID") %>' CssClass="btn btn-link">Edit Worker</asp:HyperLink>
                            <asp:HyperLink ID="_hyperlinkTradeEdit" runat="server" NavigateUrl='<%#"~/TradeHandling_CRUD.aspx?id="+Eval("WORKERID") %>' Text="" CssClass="btn btn-link"></asp:HyperLink>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server">
                <div runat="server">
                    <div runat="server">
                        <div runat="server" id="groupPlaceholderContainer" style="" border="0">
                            <div runat="server" id="groupPlaceholder">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div runat="server">
                <div runat="server" style="">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="True" ButtonCssClass="btn btn-info btn-sm" />
                            <asp:NumericPagerField NumericButtonCssClass="label label-success" CurrentPageLabelCssClass="badge" />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="btn btn-info btn-sm" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </LayoutTemplate>
        <%--<SelectedItemTemplate>
            <td runat="server" style="">WORKERID:
                <asp:Label Text='<%# Eval("WORKERID") %>' runat="server" ID="WORKERIDLabel" /><br />
                WORKERNAME:
                <asp:Label Text='<%# Eval("WORKERNAME") %>' runat="server" ID="WORKERNAMELabel" /><br />
                LABORTYPENAME:
                <asp:Label Text='<%# Eval("LABORTYPENAME") %>' runat="server" ID="LABORTYPENAMELabel" /><br />
            </td>
        </SelectedItemTemplate>--%>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="DataSourceTradeHandling" ConnectionString='<%$ ConnectionStrings:ConnString_WEB_ASSET_DB %>' SelectCommand="SELECT WORKER.WORKERID, WORKER.WORKERIMAGE, WORKER.WORKERFNAME + ' ' + WORKER.WORKERLNAME AS WORKERNAME, LABORTYPE.LABORTYPENAME FROM LABORTYPE INNER JOIN WORKER ON LABORTYPE.LABORTYPEID = WORKER.LABORTYPEID"></asp:SqlDataSource>
</asp:Content>
