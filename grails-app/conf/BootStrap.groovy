import alms.Broker
import alms.Certificate
import alms.ObtainedCertificate
import alms.Person

class BootStrap {

    def init = { servletContext ->
//        Broker broker= new Broker()
//        broker.brokerPersianName="کارگزار1"
//        broker.brokerLatinName="broker1"
//        broker.registerNo="1111"
//        broker.registerLocation="Tehran"
//        broker.seoRegisterNo=11111
//        broker.clubMembershipNo=111111
//        broker.save()

        Certificate certificate=new Certificate()
        certificate.cerType="سازمان بورس و اوراق بهادار"
        certificate.cerTitle="اصول بازار سرمایه"
        certificate.save()
        Certificate certificate1=new Certificate()
        certificate1.cerType="سازمان بورس و اوراق بهادار"
        certificate1.cerTitle="تحلیلگری بازار سرمایه"
        certificate1.save()
        Certificate certificate2=new Certificate()
        certificate2.cerType="کانون کارگزاران"
        certificate2.cerTitle="کاربردی پذیرش سفارش مشتریان اوراق بهادار"
        certificate2.save()

        ObtainedCertificate obtainedCer=new ObtainedCertificate()
        obtainedCer.certificate=certificate
        obtainedCer.obtainedDate=new Date()
        obtainedCer.save()

        Person person=new Person()
        person.name="Reza"
        person.lastName="ALi"
        person.sex="female"
        person.degree="Master"
        person.field="EngAndTech"
        person.dataOfBirth=new Date()
        person.nationalCode="00686140987"
        person.mobile="09361782347"
        person.email="reza.ali@gmail.com"
        person.save()
//        person.certificates.add(obtainedCer)
//        person.save()



    }
    def destroy = {
    }
}
