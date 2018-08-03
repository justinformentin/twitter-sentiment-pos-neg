library(ROAuth)
library(twitteR)

#Authentication to Twitter API
TwitterAuthentication<-function(){
  #API Credintials
  consumer_key <- "xxxx"
  consumer_secret <- "xxxx"
  access_token <- "xxxx"
  access_secret <- "xxxx"
  
  #Download SSL Certificates
  download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
  
  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
  
  #Calling API Authentication Endpoint
  cred <- OAuthFactory$new(consumerKey=consumer_key, 
                           consumerSecret=consumer_secret,
                           requestURL='https://api.twitter.com/oauth/request_token',
                           accessURL='https://api.twitter.com/oauth/access_token',
                           authURL='https://api.twitter.com/oauth/authorize')
  
  #Authentication Process (Pin no will Require)
  cred$handshake(cainfo="cacert.pem")
}

TwitterAuthentication()