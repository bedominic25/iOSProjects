package models

import (
	"time"
	//	"github.com/astaxie/beego/orm"
	//	"github.com/astaxie/beego/validation"
)

// Struct: AircraftImg
type AircraftImg struct {
	Id   int64     `orm:"pk;auto" json:"id"`
	Item *Aircraft `orm:"rel(fk)" json:"-"` // RelForeignKey relation
	Path string    `json:"path"`

	Created time.Time `orm:"auto_now_add;type(datetime)" json:"created"`
	Updated time.Time `orm:"auto_now;type(datetime)" json:"updated"`
}

// Set engine to INNODB
func (this *AircraftImg) TableEngine() string {
	return "INNODB"
}

func (this *AircraftImg) TableName() string {
	return "aircraft_imgs"
}

func AddAircraftImg(this *AircraftImg) error {
	_, err := Ormer.Insert(this)
	return err
}

// Struct: SiteImg
type SiteImg struct {
	Id   int64  `orm:"pk;auto" json:"id"`
	Item *Site  `orm:"rel(fk)" json:"-"` // RelForeignKey relation
	Path string `json:"path"`

	Created time.Time `orm:"auto_now_add;type(datetime)" json:"created"`
	Updated time.Time `orm:"auto_now;type(datetime)" json:"updated"`
}

// Set engine to INNODB
func (this *SiteImg) TableEngine() string {
	return "INNODB"
}

func (this *SiteImg) TableName() string {
	return "site_imgs"
}

func AddSiteImg(this *SiteImg) error {
	_, err := Ormer.Insert(this)
	return err
}

// Struct: ServiceImg
type ServiceImg struct {
	Id   int64    `orm:"pk;auto" json:"id"`
	Item *Service `orm:"rel(fk)" json:"-"` // RelForeignKey relation
	Path string   `json:"path"`

	Created time.Time `orm:"auto_now_add;type(datetime)" json:"created"`
	Updated time.Time `orm:"auto_now;type(datetime)" json:"updated"`
}

// Set engine to INNODB
func (this *ServiceImg) TableEngine() string {
	return "INNODB"
}

func (this *ServiceImg) TableName() string {
	return "service_imgs"
}

func AddServiceImg(this *ServiceImg) error {
	_, err := Ormer.Insert(this)
	return err
}
