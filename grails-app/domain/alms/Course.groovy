package alms

/**
 * Created by MaryJoOon on 3/5/2015.
 */
class Course {
    String title
    String color

    static hasMany = [events:Event]

    static constraints = {
        title(nullable: false)
        color(nullable: false,inList: ["#DC143C",
                                       "#006400",
                                       "#8B008B",
                                       "#8B0000",
                                       "#483D8B",
                                       "#FF1493",
                                       "#FFD700",
                                       "#808080",
                                       "#008000",
                                       "#ADFF2F",
                                       "#FF69B4",
                                       "#4B0082",
                                       "#F08080",
                                       "#00FF00",
                                       "#191970",
                                       "#FFC0CB",
                                       "#800080",
                                       "#FF0000",
                                       "#C0C0C0",
                                       "#EE82EE",
                                       "#FFFF00"])
    }
}
