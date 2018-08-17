using DevExpress.DashboardCommon;
using DevExpress.DashboardWeb;
using DevExpress.DataAccess.ConnectionParameters;
using DevExpress.DataAccess.Sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp {
    public partial class Default : System.Web.UI.Page {

        protected void Page_Load(object sender, EventArgs e) {
            DashboardFileStorage dashboardFileStorage = new DashboardFileStorage("~/App_Data/Dashboards");
            DashboardConfigurator.Default.SetDashboardStorage(dashboardFileStorage);
            if (!IsPostBack)
                BindListBox();
        }

        void BindListBox() {
            ASPxListBox1.DataSource = DashboardConfigurator.Default.DashboardStorage.GetAvailableDashboardsInfo();
            ASPxListBox1.DataBind();
        }

        protected void ASPxListBox1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
            BindListBox();
        }
    }
}