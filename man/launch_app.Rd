% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apps.R
\name{launch_app}
\alias{launch_app}
\title{Launch a supporting Shiny app}
\usage{
launch_app(app = c("learndrakeflow", "learndrakeplans", "drakeplanner"))
}
\arguments{
\item{app}{Character, name of the app to launch. Must be one of
\code{"flow"}, \code{"plans"}, or \code{"drakeplanner"}.}
}
\description{
The notebooks \code{3-flow.Rmd} and \code{4-plans.Rmd}
(see \code{\link[=save_notebooks]{save_notebooks()}}) come with supporting Shiny apps
to conduct the exercises. Use \code{launch_app()} to run one of these
apps on your local machine.
}
\details{
For \code{3-flow.Rmd}, \code{launch_app("learndrakeflow")} opens
a collection of exercises for iterating on a \code{drake} workflow.
For \code{4-plans.Rmd}, \code{launch_app("learndrakeplans")} opens guided exercises
on constructing \code{drake} plans,
and \code{launch_app("drakeplanner")} spins up an app
for visualizing and understanding plans.
}
\examples{
\dontrun{
launch_app("learndrakeflow")
launch_app("learndrakeplans")
launch_app("drakeplanner")
}
}
\seealso{
\code{\link[=save_notebooks]{save_notebooks()}}, \code{\link[=view_slides]{view_slides()}}
}
