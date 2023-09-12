function CheckRev(str)
    if str==string.reverse(str) then
        print(str..' is palindrome')
    else
        print(str..' is not palindrome')
    end
end


function Executor()
    local n=0

    io.write('total inputs should be: ')
    n=tonumber(io.read())

    if n<=0 then
        print('invalid choice...')
        return
    end

    for i=n,1,-1
    do
        local str=io.read()
        CheckRev(str)
    end
end

Executor()