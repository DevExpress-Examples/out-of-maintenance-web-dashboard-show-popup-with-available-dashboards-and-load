# Web Dashboard - How to show the popup with available dashboards and load them

<p>
This example illustrates how to use the ASPxPopup control with ASPxListBox and show available dashboards in the list box.
First of all, place ASPxListBox into the popup. Then, bind the list box on loading the page using the <a href="https://docs.devexpress.com/Dashboard/DevExpress.DashboardWeb.IDashboardStorage.GetAvailableDashboardsInfo">GetAvailableDashboardsInfo</a> method.
After that, handle the client-side <a href="https://documentation.devexpress.com/AspNet/DevExpress.Web.Scripts.ASPxClientListBox.SelectedIndexChanged.event">ASPxListBox's SelectedIndexChanged</a> event and use the loadDashboard method to load the selected dashboard.
To show the popup, it is possible to handle the <a href="https://docs.devexpress.com/Dashboard/DevExpress.DashboardWeb.Scripts.ASPxClientDashboard.DashboardTitleToolbarUpdated">DashboardTitleToolbarUpdated</a> event and add a special button there.

This example also shows an approach to detect a mobile layout and add a special button only on mobile devices.
</p> 