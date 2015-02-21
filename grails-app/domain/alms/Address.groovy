package alms

class Address {

    String address

    static constraints = {
        address(nullable: false, maxSize: 1024)
    }
}
