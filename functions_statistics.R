#
#
# Nathalia Graf Grachet
# Functions for 4_Statistics.Rmd
# MetaboDirect
#
#

# -------------------------------------------------------------------------
get_target_samples <- function(matrix, metadata, sampleid_column, column_name, in_or_out, value_in){
    ## Select samples from matrix using the metadata
    ## IMPORTANT matrix should have sample names as rownames
    ## Returns filtered matrix
    
    samples_vector <- c()
    
    if(in_or_out == "in"){
        samples_vector <- pull({{metadata}} %>% 
                        filter({{column_name}} == {{value_in}}) %>% 
                        select({{sampleid_column}}))
    } else {
        samples_vector <- pull({{metadata}} %>% 
                                   filter({{column_name}} != {{value_in}}) %>% 
                                   select({{sampleid_column}}))
    }
    
    matrix <- matrix[rownames(matrix) %in% samples_vector, ]
    
    return (matrix)
    
}


# -------------------------------------------------------------------------
make_nmds <- function(d.matrix, d.method){
    ## This functions makes NMDS magic :) 
    ## d.matrix is distance matrix
    
    nmds = metaMDS(d.matrix, 
                   k = 2,
                   distance = d.method,
                   maxit = 999,
                   trymax = 500,
                   wascores = TRUE)
    
    return (nmds)
    
}


# -------------------------------------------------------------------------
nmds_plot <- function(nmds_scores, x_axis, y_axis, 
                      to_fill, to_color, to_shape,
                      font_size, point_size){
    
    ggplot(data=nmds_scores, aes(x={{x_axis}}, 
                                 y={{y_axis}}, 
                                 color = {{to_color}}, 
                                 fill = {{to_fill}},
                                 shape = {{to_shape}})) +
        geom_point(size={{point_size}}) +
        theme_bw(base_size = {{font_size}}) +
        theme(
            axis.title = element_blank(),
            axis.text = element_text(size = {{font_size}}-3),
            legend.title = element_blank(),
            legend.text = element_text(size = {{font_size}}-3),
            legend.key.size = unit(0.7,"line"),
            legend.position = "bottom",
            plot.title = element_text(size = {{font_size}}, face="bold"),
            panel.spacing.x = unit(1, "line")
        )
}










