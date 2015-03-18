package alms

import org.apache.tools.ant.types.Description

class OpenExam {
    String      title
    Date        examStartTime
    Date        examEndTime
    Date        registrationStartDate
    Date        registrationEndDate
    String      venue
    Long        price
    Short       totalScore
    Short       passingScore
    String      description

    static hasMany = [openExamPolicies: OpenExamPolicy]

    static searchable = true

    static constraints = {
        title(nullable: false, blank: false)
        price(nullable: false)
        totalScore(nullable: false)
   }

}
