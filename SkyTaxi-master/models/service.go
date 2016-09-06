package models

import (
	"time"
	//	"github.com/astaxie/beego/orm"
	//	"github.com/astaxie/beego/validation"
)

type Service struct {
	Id          int64         `form:"-" orm:"pk;auto" json:"id"`
	Cost        int           `form:"cost,text,cost:" valid:"required" json:"cost"`
	Name        string        `form:"name,text,name:" orm:"size(64)" valid:"required" json:"name"`
	Description string        `form:"description,text,description:" orm:"size(64)" valid:"required" json:"des"`
	Images      []*ServiceImg `form:"-" orm:"reverse(many);null" json:"imgs"`
	Group       *Group        `form:"-" orm:"rel(fk);null" json:"group_id"`

	Created time.Time `orm:"auto_now_add;type(datetime)" json:"created"`
	Updated time.Time `orm:"auto_now;type(datetime)" json:"updated"`
}

// Set engine to INNODB
func (this *Service) TableEngine() string {
	return "INNODB"
}

func (this *Service) TableName() string {
	return "services"
}

func AddService(this *Service) error {
	_, err := Ormer.Insert(this)
	return err
}

func GetAllServices() ([]*Service, error) {
	var items []*Service
	_, err := Ormer.QueryTable("services").All(&items)
	for i, _ := range items {
		var imgs []*ServiceImg
		_, err = Ormer.QueryTable("service_imgs").Filter("Item", items[i].Id).RelatedSel().All(&imgs)
		items[i].Images = imgs
	}
	return items, err
}
