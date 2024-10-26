Local M = {
        'echasnovski/mini.indentscope', version = false,
        event = 'BufReadPost'
    }

function M.config()
require('mini.indentscope').setup({
        draw = {
                delay  = 0,
                animation = gen_animation.quadratic({ easing = 'out', duration = 1000, unit = 'total' }),
            },
        symbol = '┇'
    })
end
return M
