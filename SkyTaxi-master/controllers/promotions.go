package controllers

import (
	"SkyTaxi/models"
	"github.com/astaxie/beego"
	"net/http"
	"log"
)

type PromotionsController struct {
	beego.Controller
}

func (this *PromotionsController) Post() {
	authJSON := AuthJSON{"AUTH"}
	this.Data["json"] = &authJSON
	defer this.ServeJSON()

	a := models.Promotion{}
	if err := this.ParseForm(&a); err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

	//Create a group code
	if a.Code == "skytaxi" {
		log.Println("Creating New Group.")

		u := this.Ctx.Request.Header.Get("id")
		//check if user has group
		us, err := models.GetUserByTwitterId(u)
		if err != nil {
			//exit
			this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
			return
		}

		if us.Group != nil {
			//exit
			this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
			return
		}

		//create a group.
		//assign group to user and set group admin.
		g := new(models.Group)
		g.Name = "Group"
		g.Admin = &us
		g.Users = []*models.User{&us}
		models.AddGroup(g)

		us.Group = g
		models.UpdateUser(&us)

		//reset user
		authUser := us.GetAuthUser()
		this.Data["json"] = &authUser
	}
}
