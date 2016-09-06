package controllers

import (
	"SkyTaxi/models"
	"bytes"
	"crypto/md5"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/httplib"
	"io"
	"net/http"
	"time"
)

type AuthJSON struct {
	Reply string `json:"reply"`
}

type RegisterController struct {
	beego.Controller
}

func (this *RegisterController) Post() {
	authJSON := AuthJSON{"AUTH"}
	this.Data["json"] = &authJSON
	defer this.ServeJSON()

	//Pull Headers From User Request
	c := this.Ctx.Request.Header.Get("check")
	un := this.Ctx.Request.Header.Get("username")
	pw := this.Ctx.Request.Header.Get("password")
	name := this.Ctx.Request.Header.Get("name")
	dob := this.Ctx.Request.Header.Get("dob")

	//Check If UserName and Password is Valid
	usererr := checkUsername(un)
	if usererr == false {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		fmt.Println(usererr)
		return
	}
	passerr := checkPassword(pw)
	if passerr == false {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		fmt.Println(passerr)
		return
	}

	//Check if User Exist THIS NEEDS TO BE FIXED
	valid := models.NewUserValid("", un)
	if valid == false {
		fmt.Println("Valid fails")
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		return
	}

	//Stop here for simple valid username & password check.
	if c != "" {
		fmt.Println("just a validcheck...")
		return
	}

	//Get Digits Auth Headers From User
	url := this.Ctx.Request.Header.Get("X-Auth-Service-Provider")
	token := this.Ctx.Request.Header.Get("X-Verify-Credentials-Authorization")

	//Send Req to Twitter
	req := httplib.Get(url)
	req.Header("Authorization", token)

	//Get Resp Back From Twitter
	resp, d_err := req.Response()
	if resp.StatusCode != 200 {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		fmt.Println("Twitter login failed")
		return
	}

	//Get JSON into Map
	var json map[string]interface{}
	d_err = req.ToJSON(&json)
	if d_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		return
	}

	//Parse JSON from Twitter
	email := json["email_address"].(map[string]interface{})
	add := email["address"]
	ver := email["is_verified"]
	phone := json["phone_number"]
	t_id := json["id_str"]

	//Encrypt Password
	md5Password := md5.New()
	io.WriteString(md5Password, pw)
	buffer := bytes.NewBuffer(nil)
	fmt.Fprintf(buffer, "%x", md5Password.Sum(nil))
	newPass := buffer.String()

	//Parse Date: dd-MM-yyyy
	layout := "02-01-2006"
	t, p_err := time.Parse(layout, dob)
	if p_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		return
	}

	//New User
	user := new(models.User)
	user.UserName = un
	user.Password = newPass
	user.TwitterId = t_id.(string)
	user.Email = add.(string)
	user.EmailValid = ver.(bool)
	user.Phone = phone.(string)
	user.Name = name
	user.DOB = t

	//Add the User
	db_err := models.AddUser(user)
	if db_err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable) //Change Code to error
		return
	}

	/*
		for k, v := range this.Ctx.Request.Header {
			fmt.Println("key:", k, "value:", v)
		}
	*/
	authUser := user.GetAuthUser()
        this.Data["json"] = &authUser

}

type VerifyController struct {
	beego.Controller
}

func (this *VerifyController) Post() {
	//this.TplName = "index.tpl"
	authJSON := AuthJSON{"AUTH"}
	this.Data["json"] = &authJSON
	defer this.ServeJSON()

	//Pull Headers From User Request
	dig := this.Ctx.Request.Header.Get("digits")

	//Is Digits Login
	if dig != "" {
		//Get Digits Auth Headers From User
		url := this.Ctx.Request.Header.Get("X-Auth-Service-Provider")
		token := this.Ctx.Request.Header.Get("X-Verify-Credentials-Authorization")

		//Send Req to Twitter
		req := httplib.Get(url)
		req.Header("Authorization", token)

		//Get Resp Back From Twitter
		resp, d_err := req.Response()
		if resp.StatusCode != 200 {
			this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
			return
		}

		//Get JSON into Map
		var json map[string]interface{}
		d_err = req.ToJSON(&json)
		if d_err != nil {
			this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
			return
		}

		//Parse JSON from Twitter
		t_id := json["id_str"]

		//Check if TwitterId exist in DB
		u, err := models.GetUserByTwitterId(t_id.(string))
		if err != nil {
			this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
			return
		}

		//Sucsses
		fmt.Println("Welcome" + u.Name)

		authUser := u.GetAuthUser()
		this.Data["json"] = &authUser

		return
	}

	//Get username & password from header
	un := this.Ctx.Request.Header.Get("username")
	pw := this.Ctx.Request.Header.Get("password")

	//Check If UserName and Password is Valid
	usererr := checkUsername(un)
	if usererr == false {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		return
	}
	passerr := checkPassword(pw)
	if passerr == false {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		return
	}

	//Get User from DB
	u, err := models.GetUserByUserName(un)
	if err != nil {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		return
	}

	//Encrypt Password
	md5Password := md5.New()
	io.WriteString(md5Password, pw)
	buffer := bytes.NewBuffer(nil)
	fmt.Fprintf(buffer, "%x", md5Password.Sum(nil))
	newPass := buffer.String()

	//Check if Password Matchs
	if u.Password != newPass {
		this.Ctx.ResponseWriter.WriteHeader(http.StatusNotAcceptable)
		return
	}

	//Password is Valid Set Session

	authUser := u.GetAuthUser()
	this.Data["json"] = &authUser
}
