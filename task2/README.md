# Provisioning Lab

## Timings

60 - 90 Minutes

## Summary

The developers have indicated that they'll need a mongodb database soon. We need to create a provisioning script that will create this server.

Research the method for installing and configuring a MongoDB server on your server.

Write the steps in to the provisioning script.

Start the machine and run the tests as follows:

```bash
cd tests
rake spec
```

## Hints

To get MongoDB to listen on 0.0.0.0 is a very minor change to the mongodb.conf file.

Research how this is done. But consider how you can automate the editing of this file with your provisioning script.

> HINT: You cannot edit a file with a provisioning script so you'll have to come up with another solution.


## Acceptance Criteria

* Uses vagrant file
* Create VM and Mongod is working
* MongoDB 3.2.20 is isntalled

## Extra time tomorrow -- Try to research and see if you can do it!
* MongoDB to listen on 0.0.0.0 on port 27017
* Work with command "vagrant up"
* All tests passing

* Documentation exists as README.md file
* Documentation includes: Intro (purpose of repo), Pre Requisits  and Intructions

* repo exists on github



