    if is_valid == true then
        -- getSourceFromIdentifier(destPlayer, function (srcTo)
        local telefono = vRP.getInventoryItemAmount({destPlayer,"phone"})
      if telefono >= 1 then
        if vRP.getUserSource({destPlayer}) ~= nil then
            srcTo = tonumber(vRP.getUserSource({destPlayer}))

            if srcTo ~= nil then
                AppelsEnCours[indexCall].receiver_src = srcTo
                -- TriggerEvent('gcPhone:addCall', AppelsEnCours[indexCall])
                TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
                TriggerClientEvent('gcPhone:waitingCall', srcTo, AppelsEnCours[indexCall], false)
            else
                TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
                Citizen.Wait(3000)
                TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[indexCall].transmitter_src, AppelsEnCours[indexCall], true)
                Citizen.Wait(700)
                TriggerClientEvent('InteractSound_CL:PlayOnOne',sourcePlayer,'segreteria',0.5)
                Citizen.Wait(8000)
                TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[indexCall].transmitter_src)
            end
        end
      else
        TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
        Citizen.Wait(3000)
        TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[indexCall].transmitter_src, AppelsEnCours[indexCall], true)
        Citizen.Wait(700)
        TriggerClientEvent('InteractSound_CL:PlayOnOne',sourcePlayer,'segreteria',0.5)
        Citizen.Wait(8000)
        TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[indexCall].transmitter_src)
      end
    else
        TriggerEvent('gcPhone:addCall', AppelsEnCours[indexCall])
        TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
    end

end)
