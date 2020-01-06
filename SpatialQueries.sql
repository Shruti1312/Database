/*****************************************************
DATABASE USED : 11g
******************************************************/

/*****************************************************
Data creation for the 12 points/location in the university for calculating Convex Hull and Nearest Neighbour
****************************************************************************************************/

Drop table USC_Location;

CREATE TABLE USC_Location (
  loc_id NUMBER PRIMARY KEY,
  loc_Name VARCHAR2(15),
  shape MDSYS.SDO_GEOMETRY);

INSERT INTO USC_Location VALUES(
  1,
  'Home',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2817, 34.0294, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  2,
  'Uytengsu Aqua',
  MDSYS.SDO_GEOMETRY(
    2001, 
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2879, 34.0241, NULL),
    NULL,
    NULL)
);


INSERT INTO USC_Location VALUES(
  3,
  'Barbara',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2835, 34.0218, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  4,
  'Leavy Library',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2830, 34.0216, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  5,
  'McCarthy Way',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2822, 34.0210, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  6,
  'ALI',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2816, 34.0217, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  7,
  'Eileen Dental',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2866,34.0241, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  8,
  'Heritage Hall',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2864, 34.0228, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  9,
  'Physical Edu',
  MDSYS.SDO_GEOMETRY(
    2001,  -- 2-dimensional polygon
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2870, 34.0215, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  10,
  'SGM',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2891, 34.0219, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  11,
  'Ronald Tutor',
  MDSYS.SDO_GEOMETRY(
    2001,  
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2896, 34.0204, NULL),
    NULL,
    NULL)
);

INSERT INTO USC_Location VALUES(
  12,
  'Ethel Percy',
  MDSYS.SDO_GEOMETRY(
    2001, 
    NULL,
    MDSYS.SDO_POINT_TYPE(-118.2904, 34.0200, NULL),
    NULL,
    NULL)
);

/*****************************************************
Query1 : Calculating Convex Hull
*****************************************************/
SELECT SDO_AGGR_CONVEXHULL(MDSYS.SDOAGGRTYPE(shape, 0.005)) FROM usc_location;

/*****************************************************
Query2 : Calculating 4 Nearest Neighnours
*****************************************************/
SELECT * from (SELECT loc_name, SDO_GEOM.SDO_DISTANCE(shape, MDSYS.SDO_GEOMETRY( 2001, NULL, MDSYS.SDO_POINT_TYPE(-118.2817,34.0294, NULL), NULL, NULL), 0.005) dist from usc_location order by dist) where rownum <= 4 and dist != 0;


