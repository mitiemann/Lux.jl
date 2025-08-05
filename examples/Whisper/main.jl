using Lux,
  Reactant

function sinusoids(len, channels, max_timescale=10000)
    log_timescale_increment = log(max_timescale) / (channels / 2 - 1)
    inv_timescales = exp(-log_timescale_increment) * range(1, channels / 2)
    scaled_time = range(1, len) * inv_timescales'
    return cat(sin.(scaled_time), cos.(scaled_time); dims=2)
end

# next step: figure out how to use my AMD GPU with Lux on my Linux computer
# also, add XLA tools from Slack communication with Avik
