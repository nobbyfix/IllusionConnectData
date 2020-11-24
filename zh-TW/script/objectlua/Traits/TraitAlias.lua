require("objectlua.Traits.TraitTransformation")

TraitAlias = TraitTransformation:subclass()

function TraitAlias:exclude()
end

function TraitAlias:setAliases()
end

function TraitAlias:collectMethodsForSymbolInto(aSymbol, aCollection)
end
