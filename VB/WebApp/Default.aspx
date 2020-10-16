<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApp.Default" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.1.Web.WebForms, Version=18.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <script type="text/javascript">
        var openDashboardExtension;
        var dashboardControl;
        function openDashboard(id) {
            debugger;
            if(!!openDashboardExtension) {
                openDashboardExtension.loadDashboard(id);
                popup.Hide();
            }
        }
        function onSelectedIndexChanged(s, e) {
            openDashboard(s.GetValue());
        }
        function onBeforeRender(sender) {
            dashboardControl = sender.GetDashboardControl();
            openDashboardExtension = dashboardControl.findExtension("open-dashboard");
            if(!openDashboardExtension) {
                openDashboardExtension = new DevExpress.Dashboard.OpenDashboardExtension(dashboardControl);
                dashboardControl.registerExtension(openDashboardExtension);
            }
        }
        function onDashboardTitleToolbarUpdated(s, e) {
            //uncomment these lines to show the Dashboards button only on mobile devices
            //var mobileExtension = dashboardControl.findExtension("mobile-layout");
            //if(mobileExtension && mobileExtension.mobileLayoutEnabled()) {
                _iconBack = 'dx-dashboard-back';
                _dashboardsButtonName = 'Dashboards';
                _flexParent = 'dx-dashboard-flex-parent';
                _dashboardsButton = 'dx-dashboards-button';
                _dashboardTruncated = 'dx-dashboard-truncated';
                _ellipsisText = 'dx-dashboard-ellipsis';
                e.Options.navigationItems.push({
                    type: 'button',
                    template: function() {
                        return $('<div/>')
                            .addClass([_flexParent, _ellipsisText].join(' '))
                            .append($('<svg><use xlink:href="#' + _iconBack + '" /></svg>'))
                            .append($('<div/>').text(_dashboardsButtonName).addClass([_dashboardsButton, _dashboardTruncated].join(' ')));
                    },
                    click: function() {
                        console.log('click to show dashboards');
                        listBox.PerformCallback();
                        popup.Show();
                    }
                });
            //}
        }
        function onShown(s, e) {
            var popupH = popup.GetContentHeight();
            listBox.SetHeight(popupH);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxPopupControl ID="popup" runat="server" ClientInstanceName="popup" HeaderText="Available Dashboards" Modal="true" Maximized="true">
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <dx:ASPxListBox ID="ASPxListBox1" runat="server"
                            ClientInstanceName="listBox" AutoPostBack="false" ValueType="System.String"
                            ValueField="ID" TextField="Name" Width="100%" OnCallback="ASPxListBox1_Callback">
                            <ItemTemplate>
                                <div style="height: 70px"><%#Eval("Name")%></div>
                            </ItemTemplate>
                            <ClientSideEvents SelectedIndexChanged="onSelectedIndexChanged" />
                        </dx:ASPxListBox>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <ClientSideEvents Shown="onShown" />
            </dx:ASPxPopupControl>
            <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" UseDashboardConfigurator="true" WorkingMode="ViewerOnly">
                <ClientSideEvents
                    BeforeRender="onBeforeRender"
                    DashboardTitleToolbarUpdated="onDashboardTitleToolbarUpdated" />
            </dx:ASPxDashboard>
        </div>
    </form>
</body>
</html>