package controllers

import (
	"SkyTaxi/models"
	"github.com/astaxie/beego"
	"net/http"
)

type SiteController struct {
	beego.Controller
}

func (this *SiteController) Get() {
	items, _ := models.GetAllSites()
	this.Data["json"] = &items
	defer this.ServeJSON()
}

func (this *SiteController) Post() {

	//Set up response
	authJSON := AuthJSON{"AUTH"}
	this.Data["json"] = &authJSON
	defer this.ServeJSON()

	//Parse textf
	a := models.Site{}
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
	img := models.SiteImg{}
	img.Path = "/static/uploads/" + header.Filename
	img.Item = &a
	a.Images = append(a.Images, &img)

	db_err := models.AddSite(&a)
	if db_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

	db_err = models.AddSiteImg(&img)
	if db_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

}
