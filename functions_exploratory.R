#
#
# Nathalia Graf Grachet
# Functions for 3_Exploratory.Rmd
# MetaboDirect
#
#

# -------------------------------------------------------------------------
get_list_samples <- function(df){
    ## This functions grabs the sample names from the
    ## Formularity processed output.
    
    to_remove <-  c(
        'Mass', 'C', 'H', 'O', 'N', 'C13', 
        'S', 'P', 'Na', 'El_comp', 'Class',
        'NeutralMass', 'Error_ppm', 'Candidates', 
        'MolecularFormula', 'OC', 'HC', 
        'NOSC', 'GFE', 'DBE', 'DBE_O', 'AI', 
        'AI_mod', 'DBE_AI'
    )
    
    list_columns_df <- colnames(df)
    
    list_samples <- list_columns_df[! list_columns_df %in% to_remove]
    
    return (list_samples)
}


# -------------------------------------------------------------------------
vk_function <- function(df, x_axis, y_axis, title, 
                        make_color, font_size){
    ## This functions makes van Krevlen diagrams
    
    ggplot(data = df, aes(x = {{x_axis}}, y = {{y_axis}}, color = {{make_color}})) +
        geom_point(size=.2, alpha = .5) + 
        scale_color_distiller(palette = "Spectral") +
        xlab('O:C') + ylab('H:C') + ggtitle({{title}}) +
        theme_bw(base_size = {{font_size}}) +
        theme(
            strip.text=element_text(face="bold"),
            strip.background = element_rect(fill="white", colour="white"),
            axis.title = element_text(face="bold"),
            axis.text = element_text(size = {{font_size}}/2),
            legend.title = element_text(face="bold"),
            legend.key.size = unit(1.5,"line"),
            legend.position = "bottom",
            plot.title = element_text(size = {{font_size}}, face="bold"),
            panel.spacing.x = unit(1, "line")
        )
}


# -------------------------------------------------------------------------
density_function <- function(df, x_axis, title, make_color, 
                             font_size, list_colors){
    ## This function makes 2D density plots (overlay sample/groups in make_color)
    
    ggplot(data = df, aes(x={{x_axis}}, fill={{make_color}}, color={{make_color}})) +
        geom_density(alpha = .5) +
        ggtitle({{title}}) +
        scale_fill_manual(values = {{list_colors}}) +
        scale_color_manual(values = {{list_colors}}) +
        theme_bw(base_size = {{font_size}}) +
        theme(
            strip.text=element_text(face="bold"),
            strip.background = element_rect(fill="white", colour="white"),
            axis.title = element_text(size = {{font_size}}/1.2, face="bold"),
            axis.text = element_text(size = {{font_size}}/2),
            legend.title = element_text(face="bold"),
            legend.key.size = unit(0.6,"line"),
            legend.position = "bottom",
            plot.title = element_text(size = {{font_size}}, face="bold"),
            panel.spacing.x = unit(1, "line")
        )
}


# -------------------------------------------------------------------------
violin_function <- function(df, x_axis, y_axis, make_fill, 
                            title, font_size, list_colors){
    ## This function makes violin plots (helps see the distribution/density like GFE)
    
    ggplot(data=df, aes(x={{x_axis}}, y={{y_axis}}, fill={{make_fill}})) +
        geom_violin(alpha=.5) +
        geom_boxplot(width=0.1, outlier.size = 0.2, show.legend = F) +
        scale_fill_manual(values = {{list_colors}}) +
        ggtitle({{title}}) +
        theme_bw(base_size = {{font_size}}) +
        theme(
            strip.text=element_text(face="bold"),
            strip.background = element_rect(fill="white", colour="white"),
            axis.title = element_text(size = {{font_size}}/1.2, face="bold"),
            axis.text = element_text(size = {{font_size}}/2),
            legend.title = element_text(face="bold"),
            legend.key.size = unit(0.6,"line"),
            legend.position = "none",
            plot.title = element_text(size = {{font_size}}, face="bold"),
            panel.spacing.x = unit(1, "line")
        )
}


# -------------------------------------------------------------------------
bar_function <- function(df, x_axis, y_axis, make_fill, 
                         font_size, brewer_palette){
    ## Make horizontal bar plots to see differences in class and elemental composition
    
    ggplot(data=df, aes(x={{x_axis}}, y={{y_axis}}, fill={{make_fill}})) +
        geom_bar(position="fill", stat="identity", width=1, color = "black", size = 0.1) +
        coord_flip() +
        scale_fill_brewer(palette = {{brewer_palette}}) +
        scale_x_discrete(expand = c(0, 0)) +
        scale_y_continuous(labels = scales::percent_format(), expand = c(0,0)) +
        theme_bw(base_size = {{font_size}}) +
        theme(
            strip.text=element_text(face="bold"),
            strip.background = element_rect(fill="white", colour="white"),
            axis.title = element_blank(),
            axis.text = element_text(size = {{font_size}}-3),
            legend.title = element_blank(),
            legend.text = element_text(size = {{font_size}}-3),
            legend.key.size = unit(0.7,"line"),
            legend.position = "bottom",
        )
}


# -------------------------------------------------------------------------


















