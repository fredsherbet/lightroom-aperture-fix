# Tweak naming after Aperture import to Lightroom

After using [Adobe's Aperture importer](http://blogs.adobe.com/lightroomjournal/2014/10/aperture-import-plugin-now-available.html), you'll find all your Aperture projects have become Collection Sets in Lightroom, with a collection called 'Project Photos'.

Fair enough... but then when you sync them all to Lightroom Mobile, all the collections you see on your iPhone/iPad are called 'Project Photos'. Hardly helpful!

So, this script fixes it.

* Every collection called 'Project Photos' is renamed using its parent collection set
* Projects imported from Aperture that had no sub-albums are turned into a simple collection, rather than a collection set with one child collection.

Feel free to tweak the script to behave differently!

**MAKE A BACKUP OF YOUR CATALOG BEFORE RUNNING THIS SCRIPT**

## Install

### Mac

Create the Scripts folder, starting from your home directory, go to `Library/Application Support/Adobe/Lightroom` and create the `Scripts` folder in there. i.e. the following terminal command

    mkdir ~/Library/Application\ Support/Adobe/Lightroom/Scripts

Then copy or softlink `fix-collections.lua` into that folder.

If you already have Lightroom running, restart it, otherwise just start it. You should see a new scripts menu (has a funny symbol that looks a bit like an s, or a piece of paper), and in there you should see the fix-collections command.

**The script does not ask for confirmation, and has no dry-run function... it will just do its thing. _TAKE A BACKUP FIRST_**

### Windows

How have you even imported from Aperture?!
