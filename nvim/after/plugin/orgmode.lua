local ok, orgmode = pcall(require, 'orgmode')
if not ok then return end

local conf = {
    org_agenda_files = {'~/org/*'}
}

orgmode.setup_ts_grammar()
orgmode.setup(conf)

local ok, bullets = pcall(require, 'org-bullets')
if not ok then return end

bullets.setup()

local ok, wk = pcall(require, 'which-key')
if not ok then return end

local org_maps = {
    o = {
        name = "+org",
        ['<TAB>'] = {function() orgmode.action("org_mappings.toggle_checkbox") end, 'toggle checkbox'}
    },
}
wk.register(org_maps)
