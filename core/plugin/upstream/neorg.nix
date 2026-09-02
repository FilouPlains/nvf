_: {
    vim.notes.neorg = {
        enable = true;
        treesitter.enable = true;

        setupOpts.load = {
            "core.defaults".enable = true;
            "core.concealer" = {};
        };
    };
}
