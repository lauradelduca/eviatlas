#' Create GenTimeTrend from dataset
#'
#' Created For	  : ES Hackathon 2018
#' @param idata Input data frame
#' @param year_column List of strings with column names
#' @param verbose Realtime commenting
#' @return Returns a timetrend object showing number of literature under different categories in user specified \code{year_column}
#'
#' @author Ezgi Tanriver-Ayder
#'
#' @keywords SystematicReview
#' @export

GenTimeTrend = function(idata, year_column = NULL, axis_txt_lim = 60){


  Years <- as.data.frame(sapply(idata[year_column], function(x) as.factor(x)))

    # Count combination of vars --------
    seldata <- table(Years)
    seldata <- reshape2::melt(seldata)

    # Plot Heatmap ------
    # Plot bar chart
    iyears <- min(seldata$Years, na.rm = T):max(seldata$Years, na.rm = T)
    timemp <- ggplot2::ggplot(seldata,
                              ggplot2::aes_string(x = colnames(seldata[1]),
                                                  y = colnames(seldata[2]))) +
      ggplot2::geom_bar(alpha = 0.9, stat = "identity", fill = "light blue") +
      ggplot2::scale_x_continuous(name = "Year", breaks = iyears, labels = function(x) substr(x, 1, axis_txt_lim)) +
      ggplot2::ggtitle(paste("Distribution of studies over", year_column)) +
      ggplot2::ylab(label = "# Studies") + 
      ggplot2::theme_bw() +
      ggplot2::theme(
        axis.line = ggplot2::element_line(colour = "black"),
        panel.background = ggplot2::element_blank(),
        plot.title = ggplot2::element_text(hjust = .5),
        text = ggplot2::element_text(size = 14),
        axis.text.x = ggplot2::element_text(angle = 50, size = 11) 
      )
    
  timemp
}