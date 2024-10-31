curl --location --request POST 'https://beacon-cora-pr.maris.nl/api/query' \
    --header 'Authorization: Bearer $TOKEN' \
    --header 'Content-Type: application/json' \
    --data-raw '{
    "query_parameters": [
        {
            "column_name": "TEMP",
            "alias": "Temperature [degree_Celsius]"
        },
        {
            "column_name": "JULD",
            "alias": "Time [days since 1950-01-01 00:00:00 UTC]"
        },
        {
            "column_name": "DEPH",
            "alias": "Depth [meter]"
        },
        {
            "column_name": "LONGITUDE",
            "alias": "Longitude"
        },
        {
            "column_name": "LATITUDE",
            "alias": "Latitude"
        }
    ],
    "filters": [
        {
            "for_query_parameter": "Time [days since 1950-01-01 00:00:00 UTC]",
            "min": 21915,
            "max": 22280
        },
        {
            "for_query_parameter": "Depth [meter]",
            "min": 0,
            "max": 10
        },
        {
            "for_query_parameter": "Temperature [degree_Celsius]",
            "min": -2,
            "max": 38
        }
    ],
    "output": {
        "format": "netcdf"
    }
}'
