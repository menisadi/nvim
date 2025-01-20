if true then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- return {
--   'nvzone/typr',
--   cmd = 'TyprStats',
--   dependencies = 'nvzone/volt',
--   opts = {},
-- }

return {
  'nvzone/typr',
  branch = 'dev',
  cmd = 'TyprStats',
  dependencies = { { 'nvzone/volt', branch = 'dev' } },
  opts = {},
}
