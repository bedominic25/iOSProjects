package controllers

import (
	"github.com/abbot/go-http-auth"
	"github.com/astaxie/beego"
	"regexp"
)

type AdminController struct {
	beego.Controller
}

func (this *AdminController) Prepare() {
	a := auth.NewBasicAuthenticator("example.com", Secret)
	if username := a.CheckAuth(this.Ctx.Request); username == "" {
		a.RequireAuth(this.Ctx.ResponseWriter, this.Ctx.Request)
	}
}

func (this *AdminController) Get() {
	this.TplName = "index.tpl"
}

func Secret(user, realm string) string {
	if user == "john" {
		// password is "hello"
		return "$1$dlPL2MqE$oQmn16q49SqdmhenQuNgs1"
	}
	return ""
}

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
	authJSON := AuthJSON{"AUTH"}
	this.Data["json"] = &authJSON
	defer this.ServeJSON()

	var intcount int
	count := this.GetSession("count")
	un := this.GetSession("un")

	if count == nil {
		intcount = 0
	} else {
		intcount = count.(int)
	}
	intcount = intcount + 1
	this.SetSession("count", intcount)

	this.Data["User"] = un
	this.Data["Count"] = intcount

//	this.TplName = "index.tpl"
}

func checkPassword(password string) (b bool) {
	if ok, _ := regexp.MatchString("^[a-zA-Z0-9]{4,16}$", password); !ok {
		return false
	}
	return true
}

func checkUsername(username string) (b bool) {
	if ok, _ := regexp.MatchString("^[a-zA-Z0-9]{4,16}$", username); !ok {
		return false
	}
	return true
}
