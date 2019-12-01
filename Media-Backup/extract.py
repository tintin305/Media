import pandas as pd

movieFileName = 'Moviescsv'
movieData = pd.read_csv(movieFileName)

movieTitles = movieData['Title']

movieTitles.to_csv('movieTitles.csv', index=False)

showFileName = 'TVShows.csv'
showData = pd.read_csv(showFileName)

showTitles = showData['Series Title'].drop_duplicates()

showTitles.to_csv('showTitles.csv', index=False)