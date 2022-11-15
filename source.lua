--[[
    Version: 1.0.5
    Last Update: 14 / 11 / 2022 | Day / Month / Year
]]--

--// Source
function obfuscate(source,VarName,WaterMark)
        warn("Started obfuscate")
        local Variable = VarName or "Taurus_"
        local WM

        if source == nil then
            source = [[print("Hello World!")]]
        end

        local ticks = tick()

        if typeof(WaterMark) == "string" and WaterMark ~= nil then
            WM = "    "..tostring(WaterMark).." | Secure by Ghost-Ducky#7698"
        else
            WM = "    ".."WaterMark".." | Secure by Ghost-Ducky#7698"
        end

        WM = "--[[".."\n".. tostring(WM) .."\n".."]]--".."\n\n"

        local random_ = function(length)
            local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
            local code

            if math.random(1,2) == 1 then
                code = ""..letters[math.random(1,26)]
            else
                code = ""..tostring(letters[math.random(1,26)]):upper()
            end

            for i = 1, tonumber(length) do
                if math.random(1,2) == 1 then -- letters
                    local get_letters = letters[math.random(1,26)]
                    if math.random(1,2) == 1 then
                        code = code..tostring(get_letters):upper()
                    else
                        code = code..tostring(get_letters)
                    end
                else -- number
                    code = code..tostring(math.random(0,9))
                end
            end
            return tostring(code)
        end

        local StringToBinary = function(String)
            local BinaryString = {}

            for i, Character in ipairs(String:split'') do
                local Binary = ""
                local Byte = Character:byte()
                while Byte > 0 do
                    Binary = tostring(Byte % 2) .. Binary
                    Byte = math.modf(Byte / 2)
                end
                table.insert(BinaryString, string.format("%.8d", Binary))
            end

            return table.concat(BinaryString, " ")
        end

        local add_binary = function(number, s)
            local highest = 1

            local topic = {
                "Deobfuscate?",
                "Hello World!",
                "IronBrew Fork? Nope.",
                "PSU Fork? Nope.",
                "Touch some grass",
                "New update when?",
                "GhostyDuckyy",
                "Free obfuscator!",
                "E",
                random_(math.random(50,150)),
            }

            for i,v in pairs(topic) do
                if i > highest then
                    highest = i
                end
            end

            for i = 1, tonumber(number) do
                local str = [[local ]]..Variable..tostring(random_(math.random(10,12)))..[[ = ]]..'"'..StringToBinary(tostring(topic[math.random(1, tonumber(highest))]))..'"'.."; "
                s = s..str
            end

                return tostring(s)
            end

        local Random_Variable = {
            TableByte = random_(math.random(15,20)),
            Table_concat = random_(math.random(15,20)),
            Loadstring = random_(math.random(15,20)),
        }

        local troll_func = [[function() ]]..add_binary(math.random(30,50), "")..[[ end]]
        local troll_var = [[local ]]..Variable..tostring(random_(math.random(15,20)))..[[ = ]]..troll_func

        local SourceByte = ""
        for i = 1,string.len(source) do SourceByte = SourceByte..'"\\'..string.byte(source, i)..'", ' end
        local TableByte = [[local ]]..Variable..tostring(Random_Variable.TableByte)..[[ = {]]..SourceByte..[[}]]
        local Loadstring = [[local ]]..Variable..tostring(Random_Variable.Loadstring)..[[ = loadstring(table.concat({"\114", "\101", "\116", "\117", "\114", "\110", "\32", "\102", "\117", "\110", "\99", "\116", "\105", "\111", "\110", "\40", "\98", "\121", "\116", "\101", "\41", "\10", "\32", "\32", "\32", "\32", "\105", "\102", "\32", "\116", "\121", "\112", "\101", "\111", "\102", "\40", "\98", "\121", "\116", "\101", "\41", "\32", "\61", "\61", "\32", "\34", "\116", "\97", "\98", "\108", "\101", "\34", "\32", "\116", "\104", "\101", "\110", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\108", "\111", "\97", "\100", "\115", "\116", "\114", "\105", "\110", "\103", "\40", "\116", "\97", "\98", "\108", "\101", "\46", "\99", "\111", "\110", "\99", "\97", "\116", "\40", "\98", "\121", "\116", "\101", "\41", "\41", "\40", "\41", "\10", "\32", "\32", "\32", "\32", "\101", "\108", "\115", "\101", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\98", "\121", "\116", "\101", "\32", "\61", "\32", "\123", "\98", "\121", "\116", "\101", "\125", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\108", "\111", "\97", "\100", "\115", "\116", "\114", "\105", "\110", "\103", "\40", "\116", "\97", "\98", "\108", "\101", "\46", "\99", "\111", "\110", "\99", "\97", "\116", "\40", "\98", "\121", "\116", "\101", "\41", "\41", "\40", "\41", "\10", "\32", "\32", "\32", "\32", "\101", "\110", "\100", "\10", "\101", "\110", "\100", "\10",}))()]]
        local func = {
            [1] = Variable..tostring(Random_Variable.Loadstring),
            [2] = Variable..tostring(Random_Variable.TableByte),
        }

        local fake_code = function(number,r)
            local t = {}
                for i = 1, tonumber(number) do
                    local create_Var = Variable..tostring(random_(math.random(15,20)))
                    local random

                    if r ~= nil then
                        random = "return "..tostring(random_(tonumber(r)))
                    else
                        random = "return "..tostring(random_(math.clamp(1000, string.len(source) / 2, string.len(source))))
                    end

                    local byte = ""
                    for x = 1,string.len(random) do byte = byte..'"\\'..string.byte(random, x)..'", ' end
                    local fake = [[local ]]..create_Var..[[ = {]]..byte..[[}; ]]..[[local ]]..create_Var.." = "..func[1]..[[(]]..create_Var..[[); ]]
                    table.insert(t,fake)
                end

                return unpack(t)
            end

        local obfuscated = WM..troll_var.."; "..Loadstring.."; "..fake_code(math.random(2,4), math.random(400,600))..TableByte.."; "..[[local ]]..Variable..tostring(random_(math.random(15,20))).." = "..func[1].."("..func[2]..")".."; "..fake_code(math.random(2,4), math.random(string.len(source) / 2, string.len(source) * 2))
        setclipboard(obfuscated)
        warn("Done obfuscate in "..tostring(tick() - ticks).." second")
    return
end

--// Module
return function(source,CustomVarName,WaterMark)
    task.spawn(function()
        obfuscate(source,CustomVarName,WaterMark)
    end)
end
