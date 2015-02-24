import alms.Broker
import alms.BrokerBranch
import alms.BrokerShareholder
import alms.Certificate
import alms.City
import alms.Country
import alms.ObtainedCertificate
import alms.Person

class BootStrap {

    def destroy = {
    }
    def init = { servletContext ->


        def country=new Country()
        country.title="ایران"
        country.save()

        def city=new City()
        city.title="تهران"
        city.country=country
        city.save()

        city=new City()
        city.title="مشهد"
        city.country=country
        city.save()
        city=new City()
        city.title="اصفهان"
        city.country=country
        city.save()
        city=new City()
        city.title="کرج"
        city.country=country
        city.save()
        city=new City()
        city.title="تبریز"
        city.country=country
        city.save()
        city=new City()
        city.title="شیراز"
        city.country=country
        city.save()
        city=new City()
        city.title="اهواز"
        city.country=country
        city.save()
        city=new City()
        city.title="قم"
        city.country=country
        city.save()
        city=new City()
        city.title="کرمانشاه"
        city.country=country
        city.save()
        city=new City()
        city.title="رشت"
        city.country=country
        city.save()
        city=new City()
        city.title="کرمان"
        city.country=country
        city.save()
        city=new City()
        city.title="ارومیه"
        city.country=country
        city.save()
        city=new City()
        city.title="زاهدان"
        city.country=country
        city.save()
        city=new City()
        city.title="همدان"
        city.country=country
        city.save()
        city=new City()
        city.title="اراک"
        city.country=country
        city.save()
        city=new City()
        city.title="یزد"
        city.country=country
        city.save()
        city=new City()
        city.title="قزوین"
        city.country=country
        city.save()
        city=new City()
        city.title="اردبیل"
        city.country=country
        city.save()
        city=new City()
        city.title="بندرعباس"
        city.country=country
        city.save()
        city=new City()
        city.title="زنجان"
        city.country=country
        city.save()
        city=new City()
        city.title="خرم آباد"
        city.country=country
        city.save()
        city=new City()
        city.title="سنندج"
        city.country=country
        city.save()
        city=new City()
        city.title="گرگان"
        city.country=country
        city.save()
        city=new City()
        city.title="ساری"
        city.country=country
        city.save()
        city=new City()
        city.title="شهرکرد"
        city.country=country
        city.save()
        city=new City()
        city.title="بندر بوشهر"
        city.country=country
        city.save()
        city=new City()
        city.title="بجنورد"
        city.country=country
        city.save()
        city=new City()
        city.title="بیرجند"
        city.country=country
        city.save()
        city=new City()
        city.title="ایلام"
        city.country=country
        city.save()
        city=new City()
        city.title="سمنان"
        city.country=country
        city.save()
        city=new City()
        city.title="یاسوج"
        city.country=country
        city.save()

//      add broker

        Broker broker= new Broker()
        broker.brokerPersianName="کارگزار اول"
        broker.brokerLatinName="First Broker"
        broker.registerDate=new Date();
        broker.registerNo="1"
        broker.registerLocation="تهران سید خندان زیر پل"
        broker.seoRegisterDate=new Date()
        broker.seoRegisterNo="2"
        broker.clubMembershipNo="3"
        broker.clubMembershipDate= new Date()
        broker.registeredCapital="4"
        broker.paidCapital=5
        broker.sharesNumber=6
        broker.financialYearEndMonth=7
        broker.financialYearEndDay=8
        broker.nationalCode="9"
        broker.economicCode="10"
        broker.centralOfficeAddress="11"
        broker.centralOfficePostalCode="12"
        broker.POBox="13"
        broker.website="14"
        broker.email="15"
        broker.tseRank="16"
        broker.tseOrdinaryPoint=7
        broker.tseEncouragingPoint=8
        broker.imeRank=19
        broker.imeOrdinaryPoint=2
        broker.imeEncouragingPoint=1
        broker.save()

//      shareholder
        def brokerShare= new BrokerShareholder()
        brokerShare.description="سهامدار اول"
        brokerShare.ownershipPercent=40
        brokerShare.ownershipType="individual"
        brokerShare.representativeOnBoard="100"
        brokerShare.shareholderName="تستی"
        brokerShare.sharesCount=400
        brokerShare.save()

        broker.addToBrokerShareholders(brokerShare)
        println(brokerShare.broker.id)

        brokerShare= new BrokerShareholder()
        brokerShare.description="سهامدار دوم"
        brokerShare.ownershipPercent=60
        brokerShare.ownershipType="individual"
        brokerShare.representativeOnBoard="100"
        brokerShare.shareholderName="تستی"
        brokerShare.sharesCount=600
        brokerShare.save()

        broker.addToBrokerShareholders(brokerShare)
        println(brokerShare.broker.id)

//      branch
        def brokerBranch= new BrokerBranch()
        brokerBranch.branchType="Branch"
        brokerBranch.City=City.get(1)
        brokerBranch.energyStock=true
        brokerBranch.imeFuture=true
        brokerBranch.imeStock=true
        brokerBranch.mutualFundAdmin=false
        brokerBranch.personnelCount=13
        brokerBranch.representativePerson="تست"
        brokerBranch.tseFuture=false
        brokerBranch.tseStock=false
        broker.addToBrokerBranches(brokerBranch)
        broker.save()

//      second broker and details

        broker= new Broker()
        broker.brokerPersianName="کارگزار دوم"
        broker.brokerLatinName="Second Broker"
        broker.registerDate=new Date();
        broker.registerNo="2"
        broker.registerLocation="تهران در اول "
        broker.seoRegisterDate=new Date()
        broker.seoRegisterNo="2"
        broker.clubMembershipNo="3"
        broker.clubMembershipDate= new Date()
        broker.registeredCapital="4"
        broker.paidCapital=5
        broker.sharesNumber=6
        broker.financialYearEndMonth=7
        broker.financialYearEndDay=8
        broker.nationalCode="9"
        broker.economicCode="10"
        broker.centralOfficeAddress="11"
        broker.centralOfficePostalCode="12"
        broker.POBox="13"
        broker.website="14"
        broker.email="15"
        broker.tseRank="16"
        broker.tseOrdinaryPoint=7
        broker.tseEncouragingPoint=8
        broker.imeRank=19
        broker.imeOrdinaryPoint=2
        broker.imeEncouragingPoint=1
        broker.save()

        brokerShare=new BrokerShareholder()
        brokerShare= new BrokerShareholder()
        brokerShare.description="صاحاب اول"
        brokerShare.ownershipPercent=60
        brokerShare.ownershipType="individual"
        brokerShare.representativeOnBoard="100"
        brokerShare.shareholderName="صاحاب"
        brokerShare.sharesCount=600
        brokerShare.save()

        broker.addToBrokerShareholders(brokerShare)
        println(brokerShare.broker.id)



























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
}
