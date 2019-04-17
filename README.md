# iScout

This entire project must be ran on Xcode IDE for macOS since this is an iOS application. Upon starting up Xcode the file that must be opened is the 'iScout.xcodeproj'. This is the project workspace that houses all of the confgurations needed to fun the application. Then to run it, simply hit the play button on the Xcode IDE to build and run the application on the simulator. If you get an building error the problem is that you will just simply have to change the 'Bundle Identifier' in the iScout project workspace. Currently the Bundle Identifier is 'Calling.iScout' appending any number(s) should make it run (ie. 'Calling.iScout1234', 'Calling.iScout001', etc.)

There are three main folders iScout, iScoutTests, iScoutUITests. 

Folder iScout houses the main application features, within this folder there are six main subfolders that implement the logic and UI of the application: 

      CustomCells - This houses individual custom cells for each table we use with in the application
      GPSdata - These are property lists that have specific GPS coordinates that get incoorporated into the map portion of the application
      Layers - These are the logic behind which layers get added or removed from the map as well as what images to display
      Models - These are classes that we use to incorporate specifics of which GPS data to use and where to display these on the map 
      Overlays - This is the logic of where to display the overlay layers with respect to the phone screen and the map scale
      ViewControllers - This is the logic behind every view that is displayed on the storyboard that directly interacts with the user
      
Folder iScoutTest houses the main test cases for the logic of the application. Currently we have not written any test cases for the logic of the application 

Folder iScoutUITests houses the main test cases for the UI portions of the application. Currently we have not written any test cases for the UI of the application
