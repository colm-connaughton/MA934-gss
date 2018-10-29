function draw_interval_arrow(ax, x1, x2, y, text, xoffset, yoffset, fs)
    x3 = 0.5*(x1+x2)
    gap = 0.08
    ax[:annotate]("", xy=(x1, y), xycoords="data", xytext=(x3-gap/2, y), textcoords="data",
        arrowprops=Dict("facecolor"=>"black", "arrowstyle"=>"->", "linewidth"=>2))
    ax[:annotate]("", xy=(x3+gap/2, y), xycoords="data", xytext=(x2, y), textcoords="data",
        arrowprops=Dict("facecolor"=>"black", "arrowstyle"=>"<-", "linewidth"=>2))
    ax[:annotate](text, xy=(x3+xoffset, y+yoffset), xycoords="data", fontsize=fs)
end



function gssfigure1()
    ϕ = 0.5*(sqrt(5.0)-1.0)
    a = 0.0
    b = 1.0
    
    fig, (ax1, ax2) = subplots(1, 2, sharey=true, sharex=true, figsize=(10,5))
    
    
    fs = 15
    ax1[:set_xlim]([-0.1, 1.1])
    ax1[:set_ylim]([-0.1, 0.1])
    ax1[:set_xticks]([])
    ax1[:set_yticks]([])
    
    # Draw first plot
    c = a + ϕ*(b-a)
    x = a + b - c
    X = [a, c, b, x]
    Y = [0.0, 0.0 , 0.0, 0.0]
    col = [:green, :green , :green, :red]
    ax1[:scatter](X,Y, s=30, marker="o", c=col)
    
    # Remove the spines
    ax1[:spines]["top"][:set_visible](false)
    ax1[:spines]["bottom"][:set_visible](false)
    ax1[:spines]["left"][:set_visible](false)
    ax1[:spines]["right"][:set_visible](false)
    
    # Draw the x axis
    ax1[:annotate]("", xy=(-0.1, 0.0), xycoords="data", xytext=(1.1, 0.0), textcoords="data",
        arrowprops=Dict("arrowstyle"=>"-", "linewidth"=>2))
    
    # Add labels
    xoffset = -0.01
    yoffset = -0.02
    ann = [
        (a + xoffset, yoffset,"a"), 
        (c + xoffset, yoffset, "c"), 
        (b + xoffset, yoffset, "b"), 
        (x + xoffset, yoffset,"x"),
        (-0.08+xoffset, 0.075+yoffset,"Case 1: [a,c] is larger subinterval"),
        (0.5*(a+c) - 0.15, 0.0425+yoffset,"Case 1(A)"),
        (0.5*(x+b) - 0.15, -0.03+yoffset,"Case 1(B)")
    ]
    for item in ann
        ax1[:annotate](item[3], xy=(item[1], item[2]), xycoords="data", textcoords="data", fontsize=fs)
    end
    # Add interval arrows
    yoffset = -0.06
    draw_interval_arrow(ax1, a, c, yoffset, "p", -0.02, -0.005, fs)
    draw_interval_arrow(ax1, c, b, yoffset, "q", -0.02, -0.005, fs)
    draw_interval_arrow(ax1, x, c, yoffset-0.02, "r", -0.02, -0.005, fs)
    
    # Draw the sub-interval brackets
    ax1[:annotate]("",
                xy=(a, 0.01), xycoords="data",
                xytext=(c, 0.01), textcoords="data",
                arrowprops=Dict("arrowstyle"=>"-",
                                "color"=>"0.5",
                                "shrinkA"=>1, "shrinkB"=>1,
                                "patchA"=>nothing,
                                "patchB"=>nothing,
                                "connectionstyle"=>"bar,fraction=0.1",
                                )
                )
    ax1[:annotate]("",
                xy=(x, -0.025), xycoords="data",
                xytext=(b, -0.025), textcoords="data",
                arrowprops=Dict("arrowstyle"=>"-",
                                "color"=>"0.5",
                                "shrinkA"=>1, "shrinkB"=>1,
                                "patchA"=>nothing,
                                "patchB"=>nothing,
                                "connectionstyle"=>"bar,fraction=-0.1",
                                )
                )
    
    
    # Draw second plot
    c = b - ϕ*(b-a)
    x = a + b - c
    X = [a, c, b, x]
    Y = [0.0, 0.0 , 0.0, 0.0]
    col = [:green, :green , :green, :red]
    ax2[:scatter](X,Y, s=30, marker="o", c=col)
    
    # Remove the spines
    ax2[:spines]["top"][:set_visible](false)
    ax2[:spines]["bottom"][:set_visible](false)
    ax2[:spines]["left"][:set_visible](false)
    ax2[:spines]["right"][:set_visible](false)
    
    # Draw the x axis
    ax2[:annotate]("", xy=(-0.1, 0.0), xycoords="data", xytext=(1.1, 0.0), textcoords="data",
        arrowprops=Dict("arrowstyle"=>"-", "linewidth"=>2))
    
    # Add labels
    xoffset = -0.01
    yoffset = -0.02
    ann = [
        (a + xoffset, yoffset,"a"), 
        (c + xoffset, yoffset, "c"), 
        (b + xoffset, yoffset, "b"), 
        (x + xoffset, yoffset,"x"),
        (-0.08+xoffset, 0.075+yoffset,"Case 2: [c,b] is larger subinterval"),
        (0.5*(a+x) - 0.15, 0.0425+yoffset,"Case 2(A)"),
        (0.5*(c+b) - 0.15, -0.03+yoffset,"Case 2(B)")
    ]
    for item in ann
        ax2[:annotate](item[3], xy=(item[1], item[2]), xycoords="data", textcoords="data", fontsize=fs)
    end
    # Add interval arrows
    yoffset = -0.06
    draw_interval_arrow(ax2, a, c, yoffset, "q", -0.02, -0.005, fs)
    draw_interval_arrow(ax2, c, b, yoffset, "p", -0.02, -0.005, fs)
    draw_interval_arrow(ax2, c, x, yoffset-0.02, "r", -0.02, -0.005, fs)
    
     # Draw the sub-interval brackets
    ax2[:annotate]("",
                xy=(a, 0.01), xycoords="data",
                xytext=(x, 0.01), textcoords="data",
                arrowprops=Dict("arrowstyle"=>"-",
                                "color"=>"0.5",
                                "shrinkA"=>1, "shrinkB"=>1,
                                "patchA"=>nothing,
                                "patchB"=>nothing,
                                "connectionstyle"=>"bar,fraction=0.1",
                                )
                )
    ax2[:annotate]("",
                xy=(c, -0.025), xycoords="data",
                xytext=(b, -0.025), textcoords="data",
                arrowprops=Dict("arrowstyle"=>"-",
                                "color"=>"0.5",
                                "shrinkA"=>1, "shrinkB"=>1,
                                "patchA"=>nothing,
                                "patchB"=>nothing,
                                "connectionstyle"=>"bar,fraction=-0.1",
                                )
                )
    
    return fig, (ax1, ax2)
end

function gssfigure2()
    ϕ = 0.5*(sqrt(5.0)-1.0)
    a = 0.0
    b = 1.0
    
    fig, ax1 = subplots(figsize=(5,5))
    
    
    fs = 15
    ax1[:set_xlim]([-0.1, 1.1])
    ax1[:set_ylim]([-0.1, 0.1])
    ax1[:set_xticks]([])
    ax1[:set_yticks]([])
    
    # Draw first plot
    c = a + ϕ*(b-a)
    x = a + b - c
    X = [a, c, b, x]
    Y = [0.0, 0.0 , 0.0, 0.0]
    col = [:green, :green , :green, :red]
    ax1[:scatter](X,Y, s=30, marker="o", c=col)
    
    # Remove the spines
    ax1[:spines]["top"][:set_visible](false)
    ax1[:spines]["bottom"][:set_visible](false)
    ax1[:spines]["left"][:set_visible](false)
    ax1[:spines]["right"][:set_visible](false)
    
    # Draw the x axis
    ax1[:annotate]("", xy=(-0.1, 0.0), xycoords="data", xytext=(1.1, 0.0), textcoords="data",
        arrowprops=Dict("arrowstyle"=>"-", "linewidth"=>2))
    
    # Add labels
    xoffset = -0.01
    yoffset = -0.02
    ann = [
        (a + xoffset, yoffset,"a"), 
        (c + xoffset, yoffset, L"x_2"), 
        (b + xoffset, yoffset, "b"), 
        (x + xoffset, yoffset,L"x_1"),
        (0.5*(a+c) - 0.15, 0.0425+yoffset,"Case 1"),
        (0.5*(x+b) - 0.15, -0.03+yoffset,"Case 2")
    ]
    for item in ann
        ax1[:annotate](item[3], xy=(item[1], item[2]), xycoords="data", textcoords="data", fontsize=fs)
    end
    
    
    # Draw the sub-interval brackets
    ax1[:annotate]("",
                xy=(a, 0.01), xycoords="data",
                xytext=(c, 0.01), textcoords="data",
                arrowprops=Dict("arrowstyle"=>"-",
                                "color"=>"0.5",
                                "shrinkA"=>1, "shrinkB"=>1,
                                "patchA"=>nothing,
                                "patchB"=>nothing,
                                "connectionstyle"=>"bar,fraction=0.1",
                                )
                )
    ax1[:annotate]("",
                xy=(x, -0.025), xycoords="data",
                xytext=(b, -0.025), textcoords="data",
                arrowprops=Dict("arrowstyle"=>"-",
                                "color"=>"0.5",
                                "shrinkA"=>1, "shrinkB"=>1,
                                "patchA"=>nothing,
                                "patchB"=>nothing,
                                "connectionstyle"=>"bar,fraction=-0.1",
                                )
                )
    
    return fig, ax1
end

function gssfigure3(steps, position, width)
    phi = 0.5*(sqrt(5.0)-1.0)
    w = phi.^steps 
    
    fig, (ax1, ax2) = subplots(1, 2, figsize=(10,5))
    ax1[:axhline](color="black")
    ax1[:plot](steps, position, "ro-")
    ax1[:set_title]("Approach to root")
    ax1[:set_xlabel]("Number of steps, n")
    ax1[:set_ylabel]("Estimate of root, x")
    
    
    
    ax2[:semilogy](steps, width, "bo-", label="Golden section search")
    ax2[:plot](steps, w, "g-", label=L"Theoretical: $\phi^n$")
    ax2[:set_title]("Width of bracketing interval")
    ax2[:set_xlabel]("Number of steps, n")
    ax2[:set_ylabel]("b-a")
    legend()
    
    return fig, (ax1, ax2)
end
    