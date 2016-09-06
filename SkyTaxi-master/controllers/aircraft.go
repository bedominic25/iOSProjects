package controllers

import (
	"SkyTaxi/models"
	"github.com/astaxie/beego"
	"net/http"
)

type AircraftController struct {
	beego.Controller
}

func (this *AircraftController) Get() {
	//this.TplName = "test.tpl"
	aircraft, _ := models.GetAllAircraft()
	this.Data["json"] = &aircraft
	defer this.ServeJSON()
}

func (this *AircraftController) Post() {
	authJSON := AuthJSON{"AUTH"}
	this.Data["json"] = &authJSON
	defer this.ServeJSON()

	a := models.Aircraft{}
	if err := this.ParseForm(&a); err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

	/*
		files, ferr := this.GetFiles("files")
		for i, _ := range files {

		}
	*/

	_, header, ferr := this.GetFile("file")
	if ferr != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}
	this.SaveToFile("file", "/home/jake/src/SkyTaxi/static/uploads/"+header.Filename)
	img := models.AircraftImg{}
	img.Path = "/static/uploads/" + header.Filename
	img.Item = &a
	a.Images = append(a.Images, &img)

	db_err := models.AddAircraft(&a)
	if db_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

	db_err = models.AddAircraftImg(&img)
	if db_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

}
