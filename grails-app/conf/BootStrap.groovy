import alms.Broker
import alms.BrokerBranch
import alms.BrokerInvestmentFund
import alms.BrokerLicense
import alms.BrokerMember
import alms.BrokerPortfolio
import alms.BrokerShareholder
import alms.BrokerSoftware
import alms.BrokerTradingStation
import alms.Certificate
import alms.City
import alms.Country
import alms.Course
import alms.Event
import alms.Institution
import alms.InstitutionMember
import alms.ObtainedCertificate
import alms.Person
import alms.Role
import alms.User
import alms.UserRole

import java.lang.reflect.Member

class BootStrap {

    def destroy = {
    }
    def init = { servletContext ->

        def bRole = Role.findByAuthority("BrokerRole") ?: new Role(authority: "BrokerRole").save()
        def iRole = Role.findByAuthority("InstitutionRole") ?: new Role(authority: "InstitutionRole").save()
        def pRole = Role.findByAuthority("PersonRole") ?: new Role(authority: "PersonRole").save()
        def admRole = Role.findByAuthority("AdminRole") ?: new Role(authority: "AdminRole").save()

        def admUser = User.findByUsername("admin") ?: new User(username: 'admin', password: 'admin123', enabled: true).save()
        def ur = UserRole.findByUser(admUser) ?: UserRole.create(admUser, admRole, true)

        TimeZone.setDefault(TimeZone.getTimeZone('UTC'))
        def country = new Country()
        country.title = "ایران"
        country.save()

        def city = new City()
        city.title = "تهران"
        city.country = country
        city.save()

        city = new City()
        city.title = "مشهد"
        city.country = country
        city.save()
        city = new City()
        city.title = "اصفهان"
        city.country = country
        city.save()
        city = new City()
        city.title = "کرج"
        city.country = country
        city.save()
        city = new City()
        city.title = "تبریز"
        city.country = country
        city.save()
        city = new City()
        city.title = "شیراز"
        city.country = country
        city.save()
        city = new City()
        city.title = "اهواز"
        city.country = country
        city.save()
        city = new City()
        city.title = "قم"
        city.country = country
        city.save()
        city = new City()
        city.title = "کرمانشاه"
        city.country = country
        city.save()
        city = new City()
        city.title = "رشت"
        city.country = country
        city.save()
        city = new City()
        city.title = "کرمان"
        city.country = country
        city.save()
        city = new City()
        city.title = "ارومیه"
        city.country = country
        city.save()
        city = new City()
        city.title = "زاهدان"
        city.country = country
        city.save()
        city = new City()
        city.title = "همدان"
        city.country = country
        city.save()
        city = new City()
        city.title = "اراک"
        city.country = country
        city.save()
        city = new City()
        city.title = "یزد"
        city.country = country
        city.save()
        city = new City()
        city.title = "قزوین"
        city.country = country
        city.save()
        city = new City()
        city.title = "اردبیل"
        city.country = country
        city.save()
        city = new City()
        city.title = "بندرعباس"
        city.country = country
        city.save()
        city = new City()
        city.title = "زنجان"
        city.country = country
        city.save()
        city = new City()
        city.title = "خرم آباد"
        city.country = country
        city.save()
        city = new City()
        city.title = "سنندج"
        city.country = country
        city.save()
        city = new City()
        city.title = "گرگان"
        city.country = country
        city.save()
        city = new City()
        city.title = "ساری"
        city.country = country
        city.save()
        city = new City()
        city.title = "شهرکرد"
        city.country = country
        city.save()
        city = new City()
        city.title = "بندر بوشهر"
        city.country = country
        city.save()
        city = new City()
        city.title = "بجنورد"
        city.country = country
        city.save()
        city = new City()
        city.title = "بیرجند"
        city.country = country
        city.save()
        city = new City()
        city.title = "ایلام"
        city.country = country
        city.save()
        city = new City()
        city.title = "سمنان"
        city.country = country
        city.save()
        city = new City()
        city.title = "یاسوج"
        city.country = country
        city.save()

//      add broker

        Broker broker = new Broker()
        broker.brokerPersianName = "کارگزار اول"
        broker.brokerLatinName = "First Broker"
        broker.registerDate = new Date();
        broker.registerNo = "1"
        broker.registerLocation = "تهران سید خندان زیر پل"
        broker.seoRegisterDate = new Date()
        broker.seoRegisterNo = "2"
        broker.clubMembershipNo = "3"
        broker.clubMembershipDate = new Date()
        broker.registeredCapital = "4"
        broker.paidCapital = 5
        broker.sharesNumber = 6
        broker.financialYearEndMonth = 7
        broker.financialYearEndDay = 8
        broker.nationalCode = "1111111111"
        broker.economicCode = "10"
        broker.centralOfficeAddress = "11"
        broker.centralOfficePostalCode = "12"
        broker.POBox = "13"
        broker.website = "14"
        broker.email = "15"
        broker.tseRank = "16"
        broker.tseOrdinaryPoint = 7
        broker.tseEncouragingPoint = 8
        broker.imeRank = 19
        broker.imeOrdinaryPoint = 2
        broker.imeEncouragingPoint = 1
        broker.username = "broker1"
        broker.password = "password"
        broker.enabled = true
        broker.save()

        ur = UserRole.findByUser(broker) ?: UserRole.create(broker, bRole, true)

//      shareholder
        def brokerShare = new BrokerShareholder()
        brokerShare.description = "سهامدار اول"
        brokerShare.ownershipPercent = 40
        brokerShare.ownershipType = "individual"
        brokerShare.representativeOnBoard = "100"
        brokerShare.shareholderName = "تستی"
        brokerShare.sharesCount = 400
        brokerShare.save()

        broker.addToBrokerShareholders(brokerShare)

        brokerShare = new BrokerShareholder()
        brokerShare.description = "سهامدار دوم"
        brokerShare.ownershipPercent = 60
        brokerShare.ownershipType = "individual"
        brokerShare.representativeOnBoard = "100"
        brokerShare.shareholderName = "تستی"
        brokerShare.sharesCount = 600
        brokerShare.save()

        broker.addToBrokerShareholders(brokerShare)

//      branch
        def brokerBranch = new BrokerBranch()
        brokerBranch.branchType = "Branch"
        brokerBranch.city = City.get(1)
        brokerBranch.energyStock = true
        brokerBranch.imeFuture = true
        brokerBranch.imeStock = true
        brokerBranch.mutualFundAdmin = false
        brokerBranch.personnelCount = 13
        brokerBranch.representativePerson = "تست"
        brokerBranch.tseFuture = false
        brokerBranch.tseStock = false
        broker.addToBrokerBranches(brokerBranch)
        broker.save()

        ur = UserRole.findByUser(broker) ?: UserRole.create(broker, bRole, true)

//        InvestmentFund
        def brokerInvestmentFund = new BrokerInvestmentFund()
        brokerInvestmentFund.fundName = "صندوق خال خالی"
        brokerInvestmentFund.startingDate = new Date()
        brokerInvestmentFund.typeAndScale = "ETF"
        brokerInvestmentFund.fundManager = false
        brokerInvestmentFund.fundCustodian = true
        brokerInvestmentFund.agencyFund = false
        brokerInvestmentFund.fundRegisterManager = true
        brokerInvestmentFund.liquidityGuaranteeFund = true

        broker.addToBrokerInvestmentFounds(brokerInvestmentFund)
        broker.save()

//        license
        def brokerLicense = new BrokerLicense()
        brokerLicense.displayOrder = 13
        brokerLicense.title1 = "اول اول"
        brokerLicense.title2 = "دوم منم"
        brokerLicense.hasLicense = "ندارم"
        brokerLicense.licenseNumber = 12345
        brokerLicense.licenseDate = new Date()
        brokerLicense.licenseExpiry = new Date()


        broker.addToBrokerLicenses(brokerLicense)
        broker.save()

//        Member
//        def brokerMember = new BrokerMember()
//        brokerMember.name = "اسمم"
//        brokerMember.lastName = "فامیلم"
//        brokerMember.sex = "female"
//        brokerMember.position = "DeputyCEO"
//        brokerMember.startDate = new Date()
//        brokerMember.degree = "PhD"
//        brokerMember.field = "EngAndTech"
//        brokerMember.dateOfBirth = new Date()
//        brokerMember.nationalCode = "123123123123"
//        brokerMember.mobile = "019238127381"
//        brokerMember.email = "m@m.com"
//
//        broker.addToBrokerMembers(brokerMember)
//        broker.save()
//
//        def brokerMember1= new BrokerMember()
//        brokerMember1.name = "اسمت"
//        brokerMember1.lastName = "فامیلت"
//        brokerMember1.sex = "female"
//        brokerMember1.position = "EnergyExTrader"
//        brokerMember1.startDate = new Date()
//        brokerMember1.degree = "Master"
//        brokerMember1.field = "Economy"
//        brokerMember1.dateOfBirth = new Date()
//        brokerMember1.nationalCode = "23424234"
//        brokerMember1.mobile = "093592374984"
//        brokerMember1.email = "msdlfkjsdf@sdflkj.com"
//
//        broker.addToBrokerMembers(brokerMember1)
//        broker.save()
//        brokerMember1.save()

//        portfolio

        def brokerPortfolio = new BrokerPortfolio()
        brokerPortfolio.countOfContract = 20
        brokerPortfolio.sumOfContract = 30000
        brokerPortfolio.countOfConsultantContract = 30

        broker.addToBrokerPortfolios(brokerPortfolio)
        broker.save()

//        software
        def brokerSoftware = new BrokerSoftware()
        brokerSoftware.companyName = "شرکت خود خودم"
        brokerSoftware.contractType = "Buy"
        brokerSoftware.title1 = "خفن"
        brokerSoftware.title2 = "بازی"

        broker.addToBrokerSoftware(brokerSoftware)
        broker.save()

//        trading station

        def brokerTradingStation = new BrokerTradingStation()
        brokerTradingStation.city = city
        brokerTradingStation.stationType = "Energy"
        brokerTradingStation.activities = "زیاددددددد"
        brokerTradingStation.trader = "خودش"
        brokerTradingStation.phone = "0912331231"
        brokerTradingStation.address = "همونجا روبرو بانک ملی"

        broker.addToBrokerTradingStations(brokerTradingStation)
        broker.save()

//      second broker and details

        broker = new Broker()
        broker.brokerPersianName = "کارگزار دوم"
        broker.brokerLatinName = "Second Broker"
        broker.registerDate = new Date();
        broker.registerNo = "2"
        broker.registerLocation = "تهران در اول "
        broker.seoRegisterDate = new Date()
        broker.seoRegisterNo = "2"
        broker.clubMembershipNo = "3"
        broker.clubMembershipDate = new Date()
        broker.registeredCapital = "4"
        broker.paidCapital = 5
        broker.sharesNumber = 6
        broker.financialYearEndMonth = 7
        broker.financialYearEndDay = 8
        broker.nationalCode = "2222222222"
        broker.economicCode = "10"
        broker.centralOfficeAddress = "11"
        broker.centralOfficePostalCode = "12"
        broker.POBox = "13"
        broker.website = "14"
        broker.email = "15"
        broker.tseRank = "16"
        broker.tseOrdinaryPoint = 7
        broker.tseEncouragingPoint = 8
        broker.imeRank = 19
        broker.imeOrdinaryPoint = 2
        broker.imeEncouragingPoint = 1
        broker.username = "broker2"
        broker.password = "password"
        broker.enabled = true
        broker.save()

        brokerShare = new BrokerShareholder()
        brokerShare = new BrokerShareholder()
        brokerShare.description = "صاحاب اول"
        brokerShare.ownershipPercent = 60
        brokerShare.ownershipType = "individual"
        brokerShare.representativeOnBoard = "100"
        brokerShare.shareholderName = "صاحاب"
        brokerShare.sharesCount = 600
        brokerShare.save()

        broker.addToBrokerShareholders(brokerShare)

//        certificate
        Certificate certificate = new Certificate()
        certificate.cerType ="stock"
        certificate.cerTitle = "اصول بازار سرمایه"
        certificate.save()
        Certificate certificate1 = new Certificate()
        certificate1.cerType ="stock"
        certificate1.cerTitle = "تحلیلگری بازار سرمایه"
        certificate1.save()
        Certificate certificate2 = new Certificate()
        certificate2.cerType = "kanoon"
        certificate2.cerTitle = "کاربردی پذیرش سفارش مشتریان اوراق بهادار"
        certificate2.save()

        ObtainedCertificate obtainedCer = new ObtainedCertificate()
        obtainedCer.certificate = certificate
        obtainedCer.obtainedDate = new Date()
        obtainedCer.save()

        //person
        Person person = new Person()
        person.name = "Reza"
        person.lastName = "ALi"
        person.sex = "male"
        person.degree = "Master"
        person.field = "EngAndTech"
        person.dateOfBirth = new Date()
        person.nationalCode = "3333333333"
        person.mobile = "09361782347"
        person.email = "reza.ali@gmail.com"
        person.username = "person1"
        person.password = "password123"
        person.enabled = true
        person.save()

        ur = UserRole.findByUser(person) ?: UserRole.create(person, pRole, true)

        person = new Person()
        person.name = "Mary"
        person.lastName = "Jigar"
        person.sex = "female"
        person.degree = "Master"
        person.field = "EngAndTech"
        person.dateOfBirth = new Date()
        person.nationalCode = "00686140987"
        person.mobile = "09361782347"
        person.email = "mary.jigar@gmail.com"
        person.username = "person2"
        person.password = "password123"
        person.enabled = true
        person.save()

        ur = UserRole.findByUser(person) ?: UserRole.create(person, pRole, true)

        //Institution
        def institution = new Institution()
        institution.name = "نهاد قشنگ"
        institution.nationalCode = "4444444444"
        institution.address = "ته ته تهران"
        institution.email = "nahad@ghashng.com"
        institution.fax = "02126435345"
        institution.registerNumber = "123123"
        institution.username="ins1"
        institution.password="password"
        institution.enabled=true
        institution.save()

        ur = UserRole.findByUser(institution) ?: UserRole.create(institution, iRole, true)

        //course
        def courseInstance = new Course()
        courseInstance.title = "دوره دوره ها"
        courseInstance.color = "#808080"
        courseInstance.save()

        courseInstance = new Course()
        courseInstance.title = "دوره هفتگی"
        courseInstance.color = "#4B0082"
        courseInstance.save()

        courseInstance = new Course()
        courseInstance.title = "دوره دوستان"
        courseInstance.color = "#C0C0C0"
        courseInstance.save()

        //Event
        def eventInstance = new Event()
        eventInstance.title = "دوره اول"
        eventInstance.course = Course.get(1)
        eventInstance.description = "شرررررررررررررررررررررررررررررررررررررح"
        eventInstance.start = new Date()
        eventInstance.end = new Date()
        eventInstance.isAllDay = false
        eventInstance.save()


    }
}
