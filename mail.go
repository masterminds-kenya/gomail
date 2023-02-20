package main

import("fmt"
"net/smtp"
"crypto/tls"

	"gopkg.in/gomail.v2"


)



func sendMail(){

	auth := smtp.PlainAuth(
		"miradi",
		"mulikamike@gmail.com",
		"wzitdtsholxndeln" ,//password
		"smtp.gmail.com",

	)
	msg := "subject: my mail \n"

   err := smtp.SendMail(
		"smtp.gmail.com:578",
		auth,
		"mulikamike@gmail.com",
		[]string{"mulikamike@gmail.com"},
		[]byte(msg),
	)

	if err != nil{
		fmt.Println(err)
	}


}

func SendWithGomail(){
	d := gomail.NewDialer("smtp.gmail.com", 587, "mulikamike@gmail.com", "wzitdtsholxndeln")
	d.TLSConfig = &tls.Config{InsecureSkipVerify: true}


}

func main(){
	// sendMail()
	SendWithGomail()
}