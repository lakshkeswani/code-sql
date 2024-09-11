Here's a SQL query that should help you find the configuration for your segments:

SELECT 
    gl.NAME AS LEDGER_NAME,
    kfs.STRUCTURE_CODE,
    kfs.NAME AS STRUCTURE_NAME,
    kfsi.SEGMENT_CODE,
    kfsi.SEGMENT_NAME,
    kfsi.SEGMENT_NUMBER,
    kfs.SEGMENT_NUM AS TOTAL_SEGMENTS,
    kfsi.COLUMN_NAME,
    kfsi.VALUE_SET_CODE
FROM 
    GL_LEDGERS gl
JOIN 
    FND_KF_STRUCTURES_B kfs ON gl.CHART_OF_ACCOUNTS_ID = kfs.STRUCTURE_ID
JOIN 
    FND_KF_SEGMENT_INSTANCES kfsi ON kfs.STRUCTURE_ID = kfsi.STRUCTURE_ID
ORDER BY 
    gl.NAME, kfsi.SEGMENT_NUMBER;

This query joins several key tables:
- GL_LEDGERS: Contains information about your ledgers
- FND_KF_STRUCTURES_B: Defines the structure of your key flexfield (chart of accounts)
- FND_KF_SEGMENT_INSTANCES: Provides details about each segment

The query results will show:
- LEDGER_NAME: The name of each ledger
- STRUCTURE_CODE and STRUCTURE_NAME: Identifying information for the flexfield structure
- SEGMENT_CODE and SEGMENT_NAME: The code and name for each segment
- SEGMENT_NUMBER: The order of the segment in the structure (corresponds to SEGMENT1, SEGMENT2, etc. in GL_CODE_COMBINATIONS)
- TOTAL_SEGMENTS: The total number of segments in the structure
- COLUMN_NAME: The actual column name in GL_CODE_COMBINATIONS (usually SEGMENT1, SEGMENT2, etc.)
- VALUE_SET_CODE: The code for the value set used by this segment, which can give you information about the type of data it contains

To use this query:
1. Run it in your Oracle FSCM database
2. Look for familiar segment names like "Movement", "Balancing", "Cost Center", etc.
3. Note the corresponding SEGMENT_NUMBER and COLUMN_NAME for each

This will tell you which SEGMENT column in GL_CODE_COMBINATIONS contains each type of data.
