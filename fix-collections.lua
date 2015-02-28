local LrApplication = import 'LrApplication'
local LrDialogs = import 'LrDialogs'
local LrTasks = import 'LrTasks'
LrDialogs.message("Fix collections", "Fixing names of collections imported from Aperture")
catalog = LrApplication.activeCatalog()

function make_sure_named_nicely(collection)
  if collection:getName() == 'Project Photos' then
    -- Rename the collection based on its parent.
    collection:setName(collection:getParent():getName())
    if #collection:getParent():getChildren() == 1 then
      -- The Project Photos collection has no siblings, so move it up a level
      -- and delete the now empty collectionset it was inside.
      collection:setParent(collection:getParent():getParent())
      collection:getParent():delete()
    end
  end
end

function handle_set(set)
  for k, collection in pairs(set:getChildCollections()) do
    make_sure_named_nicely(collection)
  end
  for k, set in pairs(set:getChildCollectionSets()) do
    handle_set(set)
  end
end

function rename_everything()
  handle_set(catalog)
end

function main()
  catalog:withWriteAccessDo("Rename aperture collections", rename_everything)
end

-- Loop over collections 
LrTasks.startAsyncTask(main)

