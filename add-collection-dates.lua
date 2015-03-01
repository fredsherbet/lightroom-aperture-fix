local LrApplication = import 'LrApplication'
local LrDialogs = import 'LrDialogs'
local LrTasks = import 'LrTasks'
LrDialogs.message("Add date to collection", "Prefix collections with yyyy-mm of the photos in the collection")
catalog = LrApplication.activeCatalog()

function fix_import_date(collection)
  if not collection:getName():find("^%d%d%d%d") then
    -- Add the date of the first photo to the collection name, 
    -- in format yyyy-mm
    for k, photo in pairs(collection:getPhotos()) do
      date = photo:getFormattedMetadata('dateCreated'):sub(1, 7)
      if #date == 7 then
        collection:setName(date .. " " .. collection:getName())
        break
      end
    end
  end
end

function handle_set(set)
  for k, collection in pairs(set:getChildCollections()) do
    fix_import_date(collection)
  end
  for k, set in pairs(set:getChildCollectionSets()) do
    handle_set(set)
  end
end

function rename_events_collections()
  for k, set in pairs(catalog:getChildCollectionSets()) do
    if set:getName() == "Events" then
      handle_set(set)
    end
  end
  LrDialogs.message("Add date to collection", "Finished")
end

function main()
  catalog:withWriteAccessDo("Rename aperture collections", rename_events_collections)
end

-- Loop over collections 
LrTasks.startAsyncTask(main)

