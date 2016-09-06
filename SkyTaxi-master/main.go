package main

import (
	"SkyTaxi/models"
	_ "SkyTaxi/routers"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	//	"github.com/astaxie/beego/logs"
	_ "github.com/go-sql-driver/mysql"
)

func init() {
	fmt.Println("Main init")
	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", "jake:password@/skytaxi?charset=utf8")
	models.Ormer = orm.NewOrm()
}

func main() {

	// Database alias.
	name := "default"

	// Drop table and re-create.
	force := false//true

	// Print log.
	verbose := true

	// Error.
	err := orm.RunSyncdb(name, force, verbose)
	if err != nil {
		fmt.Println(err)
	}

	//TESTING
	user := new(models.User)
	user.Email = "jake@jakemail.com"
	user.Password = "abc123"
	user.UserName = "jakedale8"

	group := new(models.Group)
	group.Name = "Company ABC"
	group.Admin = user
	group.Users = []*models.User{user}
	group.Payment = 10.55

	user.Group = group

	o := models.Ormer
	//o := orm.NewOrm()
	orm.Debug = true

	fmt.Println(o.Insert(user))
	fmt.Println(o.Insert(group))
	fmt.Println(o.Update(user))

	u := models.User{Id: 1}
	err = o.Read(&u)
	fmt.Printf("ERR: %v\n", err)

	fmt.Println(u.Group.Id)

	p := new(models.Promotion)
	p.Name = "New Group"
	p.Code = "sky"
	models.AddPromotion(p)

	//START SERVER
	beego.Run()
}
