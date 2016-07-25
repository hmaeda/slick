#' slick
#'
#' make a slick htmlwidget from a vector of urls
#'
#' @import htmlwidgets
#'
#' @export
slick <- function(img_vec, width = NULL, height = NULL) {

  # forward options using x
  # x <- lapply(img_vec,function(y){div(img(src=y))})
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'slick',
    x,
    width = width,
    height = height,
    package = 'slick'
  )
}

#' Shiny bindings for slick
#'
#' Output and render functions for using slick within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a slick
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name slick-shiny
#'
#' @export
slickOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'slick', width, height, package = 'slick')
}

#' @rdname slick-shiny
#' @export
renderSlick <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, slickOutput, env, quoted = TRUE)
}

