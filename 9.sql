SELECT Title, Duration, Year, StreamDate FROM MOVIE NATURAL JOIN STREAM
WHERE Duration >= 140 && Year = YEAR(StreamDate) - 1;