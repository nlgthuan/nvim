require('lualine').setup(
    {
        options = {
            icons_enabled = false,
            section_separators = '',
            component_separators = '',
        },
        sections = {
            lualine_c = {{'filename', file_status = true, path = 1}},
        },
    }
)
