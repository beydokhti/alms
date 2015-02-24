package alms

class City {
    Country country
    String title

    static constraints = {
        country(nullable: false)
        title(nullable: false)
    }

    def String toString(){
    "$title/$country.title"
    }
}
