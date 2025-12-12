DROP TABLE IF EXISTS earthquakes;

CREATE TABLE earthquakes (
    -- Space and Time (TIMESTAMPTZ)
    time TIMESTAMP WITH TIME ZONE NOT NULL,    -- Time of the earthquake event (e.g., 2025-11-30T23:16:37.461Z)
    updated TIMESTAMP WITH TIME ZONE NOT NULL, -- Time the event was last updated
    
    -- Location (NUMERIC)
    latitude NUMERIC,                          -- WGS84 Latitude in decimal degrees
    longitude NUMERIC,                         -- WGS84 Longitude in decimal degrees
    depth NUMERIC,                             -- Depth of the event in kilometers
    
    -- Magnitude (NUMERIC / TEXT)
    mag NUMERIC,                               -- The magnitude of the earthquake
    magType TEXT,                              -- The type of magnitude reported (e.g., "mww")
    magError NUMERIC,                          -- Standard error of the magnitude
    magNst INTEGER,                            -- Number of stations used to determine magnitude (INTEGER)

    -- Event details (TEXT)
    net TEXT,                                  -- Network that reported the event (e.g., "us")
    id TEXT PRIMARY KEY,                       -- Unique event ID (e.g., "us7000resq")
    place TEXT,                                -- Human-readable location description
    type TEXT,                                 -- Event type (e.g., "earthquake")
    status TEXT,                               -- Event status (e.g., "reviewed")
    
    -- Station and error metrics (NUMERIC / INTEGER)
    nst INTEGER,                               -- Number of stations used to determine the location (INTEGER)
    gap NUMERIC,                               -- Largest azimuthal gap in degrees
    dmin NUMERIC,                              -- Horizontal distance to the nearest station in degrees
    rms NUMERIC,                               -- Root mean square travel time residual in seconds
    horizontalError NUMERIC,                   -- Uncertainty of the horizontal position in km
    depthError NUMERIC,                        -- Uncertainty of the depth in km

    -- Source information (TEXT)
    locationSource TEXT,                       -- Source of the location data (e.g., "us", "nc")
    magSource TEXT                             -- Source of the magnitude data (e.g., "us", "nc")
);

\COPY earthquakes (time, latitude, longitude, depth, mag, magType, nst, gap, dmin, rms, net, id, updated, place, type, horizontalError, depthError, magError, magNst, status, locationSource, magSource) FROM '/data/data.csv' (FORMAT CSV, HEADER TRUE, NULL '');
