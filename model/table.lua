
--[[---------------------------------------------------------
	Name: Inherit( t, base )
	Desc: Copies any missing data from base to t
-----------------------------------------------------------]]
function table.Inherit( t, base )

	for k, v in pairs( base ) do 
		if ( t[ k ] == nil ) then t[ k ] = v end
	end

	t[ "BaseClass" ] = base

	return t

end


--[[---------------------------------------------------------
	Name: Empty( tab )
	Desc: Empty a table
-----------------------------------------------------------]]
function table.Empty( tab )
	for k, v in pairs( tab ) do
		tab[ k ] = nil
	end
end

--[[---------------------------------------------------------
	Name: CopyFromTo( FROM, TO )
	Desc: Make TO exactly the same as FROM - but still the same table.
-----------------------------------------------------------]]
function table.CopyFromTo( from, to )

	-- Erase values from table TO
	table.Empty( to )

	-- Copy values over
	table.Merge( to, from )

end

--[[---------------------------------------------------------
	Name: HasValue
	Desc: Returns whether the value is in given table
-----------------------------------------------------------]]
function table.HasValue( t, val )
	for k, v in pairs( t ) do
		if ( v == val ) then return true end
	end
	return false
end



--[[---------------------------------------------------------
	Name: table.SortDesc( table )
	Desc: Like Lua's default sort, but descending
-----------------------------------------------------------]]
function table.SortDesc( t )
	return table.sort( t, function( a, b ) return a > b end )
end

--[[---------------------------------------------------------
	Name: table.SortByKey( table )
	Desc: Returns a table sorted numerically by Key value
-----------------------------------------------------------]]
function table.SortByKey( t, desc )

	local temp = {}

	for key, _ in pairs( t ) do table.insert( temp, key ) end
	if ( desc ) then
		table.sort( temp, function( a, b ) return t[ a ] < t[ b ] end )
	else
		table.sort( temp, function( a, b ) return t[ a ] > t[ b ] end )
	end

	return temp

end

--[[---------------------------------------------------------
	Name: table.Count( table )
	Desc: Returns the number of keys in a table
-----------------------------------------------------------]]
function table.Count( t )
	local i = 0
	for k in pairs( t ) do i = i + 1 end
	return i
end

--[[---------------------------------------------------------
	Name: table.Random( table )
	Desc: Return a random key
-----------------------------------------------------------]]
function table.Random( t )
	local rk = math.random( 1, table.Count( t ) )
	local i = 1
	for k, v in pairs( t ) do 
		if ( i == rk ) then return v, k end
		i = i + 1 
	end
end





function table.ToString( t, n, nice )
	local nl, tab  = "", ""
	if ( nice ) then nl, tab = "\n", "\t" end

	local str = ""
	if ( n ) then str = n .. tab .. "=" .. tab end
	return str .. "{" .. nl   .. "}"
end




function table.ForceInsert( t, v )

	if ( t == nil ) then t = {} end

	table.insert( t, v )

	return t

end


--[[---------------------------------------------------------
	Name: table.LowerKeyNames( table )
	Desc: Lowercase the keynames of all tables
-----------------------------------------------------------]]
function table.LowerKeyNames( Table )

	local OutTable = {}

	for k, v in pairs( Table ) do

		-- Recurse
		if ( istable( v ) ) then
			v = table.LowerKeyNames( v )
		end

		OutTable[ k ] = v

		if ( isstring( k ) ) then

			OutTable[ k ]  = nil
			OutTable[ string.lower( k ) ] = v

		end

	end

	return OutTable

end

--[[---------------------------------------------------------
	Name: table.LowerKeyNames( table )
	Desc: Lowercase the keynames of all tables
-----------------------------------------------------------]]
function table.CollapseKeyValue( Table )

	local OutTable = {}

	for k, v in pairs( Table ) do

		local Val = v.Value

		if ( istable( Val ) ) then
			Val = table.CollapseKeyValue( Val )
		end

		OutTable[ v.Key ] = Val

	end

	return OutTable

end



--[[---------------------------------------------------------
	A Pairs function
		Sorted by TABLE KEY
-----------------------------------------------------------]]
function SortedPairs( pTable, Desc )

	pTable = table.Copy( pTable )

	local SortedIndex = {}
	for k, v in pairs( pTable ) do
		table.insert( SortedIndex, k )
	end

	if ( Desc ) then
		table.sort( SortedIndex, function( a, b ) return a > b end )
	else
		table.sort( SortedIndex )
	end

	pTable.__SortedIndex = SortedIndex

	return fnPairsSorted, pTable, nil

end

--[[---------------------------------------------------------
	A Pairs function
		Sorted by VALUE
-----------------------------------------------------------]]
function SortedPairsByValue( pTable, Desc )

	pTable = table.Copy( pTable )

	local SortedIndex = {}
	for k, v in pairs( pTable ) do
		table.insert( SortedIndex, { key = k, val = v } )
	end

	if ( Desc ) then
		table.sort( SortedIndex, function( a, b ) return a.val > b.val end )
	else
		table.sort( SortedIndex, function( a, b ) return a.val < b.val end )
	end

	for k, v in pairs( SortedIndex ) do
		SortedIndex[ k ] = v.key
	end

	pTable.__SortedIndex = SortedIndex

	return fnPairsSorted, pTable, nil

end



--[[---------------------------------------------------------
	A Pairs function
-----------------------------------------------------------]]
function RandomPairs( pTable, Desc )

	pTable = table.Copy( pTable )

	local SortedIndex = {}
	for k, v in pairs( pTable ) do
		table.insert( SortedIndex, { key = k, val = math.random( 1, 1000 ) } )
	end

	if ( Desc ) then
		table.sort( SortedIndex, function(a,b) return a.val>b.val end )
	else
		table.sort( SortedIndex, function(a,b) return a.val<b.val end )
	end

	for k, v in pairs( SortedIndex ) do
		SortedIndex[ k ] = v.key
	end

	pTable.__SortedIndex = SortedIndex

	return fnPairsSorted, pTable, nil

end

--[[---------------------------------------------------------
	GetFirstKey
-----------------------------------------------------------]]
function table.GetFirstKey( t )
	local k, v = next( t )
	return k
end

function table.GetFirstValue( t )
	local k, v = next( t )
	return v
end

function table.GetLastKey( t )
	local k, v = next( t, table.Count(t) - 1 )
	return k
end

function table.GetLastValue( t )
	local k, v = next( t, table.Count(t) - 1 )
	return v
end

function table.FindNext( tab, val )
	local bfound = false
	for k, v in pairs( tab ) do
		if ( bfound ) then return v end
		if ( val == v ) then bfound = true end
	end

	return table.GetFirstValue( tab )
end

function table.FindPrev( tab, val )

	local last = table.GetLastValue( tab )
	for k, v in pairs( tab ) do
		if ( val == v ) then return last end
		last = v
	end

	return last

end

function table.GetWinningKey( tab )

	local highest = -10000
	local winner = nil

	for k, v in pairs( tab ) do
		if ( v > highest ) then 
			winner = k
			highest = v
		end
	end

	return winner

end

function table.KeyFromValue( tbl, val )
	for key, value in pairs( tbl ) do
		if ( value == val ) then return key end
	end
end



function table.KeysFromValue( tbl, val )
	local res = {}
	for key, value in pairs( tbl ) do
		if ( value == val ) then res[ #res + 1 ] = key end
	end
	return res
end

function table.Reverse( tbl )

	local len = #tbl
	local ret = {}

	for i = len, 1, -1 do
		ret[ len - i + 1 ] = tbl[ i ]
	end

	return ret

end

function table.ForEach( tab, funcname )

	for k, v in pairs( tab ) do
		funcname( k, v )
	end

end

function table.GetKeys( tab )

	local keys = {}
	local id = 1

	for k, v in pairs( tab ) do
		keys[ id ] = k
		id = id + 1
	end

	return keys

end