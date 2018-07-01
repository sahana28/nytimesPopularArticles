# NYTimesPopularArticles 

      NYTimesPopularArticles is an app which shows the current popular articles in New York Times. You can search for articles and also read the full article 

# Frameworks and api’s used:

       Uses Alamofire installed through Cocoa Pods for network requests       
       Uses data from api ‘http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api- key=sample-key’ to get the articles and the details

# How to Use:
        Open the .xcworkspace file in the project folder 
        Choose the required simulator and run the project
        On running the app, activity indicator will be displayed for downloading data in the background
        After getting the data, a tableView containing all the popular articles in NYTimes will be shown
        Search bar at the top canoe used to search for articles in the list
        Selecting an article, shows detail view with a web view showing the full article and an image with related caption

# Testing :
        XCTesting is being used for unit testing
        For unit testing,navigate to the test file and click on play button next to the test function 
