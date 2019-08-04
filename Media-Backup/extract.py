import pandas as pd

movies = 'Movies-Level 2-20190702-092222.csv'
movieData = pd.read_csv(movies)

movieTitles = movieData['Title']

movieTitles.to_csv('movieTitles.csv', index=False)

shows = 'TV Shows-Level 2-20190702-092627.csv'
showData = pd.read_csv(shows)

showTitles = showData['Series Title'].drop_duplicates()

showTitles.to_csv('showTitles.csv', index=False)