Imports DevExpress.DashboardCommon
Imports DevExpress.DashboardWeb
Imports DevExpress.DataAccess.ConnectionParameters
Imports DevExpress.DataAccess.Sql
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Namespace WebApp
    Partial Public Class [Default]
        Inherits System.Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            Dim dashboardFileStorage As New DashboardFileStorage("~/App_Data/Dashboards")
            DashboardConfigurator.Default.SetDashboardStorage(dashboardFileStorage)
            If Not IsPostBack Then
                BindListBox()
            End If
        End Sub

        Private Sub BindListBox()
            ASPxListBox1.DataSource = DashboardConfigurator.Default.DashboardStorage.GetAvailableDashboardsInfo()
            ASPxListBox1.DataBind()
        End Sub

        Protected Sub ASPxListBox1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
            BindListBox()
        End Sub
    End Class
End Namespace