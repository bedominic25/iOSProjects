package routers

import (
	"fmt"
	"SkyTaxi/controllers"
	"github.com/astaxie/beego"
)

func init() {
	fmt.Println("Routers init")
	beego.Router("/admin", &controllers.AdminController{})
	beego.Router("/", &controllers.MainController{})
	beego.Router("/home", &controllers.DashboardController{})

	beego.Router("/aircraft", &controllers.AircraftController{})
	beego.Router("/services", &controllers.ServiceController{})
	beego.Router("/sites", &controllers.SiteController{})

	beego.Router("/register", &controllers.RegisterController{})
	beego.Router("/verify", &controllers.VerifyController{})

	beego.Router("/codes", &controllers.PromotionsController{})
}
