//This example searches Twitter for a keyword and prints all the tweets it gets onto the screen.

// import the Twitter library
import twitter4j.*;
import twitter4j.api.*;
import twitter4j.auth.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.management.*;
import twitter4j.util.*;
import twitter4j.util.function.*;
import twitter4j.conf.ConfigurationBuilder;
import java.util.Date;

//Build an ArrayList to hold all of the words that we get from the imported tweets
ArrayList<String> words = new ArrayList();

void setup(){

//Set the size of the stage, and the background to black.
size(1050,1050);
background(0);  
   
// configure your Twitter login  
ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setOAuthConsumerKey();
cb.setOAuthConsumerSecret();
cb.setOAuthAccessToken();
cb.setOAuthAccessTokenSecret();

// create a new instance of the Twitter object. 
Twitter twitter = new TwitterFactory(cb.build()).getInstance(); 

//search twitter for something, could be a hashtag or a user. 
Query query = new Query ("#AltRight");

//how many results do you want to store? (it will take the most recent results each time the program runs)
query.count(100);
 
// Here we use try and catch statements. 
//This way, if Processing has trouble communicating with Twitter, it simply reverts to the "catch" and prints "can't connect", rather than breaking the code. 
try {
  
// Search Twitter for our query, defined above, and store the tweets in an array. 
  QueryResult result = twitter.search(query);
  ArrayList tweets = (ArrayList) result.getTweets();
 

//For however many tweets we've asked for, get those tweets and store the user and the message 
  for (int i = 0; i < tweets.size(); i++) { 
    Status t = (Status) tweets.get(i); 
    User u = (User) t.getUser();
    String user = u.getName();
    String msg = t.getText();

// then print that information to the console
   println("Tweet by " + user + ": " + msg);
 
    
    //Break the tweet into words 
      String[] input = msg.split(" "); //split on space
      for (int j = 0;  j < input.length; j++) {
       //Put each word into the words ArrayList
       words.add(input[j]);
      }  
    
  };
}
catch (TwitterException te) {
  println("Couldn't connect: " + te);
  };
}

void draw() {
  fill(0, 1);
  rect(0,0, width, height);
    if (keyPressed){
      noLoop();
    } else {
     
    int i = (frameCount % words.size());
    String word = words.get(i);
    
    fill(255, random(50, 150)); 
    textSize(random(10,30));
    text(word, random(width), random(height));
  }
}