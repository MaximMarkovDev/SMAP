# SMAP

**Smart Pension Ruby Developer Test**

This is a script that receives a log as argument:

    ./main.rb log/webserver.log

And returns the following:

a. List of webpages with most page views ordered from most pages visits to less page visits:

    /home 90 visits
    /index 80 visits
    etc...


b. List of webpages with most unique page views ordered from most unique views to less unique views:


    /about/2 8 unique views
    /index 5 unique views
    etc...


To install all dependencies please run:

    bundle install

  

Script run command:

    ruby main.rb log/webserver.log

  

Specs run command:

    bundle exec rspec

  

Rubocop run command:

    bundle exec rubocop .

  

# Approach


To solve this task the TDD approach was used. tests were prepared in advance for methods that were implemented later, so this made it possible to avoid errors when executing this script.

To begin with, a method for reading data from a file was implemented. Then, in turn, methods for both points of the task were implemented.

The methods consist in a simple pass through the entire array with the selection of each url and the calculation of the necessary data for each.

 
# Possible improvements

 - Implement raise-rescue exception with custom exception handler
 - Test presence of input arguments (not implemented in this version
   because there were issues with ARGV passing into spec-files)
 - Implement CLI to avoid using puts and for better user experience.

