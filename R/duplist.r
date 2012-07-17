duplist = function(l,order,tolerance=.Machine$double.eps ^ 0.5)
{
    # Assumes input list is ordered by each list item (or by 'order' if supplied), and that all list elements are the same length
    # Finds the non-duplicate rows.
    # TO DO: Possibly reinstate reverse argument :
    #    FALSE works in the usual duplicated() way,  the first in a sequence of dups, will be FALSE
    #    TRUE has the last in a sequence of dups FALSE (so you can keep the last if thats required)
    # l = list(...)
    # TO DO - its wasteful that ans is allocated at long as the list, it just returns the first of each group.
    if (!is.list(l)) stop("l not type list")
    if (!(length(l) || length(l[[1]]))) return(0L)
    ans = integer(length(l[[1]]))
    len = integer(1)
    if (missing(order)) {
        .Call(Cduplist,l,ans,len,as.integer(-1),as.numeric(tolerance))
    } else {
        .Call(Cduplist,l,ans,len,as.integer(order),as.numeric(tolerance))
    }
    length(ans) = len
    ans
}


