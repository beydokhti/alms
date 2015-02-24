package alms

class QueryService {

    def listQuery(params) {
        def maxRows = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)
        def firstRow = params.int("iDisplayStart")

        def sortColumns = findOrderParams(params)

        def query = {
            if (sortColumns) {
                and {
                    sortColumns.each { sortColumn ->
                        order(sortColumn.field, sortColumn.dir)
                    }
                }
            }

            firstResult(firstRow)
            maxResults(maxRows)
        }

        query
    }

    def decorate(params, query) {
        def maxRows = Math.min(params["iDisplayLength"] ? params.int('iDisplayLength') : 10, 100)
        def firstRow = params.int("iDisplayStart")

        def sortColumns = findOrderParams(params)

        def decorated = {
            query.setResolveStrategy(Closure.DELEGATE_FIRST)
            query.setDelegate(delegate)
            query.call()

            if (sortColumns) {
                and {
                    sortColumns.each { sortColumn ->
                        order(sortColumn.field, sortColumn.dir)
                    }
                }
            }

            firstResult(firstRow)
            maxResults(maxRows)
        }

        decorated
    }

    def findOrderParams(params) {
        def order = []
        def sortingColumns = params.int('iSortingCols')
        sortingColumns.times { i ->
            def fieldIndex = params.int("iSortCol_${i}")
            if (params.boolean("bSortable_${fieldIndex}")) {
                def dir = params["sSortDir_${i}"]
                def field = params.columns[fieldIndex]
                order << [field: field, dir: dir]
            }
        }

        order
    }
}
