package models

import (
	"time"
	//	"github.com/astaxie/beego/orm"
	//	"github.com/astaxie/beego/validation"
)

type Aircraft struct {
	Id          int64          `form:"-" orm:"pk;auto" json:"id"`
	Passanger   int            `form:"max,text,max:" valid:"required" json:"max"`
	Cost        int            `form:"cost,text,cost:" valid:"required" json:"cost"`
	Taxi        bool           `form:"taxi" valid:"required" json:"taxi"`
	Name        string         `form:"name,text,name:" orm:"size(64)" valid:"required" json:"name"`
	Make        string         `form:"make,text,make:" orm:"size(64)" valid:"required" json:"make"`
	Description string         `form:"description,text,description:" orm:"size(64)" valid:"required" json:"des"`
	Images      []*AircraftImg `form:"-" orm:"reverse(many);null" json:"imgs"`
	Lat         float64        `form:"lat,text,lat:" valid:"required" json:"lat"`
	Lon         float64        `form:"lon,text,lon:" valid:"required" json:"lon"`
	Group       *Group         `form:"-" orm:"rel(fk);null" json:"group_id"`

	Created time.Time `orm:"auto_now_add;type(datetime)" json:"created"`
	Updated time.Time `orm:"auto_now;type(datetime)" json:"updated"`
}

// Set engine to INNODB
func (this *Aircraft) TableEngine() string {
	return "INNODB"
}

func (this *Aircraft) TableName() string {
	return "aircraft"
}

func AddAircraft(this *Aircraft) error {
	_, err := Ormer.Insert(this)
	return err
}

func GetAllAircraft() ([]*Aircraft, error) {
	var aircraft []*Aircraft
	_, err := Ormer.QueryTable("aircraft").All(&aircraft)
	for i, _ := range aircraft {
		var imgs []*AircraftImg
		_, err = Ormer.QueryTable("aircraft_imgs").Filter("Item", aircraft[i].Id).RelatedSel().All(&imgs)
		aircraft[i].Images = imgs
	}
	return aircraft, err
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
