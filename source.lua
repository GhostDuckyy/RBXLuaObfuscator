--// Default
local setting = {
    CustomVariable = "Taurus_",
    WaterMark = "   Secure by Ghost-Ducky#7698",
}

--// Source
function obfuscate(source,VarName,WaterMark)
    local Variable = VarName or setting.CustomVariable
    local WM = WaterMark or setting.WaterMark
    source = source or [[print("Test")]]

    WM = "--[[".."\n".. tostring(WM) .."\n".."]]".."\n\n"

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

    local Random_Variable = {
        TableByte = random_(math.random(10,12)),
        Table_concat = random_(math.random(10,12)),
        Loadstring = random_(math.random(10,12)),
    }

    local troll_func = [==[function(a)local b;spawn(function()local c={}local d=crypt.base64encode or crypt.base64.encode or crypt.base64_encode;local e=crypt.base64decode or crypt.base64.decode or crypt.base64_decode;local f={1,2,3,4,5,6,7,8,9,10}local g={"a","b","c"}local h={}local i={"5ibvh6g7zei2lzuxlspz","owymz3ajce95kgqdy7ni","yyxn6vk36i8gf3o72oq3","qyvdei3ijpybjv4xcohu","y9flgfmxl8mer6htbavh","5ivawlo9m0vzronkk6jy","99tjzhntr6gyj2xjyoht","a7n46012hzsiyfz3rdz2","003kctapqphg4gyfihju","096266t1sn3rtiqqfrjg","0kx583tfz5w83eyyje6e","ec31yhmk6a0l33hd6d7j","00qaaclsgx9f9nt8123g","dhsyc5xm6xuztywzj7hz","mz1yc82u98y450328hhf","csm8b5kf5nve8ydcxf8e","d6di8yvsa7o6ezr7pp4i","uf9gmq0uvjis9i602eo9","ajr0tx8derrb844o4akf","vkaf1rt8jq2s92m37rze"}for j,k in pairs(i)do if typeof(k)=="string"then table.insert(h,d(k))end;task.wait(.1)end;table.clear(g)for j,k in pairs(h)do if typeof(k)=="string"then table.insert(g,e(k))end;task.wait(.1)end;for l=1,100 do if l>50 and 49<l and f[1]<l then b=e(a)end end;local m=[[01010111 00000000 01101000 00000000 01111001 00000000 00100000 00000000 01111001 00000000 01101111 00000000 01110101 00000000 00100000 00000000 01101100 00000000 01101111 00000000 01101111 00000000 01101011 00000000 00100000 00000000 01110100 00000000 01101000 00000000 01101001 00000000 01110011 00000000 00100000 00000000 01100010 00000000 01101001 00000000 01101110 00000000 01110010 00000000 01100001 00000000 01111001 00000000 00100000 00000000 01100011 00000000 01101111 00000000 01100100 00000000 01100101 00000000 00111111 00000000]]local n=[[01000001 00000000 01110010 00000000 01100101 00000000 00100000 00000000 01111001 00000000 01101111 00000000 01110101 00000000 00100000 00000000 01110100 00000000 01110010 00000000 01111001 00000000 01101001 00000000 01101110 00000000 01100111 00000000 00100000 00000000 01100100 00000000 01100101 00000000 01101111 00000000 01100010 00000000 01100110 00000000 01110101 00000000 01110011 00000000 01100011 00000000 01100001 00000000 01110100 00000000 01100101 00000000 00111111 00000000]]local o=string.len(m)+string.len(n)if o>1000 then loadstring("\32\32\32\32\114\101\116\117\114\110\32\112\114\105\110\116\40\34\71\101\116\32\84\114\111\108\108\101\100\34\41\10")()end;local l=[[4D 00 61 00 64 00 65 00 20 00 62 00 79 00 20 00 47 00 68 00 6F 00 73 00 74 00 2D 00 44 00 75 00 63 00 6B 00 79 00 23 00 37 00 36 00 39 00 38 00]]local p=[[53 00 65 00 63 00 75 00 72 00 65 00 20 00 62 00 79 00 20 00 47 00 68 00 6F 00 73 00 74 00 2D 00 44 00 75 00 63 00 6B 00 79 00 23 00 37 00 36 00 39 00 38 00]]local q=[[BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20 BC A6 C4 E3 CC AB C3 C0 20]]end)return b end]==]
    local troll_var = [[local ]]..Variable..tostring(random_(math.random(10,12)))..[[ = ]]..troll_func

    local SourceByte = ""
    for i = 1,string.len(source) do SourceByte = SourceByte..'"\\'..string.byte(source, i)..'", ' end
    local TableByte = [[local ]]..Variable..tostring(Random_Variable.TableByte)..[[ = {]]..SourceByte..[[}]]
    local Loadstring = [[local ]]..Variable..tostring(Random_Variable.Loadstring)..[[ = loadstring(table.concat({"\114", "\101", "\116", "\117", "\114", "\110", "\32", "\102", "\117", "\110", "\99", "\116", "\105", "\111", "\110", "\40", "\98", "\121", "\116", "\101", "\41", "\10", "\32", "\32", "\32", "\32", "\105", "\102", "\32", "\116", "\121", "\112", "\101", "\111", "\102", "\40", "\98", "\121", "\116", "\101", "\41", "\32", "\61", "\61", "\32", "\34", "\116", "\97", "\98", "\108", "\101", "\34", "\32", "\116", "\104", "\101", "\110", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\108", "\111", "\97", "\100", "\115", "\116", "\114", "\105", "\110", "\103", "\40", "\116", "\97", "\98", "\108", "\101", "\46", "\99", "\111", "\110", "\99", "\97", "\116", "\40", "\98", "\121", "\116", "\101", "\41", "\41", "\40", "\41", "\10", "\32", "\32", "\32", "\32", "\101", "\108", "\115", "\101", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\98", "\121", "\116", "\101", "\32", "\61", "\32", "\123", "\98", "\121", "\116", "\101", "\125", "\10", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\32", "\108", "\111", "\97", "\100", "\115", "\116", "\114", "\105", "\110", "\103", "\40", "\116", "\97", "\98", "\108", "\101", "\46", "\99", "\111", "\110", "\99", "\97", "\116", "\40", "\98", "\121", "\116", "\101", "\41", "\41", "\40", "\41", "\10", "\32", "\32", "\32", "\32", "\101", "\110", "\100", "\10", "\101", "\110", "\100", "\10",}))()]]
    local func = {
        [1] = Variable..tostring(Random_Variable.Loadstring),
        [2] = Variable..tostring(Random_Variable.TableByte),
    }

    local fake_code = function(number)
        local t = {}
        for i = 1, tonumber(number) do
            local create_Var = Variable..tostring(random_(math.random(10,12)))
            local random = "return "..tostring(random_(math.random(50,100)))
            local byte = ""
            for x = 1,string.len(random) do byte = byte..'"\\'..string.byte(random, x)..'", ' end
            local fake = [[local ]]..create_Var..[[ = {]]..byte..[[}; ]]..func[1]..[[(]]..create_Var..[[); ]]
            table.insert(t,fake)
        end
        return unpack(t)
    end

    local obfuscated = WM..troll_var.."; "..Loadstring.."; "..fake_code(math.random(2,4))..TableByte.."; "..func[1].."("..func[2]..")".."; "..fake_code(math.random(4,6))
    setclipboard(obfuscated)
    return obfuscated
end

--// Module
return function(source,CustomVarName,WaterMark)
    obfuscate(source,CustomVarName,WaterMark)
end
