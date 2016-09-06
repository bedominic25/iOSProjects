package models

import (
	"fmt"
	"time"
	//	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	//	"github.com/astaxie/beego/validation"
)

var Ormer orm.Ormer

func init() {
	// Need to register model in init
	fmt.Println("Model init")
	orm.RegisterModel(new(User), new(Group), new(Promotion), new(Aircraft), new(AircraftImg), new(Site), new(SiteImg), new(Service), new(ServiceImg))
}

type User struct {
	Id         int64     `orm:"pk;auto"`
	TwitterId  string    `orm:"unique;index"`
	Phone      string    `orm:"size(64);unique"`
	UserName   string    `orm:"size(64);unique;index"`
	Email      string    `orm:"size(64);unique;index"`
	EmailValid bool      `orm:"default(0)"`
	Password   string    `orm:"size(32)"`
	Group      *Group    `orm:"null;rel(fk)"`
	DOB        time.Time `orm:"null;type(date)"`
	Name       string    `orm:"size(64)"`

	Lastlogintime time.Time `orm:"type(datetime);null"`
	Created       time.Time `orm:"auto_now_add;type(datetime)"`
	Updated       time.Time `orm:"auto_now;type(datetime)"`
}

// Set engine to INNODB
func (u *User) TableEngine() string {
	return "INNODB"
}

func (u *User) TableName() string {
	return "users"
}

func NewUserValid(email string, un string) bool {
	u1 := User{Email: email}
	err1 := Ormer.Read(&u1, "Email")

	u2 := User{UserName: un}
	err2 := Ormer.Read(&u2, "UserName")

	if err1 != nil && err2 != nil {
		return true
	} else {
		return false
	}
}

func AddUser(u *User) error {
	_, err := Ormer.Insert(u)
	return err
}

func UpdateUser(u *User) error {
	_, err := Ormer.Update(u)
	return err
}

func GetUserByEmail(email string) (User, error) {
	u := User{Email: email}
	err := Ormer.Read(&u, "Email")
	fmt.Println(u.Id)
	return u, err
}

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

type AuthUser struct {
	Name string `json:"name"`
	UserId string `json:"user_id"`
	UserName string `json:"user_name"`
	Group int64 `json:"group"`
}

func (u *User) GetAuthUser() AuthUser{
	if u.Group != nil {
		return AuthUser{u.Name, u.TwitterId, u.UserName, u.Group.Id}
	} else {
		return AuthUser{u.Name, u.TwitterId, u.UserName, -1}
	}
}


/*
func NewUser() (*User, err) {
	//return nil, fmt.Errorf("user failed")
	return &User{}, nil
}
*/

type Group struct {
	Id      int64   `orm:"pk;auto"`
	Name    string  `orm:"size(64);unique"`
	Admin   *User   `orm:"rel(fk)"`
	Users   []*User `orm:"reverse(many)"`
	Payment float32 `orm:"default(0.00)"`
}

// Set engine to INNODB
func (g *Group) TableEngine() string {
	return "INNODB"
}

func (u *Group) TableName() string {
	return "groups"
}

func AddGroup(g *Group) error {
        _, err := Ormer.Insert(g)
        return err
}
