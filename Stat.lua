--[[
Copyright (c) 2013, Ricky Gall
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
    * Neither the name of <addon name> nor the
    names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]


_addon.name = 'STAT'
_addon.version = '1.0'
_addon.author = 'Nitrous (SHIVA),'Chev (Asura)'
_addon.command = 'stat'

require('tables')
require('sets')
res = require('resources')

windower.register_event('load', function()
    statSpell = { 
        ['paralysis']='Paralyna',
        ['doom']='Cursna',
		['curse']='Cursna',
        ['silence']='Silena',
        ['plague']='Viruna',
        ['disease']='Viruna',
        ['petrification']='Stona',
        ['poison']='Poisona',
        ['blindness']='Blindna',
		['charm']='Repose',
		['charm']='Repose',
		['Requiem']='Erase',
		['Nocturne']='Erase',
		['Burn']='Erase',
		['Frost']='Erase',
		['Choke']='Erase',
		['Rasp']='Erase',
		['Shock']='Erase',
		['Drown']='Erase', 
		['Dia']='Erase',
		['Bio']='Erase',
		['STR Down']='Erase',
		['DEX Down']='Erase',
		['VIT Down']='Erase',
		['AGI Down']='Erase',
		['INT Down']='Erase',
		['MND Down']='Erase',
		['CHR Down']='Erase',
		['Max HP Down']='Erase',
		['Max MP Down']='Erase',
		['Accuracy Down']='Erase',
		['Attack Down']='Erase',
		['Evasion Down']='Erase',
		['Defense Down']='Erase',
		['Magic Evasion Down']='Erase',
		['addle']='Erase',
		['MAX TP Down']='Erase',
		['Inhibit TP']='Erase',
		['slow']='Erase',
		['Helix']='Erase',
		['Elegy']='Erase'
		
		
    }
    --You may change this priority as you see fit this is my personal preference		
    priority = T{}
    priority[1] = 'charm'
    priority[2] = 'doom'
    priority[3] = 'curse'
    priority[4] = 'petrification'
    priority[5] = 'Paralysis'
    priority[6] = 'plague'
    priority[7] = 'silence'
    priority[8] = 'blindness'
    priority[9] = 'poison'
	priority[10] = 'disease'
	priority[11] = 'Requiem'
	priority[12] = 'Nocturne'
	priority[13] = 'Burn'
	priority[14] = 'Frost'
	priority[15] = 'Choke'
	priority[16] = 'Rasp'
	priority[17] = 'Shock'
	priority[18] = 'Drown'
	priority[19] = 'Dia'
	priority[20] = 'Bio'
	priority[21] = 'STR Down'
	priority[22] = 'DEX Down'
	priority[23] = 'VIT Down'
	priority[24] = 'AGI Down'
	priority[25] = 'INT Down'
	priority[25] = 'MND Down'
	priority[26] = 'CHR Down'
	priority[27] = 'Max HP Down'
	priority[28] = 'Max MP Down'
	priority[29] = 'Accuracy Down'
	priority[30] = 'Attack Down'
	priority[31] = 'Evasion Down'
	priority[32] = 'Defense Down'
	priority[33] = 'Magic Evasion Down'
	priority[34] = 'addle'
	priority[35] = 'Max TP Down'
	priority[36] = 'Inhibit TP'
	priority[37] = 'slow'
	priority[38] = 'Helix'
	priority[39] = 'Elegy'
	
	
	
    statusTable = S{}
end)

windower.register_event('addon command', function(...)
    if statusTable ~= nil then
        local player = windower.ffxi.get_player()
        for i = 1, 39 do
            if statusTable:contains(priority[i]) then
                windower.send_command('send @others /ma "'..statSpell[priority[i]]..'" '..player['name'])
                if priority[i] == 'doom' then
                    windower.send_command('input /item "Holy Water" '..player['name'])  --Auto Holy water for doom
                end
                return
            end
        end
        windower.add_to_chat(55,"You are not afflicted by a status that can be cured.")
    end
end)

windower.register_event('gain buff', function(id)
   local name = res.buffs[id].english
    if priority:contains(name) and not statusTable:contains(name) then
        statusTable:add(name)
    end
end)


windower.register_event('lose buff', function(id)
local name = res.buffs[id].english
if statusTable:contains(name) then
  statusTable:remove(name)
  end
end)
