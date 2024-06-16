<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/apps/Uidesk.Master" CodeBehind="ReportWhatsAppResponse.aspx.vb" Inherits="ICC.ReportWhatsAppResponse" %>


<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-xl-12 col-lg-12 col-12">
        <div class="box">
            <div class="box-header with-border">
                <h4 class="box-title">Report Response Time</h4>
            </div>
            <div class="box-body p-15">
                <div class="row" style="margin-bottom: -15px;">
                    <div class="col-sm-2">
                        <label>Start Date</label>
                        <dx:ASPxDateEdit ID="dt_strdate" runat="server" CssClass="form-control input-sm" Width="100%" EditFormatString="yyyy-MM-dd">
                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText" ValidationGroup="SMLvalidationGroup">
                                <RequiredField IsRequired="true" ErrorText="Must be filled" />
                            </ValidationSettings>
                        </dx:ASPxDateEdit>
                    </div>
                    <div class="col-sm-2">
                        <label>End Date</label>
                        <dx:ASPxDateEdit ID="dt_endate" runat="server" CssClass="form-control input-sm" Width="100%" EditFormatString="yyyy-MM-dd">
                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText" ValidationGroup="SMLvalidationGroup">
                                <RequiredField IsRequired="true" ErrorText="Must be filled" />
                            </ValidationSettings>
                        </dx:ASPxDateEdit>
                    </div>
                    <div class="col-sm-2">
                        <label>Channel</label>
                        <dx:ASPxComboBox ID="CmbChannel" runat="server" CssClass="form-control input-sm" Width="100%" DataSourceID="SourceChannel"
                            TextField="Name" ValueField="Name">
                            <Columns>
                                <dx:ListBoxColumn FieldName="Name" Caption="Channel"></dx:ListBoxColumn>
                            </Columns>
                            <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText" ValidationGroup="SMLvalidationGroup">
                                <RequiredField IsRequired="true" ErrorText="Must be filled" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </div>
                    <div class="col-sm-2" style="margin-top: 5px;">
                        <br />
                        <dx:ASPxButton ID="btn_Submit" runat="server" Theme="Metropolis" AutoPostBack="False" Text="Submit" ValidationGroup="SMLvalidationGroup"
                            HoverStyle-BackColor="#0072C6" Height="33px" Width="100%" HoverStyle-Border-BorderColor="#0072C6">
                        </dx:ASPxButton>
                    </div>
                </div>
                <hr />
                <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="ASPxGridView1" runat="server"
                    DataSourceID="TempBaseTrx" Width="100%" Styles-Header-Font-Bold="true" Theme="MetropolisBlue">
                    <SettingsPager>
                        <AllButton Text="All">
                        </AllButton>
                        <NextPageButton Text="Next &gt;">
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                        </PrevPageButton>
                        <PageSizeItemSettings Visible="true" Items="10, 15, 20" ShowAllItem="true" />
                    </SettingsPager>
                    <Settings ShowFilterRow="true" ShowFilterRowMenu="false" ShowGroupPanel="true" ShowFilterBar="Hidden" EnableFilterControlPopupMenuScrolling="true"
                        ShowVerticalScrollBar="false" ShowFooter="false" ShowHorizontalScrollBar="true" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Agent Name" FieldName="Agentname" Width="200px" CellStyle-HorizontalAlign="Left"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cust Name" FieldName="CustName" Width="200px"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Status" Settings-AutoFilterCondition="Contains" FieldName="status" Width="200px"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Note" Settings-AutoFilterCondition="Contains" FieldName="note" Width="200px"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Date Received" FieldName="Whatsapp_DateConvert" Width="200px" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd hh:mm:ss"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn Caption="Date Reply" Settings-AutoFilterCondition="Contains" FieldName="DateReplyConvert" Width="200px" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd hh:mm:ss"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Time Reply" Settings-AutoFilterCondition="Contains" FieldName="WaktuReply" Width="200px"></dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="End Chat Time" Settings-AutoFilterCondition="Contains" FieldName="DateEndConvert" Width="200px" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd hh:mm:ss"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Duration Chat" Settings-AutoFilterCondition="Contains" FieldName="WaktuChat" Width="200px"></dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <hr />
                <div class="row">
                    <div class="col-sm-2">
                        <asp:DropDownList runat="server" ID="ddList" Height="30" CssClass="form-control input-sm">
                            <asp:ListItem Value="xlsx" Text="Excel" />
                            <asp:ListItem Value="xls" Text="Excel 97-2003" />
                            <asp:ListItem Value="pdf" Text="PDF" />
                            <asp:ListItem Value="rtf" Text="RTF" />
                            <asp:ListItem Value="csv" Text="CSV" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-sm-2">
                        <dx:ASPxButton ID="btn_Export" runat="server" Text="Export" Theme="Metropolis"
                            HoverStyle-BackColor="gray" Height="30px" Width="100%" HoverStyle-Border-BorderColor="gray">
                        </dx:ASPxButton>
                    </div>
                </div>
            </div>
            <div class="box-footer with-border">
            </div>
        </div>
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1"></dx:ASPxGridViewExporter>
    <asp:SqlDataSource ID="TempBaseTrx" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SourceChannel" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" runat="server"></asp:SqlDataSource>
</asp:Content>
