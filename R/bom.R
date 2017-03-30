#' Tests whether a raw httr response or character vector has a byte order mark (BOM)
#' @param resp \code{httr} response object or a character vector
#' @return Converted content
#' @export
#' @references \href{http://www.unicode.org/faq/utf_bom.html}{UTF-8, UTF-16, UTF-32 & BOM}
#' @author @@hrbrmstr
sans_bom <- function(resp) {

        #F <- resp$content[1:4]
        #if (F[1] == as.raw(239) & F[2] == as.raw(187) & F[3] == as.raw(191)) {
            iconv(readBin(resp$content[4:length(resp$content)], character()), from = "UTF-8", to = "UTF-8")
        #}  else {
            #stop("Did not detect a BOM in the httr::response object content.", call. = FALSE)
        #}

}

