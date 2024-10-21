lib.addCommand('ci', {
  help = 'Опишите своего персонажа',
}, function(source, args, raw)
  local charinfo = lib.callback.await('cp:setupCharMenu', source)
  db.createCharInfo({ id = source, charinfo = charinfo[1], tattosinfo = charinfo[2], clothes = charinfo[3]})
end)

lib.addCommand('cic', {
    help = 'Посмотрите описание персонажа',
    params = {
        {
            name = 'id',
            type = 'playerId',
            help = 'ID Игрока'
        }
    }
}, function (source, args, raw)
    TriggerClientEvent('cp:showCharInfo', source, args.id)
end)

function db.createCharInfo(data)
    return MySQL.prepare.await('INSERT INTO `cp_charinfo` (`id`, `charinfo`, `tattosinfo`, `clothes`) VALUES (?, ?, ?, ?)', { data.id, data.charinfo, data.tattosinfo, data.clothes })
end

lib.callback.register('cp:database:selectCharInfo', function (id)
    return MySQL.prepare.await('SELECT `charinfo`, `tattosinfo` FROM `cp_charinfo` WHERE `id` = ?', { id })
end)
