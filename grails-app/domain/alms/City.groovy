package alms

class City {
    Country country
    String title

    static constraints = {
        country(nullable: false)
        title(nullable: false)
    }
}
