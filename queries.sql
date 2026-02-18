-- 1) Which songs have a video clip?
SELECT T.TrackName
FROM TRACK AS T, MEDIA AS M
WHERE T.TrackID = M.TrackID AND TrackVideoClip='Yes';

-- 2) Which songs reach a USA peak of 5 or less?
SELECT T.TrackName, M.USAPeak
FROM TRACK AS T, MEDIA AS M
WHERE T.TrackID = M.TrackID AND M.USAPeak <= 5 AND M.USAPeak != 0;

-- 3) Which Album has the most sales?
SELECT AlbumName, AlbumSales
FROM ALBUM
WHERE AlbumSales=(SELECT MAX(AlbumSales) FROM ALBUM);

-- 4) Which song is longest in duration?
SELECT TrackName, Duration
FROM TRACK
WHERE Duration=(SELECT MAX(Duration) FROM TRACK);

-- 5) Song with a videoclip and the most views?
SELECT T.TrackName, M.TrackVideoClip, M.VideoClipViews
FROM TRACK AS T, MEDIA AS M
WHERE T.TrackID = M.TrackID AND M.TrackVideoClip = 'Yes' AND M.VideoClipViews = (SELECT MAX(VideoClipViews) FROM MEDIA);

-- 6) Country pop songs in "Short n' Sweet" (AlbumID 1)
SELECT TrackName, TrackGenre
FROM TRACK
WHERE AlbumID = 1 AND TrackGenre='Country Pop';

-- 7) Genre of the most popular song (by Spotify Streams)
SELECT DISTINCT TrackGenre, TrackName
FROM TRACK
WHERE TrackID IN (SELECT TrackID FROM MEDIA WHERE SpotifyStreams = (SELECT MAX(SpotifyStreams) FROM MEDIA));

-- 8) How many tracks belong to each genre?
SELECT TrackGenre, COUNT(*) AS TrackCount
FROM TRACK
GROUP BY TrackGenre;
