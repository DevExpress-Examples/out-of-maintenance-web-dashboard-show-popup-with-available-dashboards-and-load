*Files to look at*:

* [Default.aspx](./CS/WebApp/Default.aspx) (VB: [Default.aspx](./VB/WebApp/Default.aspx))
* [Default.aspx.cs](./CS/WebApp/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebApp/Default.aspx.vb))

# Dashboard for Web Forms - How to show the popup with available dashboards and load them
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/145132759/)**
<!-- run online end -->

This example illustrates how to use the `ASPxPopup` control with `ASPxListBox` and show available dashboards in the list box.

## Example Structure

1. Place `ASPxListBox` into the popup. 
1. Bind the list box on loading the page. For this, use the [IDashboardStorage.GetAvailableDashboardsInfo](https://docs.devexpress.com/Dashboard/DevExpress.DashboardWeb.IDashboardStorage.GetAvailableDashboardsInfo) method.
1. Handle the client-side [ASPxClientListBox.SelectedIndexChanged](https://docs.devexpress.com/AspNet/js-ASPxClientListBox.SelectedIndexChanged) event and use the [OpenDashboardExtension.loadDashboard](https://docs.devexpress.com/Dashboard/js-DevExpress.Dashboard.Designer.OpenDashboardExtension#js_devexpress_dashboard_designer_opendashboardextension_loaddashboard_dashboardid_) method to load the selected dashboard.
1. Handle the [DashboardTitleToolbarUpdated](https://docs.devexpress.com/Dashboard/DevExpress.DashboardWeb.Scripts.ASPxClientDashboard.DashboardTitleToolbarUpdated) event and add a button to show the popup when a user clicks the button.

This example also shows how to detect a mobile layout and add a button only on mobile devices.

## Documentation

- [Dashboard Panel](https://docs.devexpress.com/Dashboard/119771/web-dashboard/ui-elements-and-customization/ui-elements/dashboard-panel)
- [Dashboard Title](https://docs.devexpress.com/Dashboard/117383/web-dashboard/ui-elements-and-customization/ui-elements/dashboard-title)
- [Mobile Layout](https://docs.devexpress.com/Dashboard/119662/web-dashboard/ui-elements-and-customization/mobile-layout)

## More Examples

- [Dashboard Panel](https://github.com/DevExpress/dashboard-extensions/blob/master/docs/dashboard-panel.md)
