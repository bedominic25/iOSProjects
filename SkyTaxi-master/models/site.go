package models

import (
	"time"
	//	"github.com/astaxie/beego/orm"
	//	"github.com/astaxie/beego/validation"
)

type Site struct {
	Id          int64      `form:"-" orm:"pk;auto" json:"id"`
	Taxi        bool       `form:"taxi" valid:"required" json:"taxi"`
	Name        string     `form:"name,text,name:" orm:"size(64)" valid:"required" json:"name"`
	Description string     `form:"description,text,description:" orm:"size(64)" valid:"required" json:"des"`
	Images      []*SiteImg `form:"-" orm:"reverse(many);null" json:"imgs"`
	Lat         float64    `form:"lat,text,lat:" valid:"required" json:"lat"`
	Lon         float64    `form:"lon,text,lon:" valid:"required" json:"lon"`
	Group       *Group     `form:"-" orm:"rel(fk);null" json:"group_id"`

	Created time.Time `orm:"auto_now_add;type(datetime)" json:"created"`
	Updated time.Time `orm:"auto_now;type(datetime)" json:"updated"`
}

// Set engine to INNODB
func (this *Site) TableEngine() string {
	return "INNODB"
}

func (this *Site) TableName() string {
	return "sites"
}

func AddSite(this *Site) error {
	_, err := Ormer.Insert(this)
	return err
}

func GetAllSites() ([]*Site, error) {
	var items []*Site
	_, err := Ormer.QueryTable("sites").All(&items)
	for i, _ := range items {
		var imgs []*SiteImg
		_, err = Ormer.QueryTable("site_imgs").Filter("Item", items[i].Id).RelatedSel().All(&imgs)
		items[i].Images = imgs
	}
	return items, err
}

/*
func GetUserByUserName(un string) (User, error) {
	u := User{UserName: un}
	err := Ormer.Read(&u, "UserName")
	fmt.Println(u.Id)
	return u, err
}

func GetUserByTwitterId(id string) (User, error) {
	u := User{TwitterId: id}
	err := Ormer.Read(&u, "TwitterId")
	fmt.Println(u.Id)
	return u, err
}

func init() {
	// Need to register model in init
	fmt.Println("Model init")
	orm.RegisterModel(new(User), new(Group))
}
*/
