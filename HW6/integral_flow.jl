

"""
Convert a list of floats to the ceiling of the sum, while for each new 
integerl, it's still within the ceiling and the floor of the original one. 
"""
f = 10*rand(5)
r = f|>copy
β̄ = ceil(sum(r))

for II in 1:length(r)
    if sum(r) < β̄
        r[II] = ceil(r[II])
    else
        r[II] = floor(r[II])
    end
end
