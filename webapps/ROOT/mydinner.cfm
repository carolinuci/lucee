<!--- Query to fetch all entries from the dinner_log table --->
<cfquery name="dinnerLogQuery" datasource="testdb">
    SELECT * 
    FROM dinner_log
    ORDER BY dinner_date DESC;
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dinner Log</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <h1>Dinner Log</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Meal Description</th>
                <th>Notes</th>
                <th>Created At</th>
            </tr>
        </thead>
        <tbody>
            <!--- Loop through the query results and display each record --->
            <cfoutput query="dinnerLogQuery">
                <tr>
                    <td>#id#</td>
                    <td>#dinner_date#</td>
                    <td>#meal_description#</td>
                    <td>#notes#</td>
                    <td>#created_at#</td>
                </tr>
            </cfoutput>
        </tbody>
    </table>
</body>
</html>
