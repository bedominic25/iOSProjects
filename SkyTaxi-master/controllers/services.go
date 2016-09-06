package controllers

import (
	"SkyTaxi/models"
	"github.com/astaxie/beego"
	"net/http"
)

type ServiceController struct {
	beego.Controller
}

func (this *ServiceController) Get() {
	items, _ := models.GetAllServices()
	this.Data["json"] = &items
	defer this.ServeJSON()
}

func (this *ServiceController) Post() {
	authJSON := AuthJSON{"AUTH"}
	this.Data["json"] = &authJSON
	defer this.ServeJSON()

	a := models.Service{}
	if err := this.ParseForm(&a); err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

	_, header, ferr := this.GetFile("file")
	if ferr != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}
	this.SaveToFile("file", "/home/jake/src/SkyTaxi/static/uploads/"+header.Filename)
	img := models.ServiceImg{}
	img.Path = "/static/uploads/" + header.Filename
	img.Item = &a
	a.Images = append(a.Images, &img)

	db_err := models.AddService(&a)
	if db_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

	db_err = models.AddServiceImg(&img)
	if db_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

}
