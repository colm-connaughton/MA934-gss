module MA934Figures

using LaTeXStrings
using PyPlot

export gssfigure1, gssfigure2, gssfigure3


# Include the files containing the code for functions that plot the figures
include(joinpath("functions", "goldensectionsearch.jl"))
end
