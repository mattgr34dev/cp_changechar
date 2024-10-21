

local function setupCharMenu()
  local dialog = lib.inputDialog('Персонаж', {
    {type = 'input', label = 'Описание персонажа', description = 'Опишите своего персонажа', required = true, min = 4, max = 16},
    {type = 'input', label = 'Описание тату', description = 'Опишите свои тату', required = true, min = 4, max = 16},
    {type = 'input', label = 'Одежда', description = 'Опишите свою одежду', required = true, min = 4, max = 16},
  })

  return dialog
end

lib.callback.register('cp:setupCharMenu', function()
    return setupCharMenu()
end)

RegisterNetEvent('cp:showCharInfo', function (id)
  local source = GetPlayerFromServerId(id)
  local charinfo = lib.callback.await('cp:database:selectCharInfo', false, source)

  local alert = lib.alertDialog({
    header = 'Информация о персонаже',
    content = json.encode(charinfo, { indent = true, sort_keys = true }),
    centered = true,
    cancel = false
})
end)