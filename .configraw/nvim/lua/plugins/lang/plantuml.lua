local nvim_soil_plugin = {
    'javiorfo/nvim-soil',

    -- Optional for puml syntax highlighting:
    dependencies = { 'javiorfo/nvim-nyctophilia' },

    lazy = true,
    ft = "plantuml",
    opts = {
        -- If you want to change default configurations

        -- If you want to use Plant UML jar version instead of the install version
        puml_jar = "~/Apps/plantuml.jar",

        -- If you want to customize the image showed when running this plugin
        image = {
            darkmode = true, -- Enable or disable darkmode
            format = "png",  -- Choose between png or svg

            -- This is a default implementation of using nsxiv to open the resultant image
            -- Edit the string to use your preferred app to open the image (as if it were a command line)
            -- Some examples:
            -- return "feh " .. img
            -- return "xdg-open " .. img
            execute_to_open = function(img)
                return "feh " .. img
            end
        }
    }
}

return {
    nvim_soil_plugin,
}
