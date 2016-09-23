#   R CODE TO TAKE A STRING AND CREATE TEXT TIMING ELEMENTS
#   AUTHOR: DAN CASHION
#   CREATED         AUTHOR          COMMENTS
#   7/31/2016       dcashion        initial draft


require(twitteR)
consumer_key <- "t6mK7WsdOzBc66VW7ZWv1qibP"
consumer_secret <- "kTMidYTia0JsIujbAE5aiz69g3CKdvAqcdihvtbtKsGwoztwNA"
access_token <- "713968417-TGMM3HU3km456I6cr2JyCZmt6lYA9QyEYU4y5Gnq"
access_secret <- "Qq8YYiRAyjQISHYkkzdL37RcCLwassRVgilmkk67qnbyK"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# DEFINE SEARCH STRING
searchString <- "Trump"
# PING TWITTER WITH SEARCH TERM AND QUANTITY VARIABLE
rdmTweets <- searchTwitter(searchString, n = 50)

# CONVERT TO DATAFRAME
tweets_df <- twListToDF(rdmTweets)
#   writeLines(strwrap(tweets_df$text[10],60))

#   BUILD CORPUS AND START CLEANING DATA
library(tm)
library(nlp)
init_corpus <- Corpus(VectorSource(tweets_df$tweets))
init_corpus <- tm_map(init_corpus, content_transformer(tolower))

removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
removeNumPunct <- function(x) gsub("[^[:alpha:][:space:]]*", "", x)

init_corpus <- tm_map(init_corpus, content_transformer(removeURL))
init_corpus <- tm_map(init_corpus, content_transformer(removeNumPunct))

   #        Come back and add stopwords
init_corpus <- tm_map(init_corpus, stemDocument) # stem words
writeLines(strwrap(init_corpus[[10]]$content, 60))

## r refer card data mine now provid link packag cran packag

## mapreduc hadoop ad

stemCompletion2 <- function(x, dictionary) {

    x <- unlist(strsplit(as.character(x), " "))

    x <- x[x != ""]

    x <- stemCompletion(x, dictionary = dictionary)

    x <- paste(x, sep = "", collapse = " ")

    PlainTextDocument(stripWhitespace(x))

}

init_corpus <- lapply(init_corpus, stemCompletion2, dictionary = init_corpusCopy)

init_corpus <- Corpus(VectorSource(init_corpus))

writeLines(strwrap(init_corpus[[190]]$content, 60))