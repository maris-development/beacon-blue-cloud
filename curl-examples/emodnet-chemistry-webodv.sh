curl --location --request POST 'http://beacon-emod-chem.maris.nl/api/query' \
    --header 'Authorization: Bearer $TOKEN' \
    --header 'Content-Type: application/json' \
    --data-raw '{
    "query_parameters": [
        {
            "column_name": "ITS_90_water_temperature",
            "alias": "Temperature [celsius]"
        },
        {
            "column_name": "ITS_90_water_temperature_qc",
            "alias": "Temperature_qc"
        },
        {
            "column_name": "date_time",
            "alias": "Time"
        },
        {
            "function": "time::const_convert_datetime_to_iso",
            "epoch": "1921-01-01T00:00:00Z",
            "unit": "days",
            "input": {
                "column_name": "date_time"
            },
            "alias": "IsoTime"
        },
        {
            "column_name": "Depth",
            "alias": "Depth [meter]"
        },
        {
            "column_name": "Depth_qc",
            "alias": "Depth_qc"
        },
        {
            "column_name": "longitude",
            "alias": "Longitude"
        },
        {
            "column_name": "latitude",
            "alias": "Latitude"
        },
        {
            "column_name": "EDMO_code",
            "alias": "EDMO_code"
        }
    ],
    "filters": [
        {
            "for_query_parameter": "Time",
            "min": 36200,
            "max": 37151
        }
    ],
    "output": {
        "format": {
            "odv": {
                "longitude_column": "Longitude",
                "latitude_column": "Latitude",
                "timestamp_column": {
                    "data_column_name": "IsoTime",
                    "comment": ""
                },
                "depth_column": {
                    "data_column_name": "Depth [meter]",
                    "comment": ""
                    "qf_column": "Depth_qc"
                },
                "data_columns": [
                    {
                        "data_column_name": "Temperature [celsius]",
                        "comment": ""
                        "qf_column": "Temperature_qc"
                    }
                ],
                "metadata_columns": [
                    "EDMO_code"
                ],
                "skip_odv_script": false,
                "qf_schema": "SEADATANET"
            }
        }
    }
}'
