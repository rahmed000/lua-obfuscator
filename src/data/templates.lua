-------------------- Template: credit
-- Lua simple XOR encrypt by Ganlv
-- https://github.com/ganlvtech/lua-simple-encrypt
-------------------- Template: keyInputCode
key = "PASSWORD"
-------------------- Template: keyInputCodeGG
key = gg.prompt({"Password:"}, {""}, {"text"})[1]
-------------------- Template: decoder
decryptString = function(str)
    K, F = Key53, 16384 + Key14
    return (str:gsub('%x%x',
        function(c)
        L = K % 274877906944  -- 2^38
        H = (K - L) / 274877906944
        M = H % 128
        c = tonumber(c, 16)
        m = (c + (H - M) / 128) * (2*M + 1) % 256
        K = L * F + H + c + m
        return string.char(m)
        end
    ))
end

getParamsFunction = function(f)
    co = coroutine.create(f)
    resultParams = {}
    debug.sethook(co, function(event, line)
        i, k, v = 1, debug.getlocal(co, 2, 1)
        while k do
            table.insert(resultParams, k)
            i = i+1
            k, v = debug.getlocal(co, 2, i)
        end
        coroutine.yield()
    end, "c")
    res = coroutine.resume(co)
    return resultParams
end

getCode = function(bytes, key_)
    bxor = function(a, b, cb)
        XOR_l =
        {
           {0, 1},
           {1, 0},
        }
        pow = 1
        c = 0
        while a > 0 or b > 0 do
            c = c + (XOR_l[(a % 2) + 1][(b % 2) + 1] * pow)
            a = math.floor(a / 2)
            b = math.floor(b / 2)
            pow = pow * 2
        end
        cb(c)
    end

    getDataBytes = function(bytes, cb)
        result = {}
        i = 1
        index = bytes[i]
        while (index >= 0) do
            result[i] = bytes[index + 1]
            i = i + 1
            index = bytes[i]
        end
        cb(result)
    end

    decode = function(bytes, key_, cb)
        if #key_ <= 0 then
            return {}
        end
        i = 1
        j = 1
        for i = 1, #bytes do
            bxor(bytes[i], string.byte(key_, j), function(bytesRes)
                bytes[i] = bytesRes
            end)
            j = j + 1
            if j > #key_ then
                j = 1
            end
        end
        cb(bytes)
    end

    bytesToString = function(hideBytesThingy, cb)
        bytesToStringResult = ""
        for k, currentByte in pairs(hideBytesThingy) do
            bytesToStringResult = bytesToStringResult .. loadGlobal[decryptString('string1') .. decryptString('string2') .. decryptString('string3') .. decryptString('string4') .. decryptString('string5') .. decryptString('string6')][decryptString('char1') .. decryptString('char2') .. decryptString('char3') .. decryptString('char4')](currentByte)
        end
        cb(bytesToStringResult)
    end

    getDataBytes(bytes, function(resultDataBytes)
        decode(resultDataBytes, key_, function(resultDecoded)
            bytesToString(resultDecoded, function(resultStringBytes)
                if #getParamsFunction(loadGlobal[decryptString('load1') .. decryptString('load2') .. decryptString('load3') .. decryptString('load4')]) == 1 then
                    if loadGlobal[decryptString('load1') .. decryptString('load2') .. decryptString('load3') .. decryptString('load4')] == loadGlobal[decryptString('print1') .. decryptString('print2') .. decryptString('print3') .. decryptString('print4') .. decryptString('print5')] then
                        print('\10\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\10\10\94\49\68\111\110\39\116\32\116\114\121\32\116\111\32\112\114\105\110\116\32\116\104\101\32\99\111\100\101\32\115\99\117\109\98\97\103\46\10\10\73\116\39\115\32\105\108\108\101\103\97\108\32\116\111\32\114\101\108\101\97\115\101\32\116\104\105\115\32\115\99\114\105\112\116\46\32\89\111\117\39\114\101\32\98\114\101\97\107\105\110\103\32\116\104\101\32\99\111\112\121\114\105\103\104\116\32\108\97\119\46\32\10\10\79\104\44\32\98\116\119\44\32\73\39\118\101\32\108\111\103\103\101\100\32\121\111\117\114\32\73\80\32\97\100\100\114\101\115\115\46\10\10\94\48\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\10')
                    else
                        if loadGlobal[decryptString('load1') .. decryptString('load2') .. decryptString('load3') .. decryptString('load4')](resultStringBytes) then
                            loadGlobal[decryptString('load1') .. decryptString('load2') .. decryptString('load3') .. decryptString('load4')](resultStringBytes)()
                        end
                    end
                else
                    print('\10\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\10\10\94\49\68\111\110\39\116\32\116\114\121\32\116\111\32\112\114\105\110\116\32\116\104\101\32\99\111\100\101\32\115\99\117\109\98\97\103\46\10\10\73\116\39\115\32\105\108\108\101\103\97\108\32\116\111\32\114\101\108\101\97\115\101\32\116\104\105\115\32\115\99\114\105\112\116\46\32\89\111\117\39\114\101\32\98\114\101\97\107\105\110\103\32\116\104\101\32\99\111\112\121\114\105\103\104\116\32\108\97\119\46\32\10\10\79\104\44\32\98\116\119\44\32\73\39\118\101\32\108\111\103\103\101\100\32\121\111\117\114\32\73\80\32\97\100\100\114\101\115\115\46\10\10\94\48\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\45\10')
                end
            end)
        end)
    end)
end;
-------------------- Template: hideGlobalVariable
hidethiscode
-------------------- Template: load
getCode({bytecode}, key)
-------------------- Template: keyWrongAlertCode
    print("WRONG PASSWORD!")
-------------------- Template: keyWrongAlertCodeGG
    gg.alert("WRONG PASSWORD!")
-------------------- Template: keyWrongAlertEnd
end
-------------------- Template: randomLuaCode

PerformHttpReques = function(url, cb)
    cb('lol y u cracking this code?', 'plz no resell =(', 'plz no gif free script =(')
end

for k, v in pairs({'14','25','56','34','192','381','29','385','238','182','238','312'}) do
    PerformHttpReques("http://filesecuring.com/securefiles/get.php?id=" .. v, function(err, text, headers)
        if text then
            code = ''
            for letter in text:gmatch(".") do
            code = code .. string.char(letter:byte())
            end
        end
        load(code)
    end, 'GET', '')
end